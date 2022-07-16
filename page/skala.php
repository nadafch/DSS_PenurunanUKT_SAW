<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM skala WHERE id_skala='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE skala SET keterangan='$_POST[keterangan]' WHERE id_skala='$_GET[key]'";
	} else {
		$sql = "INSERT INTO skala VALUES (NULL, '$_POST[keterangan]')";
		$validasi = true;
	}

	if ($validasi) {
		$q = $connection->query("SELECT id_skala FROM skala WHERE keterangan LIKE '%$_POST[keterangan]%'");
		if ($q->num_rows) {
			echo alert("Skala sudah ada!", "?page=skala");
			$err = true;
		}
	}

  if (!$err AND $connection->query($sql)) {
    echo alert("Berhasil!", "?page=skala");
  } else {
		echo alert("Gagal!", "?page=skala");
  }
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM skala WHERE id_skala='$_GET[key]'");
	echo alert("Berhasil!", "?page=skala");
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
										<select class="form-control" name="id_kriteria" id="id_kriteria">
											<option>---</option>
											<?php $sql = $connection->query("SELECT * FROM kriteria") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["id_kriteria"]?>" class="<?=$data["nm_kriteria"]?>" <?= (!$update) ?: (($row["id_kriteria"] != $data["id_kriteria"]) ?: 'selected="selected"') ?>><?=$data["nm_kriteria"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
	                <div class="form-group">
	                    <label for="keterangan">Keterangan</label>
	                    <input type="text" name="keterangan" class="form-control" <?= (!$update) ?: 'value="'.$row["keterangan"].'"' ?>>
	                </div>
                    <div class="form-group">
	                    <label for="nama">Nama Skala</label>
	                    <input type="text" name="nm_skala" class="form-control" <?= (!$update) ?: 'value="'.$row["nm_skala"].'"' ?>>
	                </div>
                    <div class="form-group">
	                    <label for="nama">Value</label>
	                    <input type="text" name="value" class="form-control" <?= (!$update) ?: 'value="'.$row["value"].'"' ?>>
	                </div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=skala" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR SKALA</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>Id Kriteria</th>
                            <th>Keterangan</th>
                            <th>Nama Skala</th>
                            <th>Value</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM skala")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['id_kriteria']?></td>
	                            <td><?=$row['keterangan']?></td>
	                            <td><?=$row['nm_skala']?></td>
	                            <td><?=$row['value']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=skala&action=update&key=<?=$row['id_skala']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=skala&action=delete&key=<?=$row['id_skala']?>" class="btn btn-danger btn-xs">Hapus</a>
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
