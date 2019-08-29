From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH 2/4] i3c: master: Check if devices have i3c_dev_boardinfo on i3c_master_add_i3c_dev_locked()
Date: Thu, 29 Aug 2019 12:19:33 +0200
Message-ID: <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

The I3C devices described in DT might not be attached to the master which
doesn't allow to assign a specific dynamic address.

This patch check if a device has i3c_dev_boardinfo and add it to
i3c_dev_desc structure. In this conditions, the framework will try to
assign the i3c_dev_boardinfo->init_dyn_addr even if stactic address = 0.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 4d29e1f..85fbda6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1795,6 +1795,23 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+static struct i3c_dev_boardinfo *
+i3c_master_search_i3c_boardinfo(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+	struct i3c_dev_boardinfo *boardinfo;
+
+	if (dev->boardinfo)
+		return NULL;
+
+	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
+		if (dev->info.pid == boardinfo->pid)
+			return boardinfo;
+	}
+
+	return NULL;
+}
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -1816,6 +1833,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 {
 	struct i3c_device_info info = { .dyn_addr = addr };
 	struct i3c_dev_desc *newdev, *olddev;
+	struct i3c_dev_boardinfo *boardinfo;
 	u8 old_dyn_addr = addr, expected_dyn_addr;
 	struct i3c_ibi_setup ibireq = { };
 	bool enable_ibi = false;
@@ -1875,6 +1893,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_detach_dev;
 
+	boardinfo = i3c_master_search_i3c_boardinfo(newdev);
+	if (boardinfo)
+		newdev->boardinfo = boardinfo;
+
 	/*
 	 * Depending on our previous state, the expected dynamic address might
 	 * differ:
-- 
2.7.4
