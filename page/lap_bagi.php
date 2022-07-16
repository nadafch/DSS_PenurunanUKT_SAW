<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Bagi</h3></div>
	        <div class="panel-body">
				<!-- <form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
					<label for="tahun">Tahun :</label>
					<select class="form-control" name="tahun">
						<option>---</option>
						<option value="2017">2017</option>
					</select>
					<button type="submit" class="btn btn-primary">Tampilkan</button>
				</form> -->
				<table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
	                        <th>Id Kriteria</th>
	                        <th>Sifat</th>
	                        <th>Bobot</th>
	                        <th>Bagi</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT * FROM bagi")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
								<td><?=$row['id_kriteria']?></td>
								<td><?=$row['sifat']?></td>
								<td><?=$row['bobot']?></td>
								<td><?=$row['bagi']?></td>
	                        </tr>
	                        <?php endwhile ?>
	                    <?php endif ?>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
