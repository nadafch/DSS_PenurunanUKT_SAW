<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM alternatif WHERE id_alternatif='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE alternatif SET nm_alternatif='$_POST[nm_alternatif]' WHERE id_alternatif='$_GET[key]'";
	} else {
		$sql = "INSERT INTO alternatif VALUES (NULL, '$_POST[nm_alternatif]')";
		$validasi = true;
	}

	if ($validasi) {
		$q = $connection->query("SELECT id_alternatif FROM alternatif WHERE nm_alternatif LIKE '%$_POST[nm_alternatif]%'");
		if ($q->num_rows) {
			echo alert("Alterantif sudah ada!", "?page=alternatif");
			$err = true;
		}
	}

  if (!$err AND $connection->query($sql)) {
    echo alert("Berhasil!", "?page=alternatif");
  } else {
		echo alert("Gagal!", "?page=alternatif");
  }
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM alternatif WHERE id_alternatif='$_GET[key]'");
	echo alert("Berhasil!", "?page=alternatif");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER['REQUEST_URI']?>" method="POST">
	                <div class="form-group">
	                    <label for="nama">Nama Alternatif</label>
	                    <input type="text" name="nm_alternatif" class="form-control" <?= (!$update) ?: 'value="'.$row["nm_alternatif"].'"' ?>>
	                </div>
	                <button type="submit" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block">Simpan</button>
	                <?php if ($update): ?>
										<a href="?page=alternatif" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>Nama Alternatif</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM alternatif")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
	                            <td><?=$row['nm_alternatif']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=alternatif&action=update&key=<?=$row['id_alternatif']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=alternatif&action=delete&key=<?=$row['id_alternatif']?>" class="btn btn-danger btn-xs">Hapus</a>
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
