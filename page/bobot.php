<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM bobot WHERE id_bobot='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE bobot SET id_kriteria=$_POST[id_kriteria], sifat='$_POST[sifat]', bobot='$_POST[bobot]' WHERE id_bobot='$_GET[key]'";
	} else {
		$sql = "INSERT INTO bobot VALUES (NULL, $_POST[id_kriteria], '$_POST[sifat]', '$_POST[bobot]')";
		$validasi = true;
	}

	if ($validasi) {
		$q = $connection->query("SELECT id_bobot FROM bobot WHERE id_kriteria=$_POST[id_kriteria] AND nm_kriteria LIKE '%$_POST[nm_kriteria]%'");
		if ($q->num_rows) {
			echo alert("Bobot sudah ada!", "?page=bobot");
			$err = true;
		}
	}

  if (!$err AND $connection->query($sql)) {
		echo alert("Berhasil!", "?page=bobot");
	} else {
		echo alert("Gagal!", "?page=bobot");
	}
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM bobot WHERE id_bobot='$_GET[key]'");
	echo alert("Berhasil!", "?page=bobot");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
									<div class="form-group">
										<label for="id_kriteria">Kriteria</label>
										<select class="form-control" name="id_kriteria">
											<option>---</option>
											<?php $query = $connection->query("SELECT * FROM kriteria"); while ($data = $query->fetch_assoc()): ?>
												<option value="<?=$data["id_kriteria"]?>" <?= (!$update) ?: (($row["id_kriteria"] != $data["id_kriteria"]) ?: 'selected="on"') ?>><?=$data["nm_kriteria"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
									<div class="form-group">
	                  <label for="sifat">Sifat</label>
										<select class="form-control" name="sifat">
											<option>---</option>
											<option value="benefit" <?= (!$update) ?: (($row["sifat"] != "benefit") ?: 'selected="on"') ?>>Benefit</option>
											<option value="cost" <?= (!$update) ?: (($row["sifat"] != "cost") ?: 'selected="on"') ?>>Cost</option>
										</select>
										<div class="form-group">
	                    <label for="bobot">Bobot</label>
	                    <input type="text" name="bobot" class="form-control" <?= (!$update) ?: 'value="'.$row["bobot"].'"' ?>>
	                </div>
									</div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=bobot" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR BOBOT</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
							<th>No</th>
	                        <th>Id Kriteria</th>
	                        <th>Sifat</th>
	                        <th>Bobot</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM bobot")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['id_kriteria']?></td>
	                            <td><?=$row['sifat']?></td>
								<td><?=$row['bobot']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=bobot&action=update&key=<?=$row['id_bobot']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=bobot&action=delete&key=<?=$row['id_bobot']?>" class="btn btn-danger btn-xs">Hapus</a>
	                                </div>
	                            </td>
	                        </tr>
	                        <?php endwhile ?>
	                    <?php endif ?>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
