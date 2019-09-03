From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v2 2/5] i3c: master: make sure ->boardinfo is initialized in add_i3c_dev_locked()
Date: Tue,  3 Sep 2019 12:35:51 +0200
Message-ID: <d8db2c6d6ebb5c1dc577593b353847bd312fd6c0.1567437955.git.vitor.soares@synopsys.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <cover.1567437955.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567437955.git.vitor.soares@synopsys.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The newdev->boardinfo assignment was missing in
i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
propagated to  i3c_dev_desc.

Fix this by trying to initialize device i3c_dev_boardinfo if available.

Cc: <stable@vger.kernel.org>
Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Changes in v2:
  - Change commit message
  - Change i3c_master_search_i3c_boardinfo(newdev) to
  i3c_master_init_i3c_dev_boardinfo(newdev)
  - Add fixes, stable tags

 drivers/i3c/master.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 586e34f..9fb99bc 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1798,6 +1798,22 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+static void i3c_master_init_i3c_dev_boardinfo(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+	struct i3c_dev_boardinfo *boardinfo;
+
+	if (dev->boardinfo)
+		return;
+
+	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
+		if (dev->info.pid == boardinfo->pid) {
+			dev->boardinfo = boardinfo;
+			return;
+		}
+	}
+}
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -1818,8 +1834,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr)
 {
 	struct i3c_device_info info = { .dyn_addr = addr };
-	struct i3c_dev_desc *newdev, *olddev;
 	u8 old_dyn_addr = addr, expected_dyn_addr;
+	enum i3c_addr_slot_status addrstatus;
+	struct i3c_dev_desc *newdev, *olddev;
 	struct i3c_ibi_setup ibireq = { };
 	bool enable_ibi = false;
 	int ret;
@@ -1878,6 +1895,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_detach_dev;
 
+	i3c_master_init_i3c_dev_boardinfo(newdev);
+
 	/*
 	 * Depending on our previous state, the expected dynamic address might
 	 * differ:
@@ -1895,7 +1914,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	else
 		expected_dyn_addr = newdev->info.dyn_addr;
 
-	if (newdev->info.dyn_addr != expected_dyn_addr) {
+	addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
+						  expected_dyn_addr);
+
+	if (newdev->info.dyn_addr != expected_dyn_addr &&
+	    addrstatus == I3C_ADDR_SLOT_FREE) {
 		/*
 		 * Try to apply the expected dynamic address. If it fails, keep
 		 * the address assigned by the master.
-- 
2.7.4
