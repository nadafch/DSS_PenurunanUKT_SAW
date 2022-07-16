<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM penilaian WHERE id_penilaian='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE penilaian SET nim='$_POST[nim]', id_kriteria='$_POST[id_kriteria]', id_alternatif='$_POST[id_alternatif]',  id_bobot='$_POST[id_bobot]', id_skala='$_POST[id_skala]' WHERE id_penilaian='$_GET[key]'";
	} else {
		$sql = "INSERT INTO penilaian VALUES (NULL, '$_POST[nim]', '$_POST[id_kriteria]', '$_POST[id_alternatif]', '$_POST[id_bobot]', '$_POST[id_skala]')";
		$validasi = true;
	}

	if ($validasi) {
		$q = $connection->query("SELECT id_penilaian FROM penilaian WHERE nim=$_POST[nim] AND id_kriteria=$_POST[id_kriteria] AND id_alternatif LIKE '%$_POST[id_alternatif]%' AND id_bobot=$_POST[id_bobot] AND id_skala=$_POST[id_skala]");
		if ($q->num_rows) {
			echo alert("Penilaian sudah ada!", "?page=penilaian");
			$err = true;
		}
	}

  if (!$err AND $connection->query($sql)) {
    echo alert("Berhasil!", "?page=penilaian");
  } else {
		echo alert("Gagal!", "?page=penilaian");
  }
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM penilaian WHERE id_penilaian='$_GET[key]'");
	echo alert("Berhasil!", "?page=penilaian");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
									<div class="form-group">
	                  <label for="nim">NIM</label>
										<select class="form-control" name="nim" id="nim">
											<option>---</option>
											<?php $sql = $connection->query("SELECT * FROM mahasiswa") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["nim"]?>" <?= (!$update) ?: (($row["nim"] != $data["nim"]) ?: 'selected="selected"') ?>><?=$data["nim"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
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
	                  <label for="id_alternatif">Alternatif</label>
										<select class="form-control" name="id_alternatif" id="id_alternatif">
											<option>---</option>
											<?php $sql = $connection->query("SELECT * FROM alternatif") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["id_alternatif"]?>" class="<?=$data["nm_alternatif"]?>" <?= (!$update) ?: (($row["id_alternatif"] != $data["id_alternatif"]) ?: 'selected="selected"') ?>><?=$data["nm_alternatif"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
									<div class="form-group">
	                  <label for="id_bobot">Bobot</label>
										<select class="form-control" name="id_bobot" id="id_bobot">
											<option>---</option>
											<?php $sql = $connection->query("SELECT id_bobot,sifat FROM bobot GROUP BY sifat") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["id_bobot"]?>" class="<?=$data["id_bobot"]?>" <?= (!$update) ?: (($row["id_bobot"] != $data["id_bobot"]) ?: 'selected="selected"') ?>><?=$data["sifat"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
									<div class="form-group">
	                  <label for="id_skala">Skala</label>
										<select class="form-control" name="id_skala" id="id_skala">
											<option>---</option>
											<?php $sql = $connection->query("SELECT id_skala,keterangan FROM skala") ?>
											<?php while ($data = $sql->fetch_assoc()): ?>
												<option value="<?=$data["id_skala"]?>" class="<?=$data["id_skala"]?>" <?= (!$update) ?: (($row["id_skala"] != $data["id_skala"]) ?: 'selected="selected"') ?>><?=$data["keterangan"]?></option>
											<?php endwhile; ?>
										</select>
									</div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=penilaian" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR PENILAIAN</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>NIM</th>
	                        <th>Id Kriteria</th>
	                        <th>Id Alternatif</th>
							<th>Id Bobot</th>
							<th>Id Skala</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM penilaian")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['nim']?></td>
	                            <td><?=$row['id_kriteria']?></td>
	                            <td><?=$row['id_alternatif']?></td>
								<td><?=$row['id_bobot']?></td>
								<td><?=$row['id_skala']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=penilaian&action=update&key=<?=$row['id_penilaian']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=penilaian&action=delete&key=<?=$row['id_penilaian']?>" class="btn btn-danger btn-xs">Hapus</a>
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

<script type="text/javascript">
$("#kriteria").chained("#mahasiswa");
</script>
