From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH 4/4] i3c: master: dw: reattach device on first available location of address table
Date: Thu, 29 Aug 2019 12:19:35 +0200
Message-ID: <e03fb41054a8431b27cc84c3d83ada9464172ef7.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

For today the reattach function only update the device address on the
controller.

Update the location to the first available too, will optimize the
enumeration process avoiding additional checks to keep the available
positions on address table consecutive.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1d83c97..62261ac 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -898,6 +898,22 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int pos;
+
+	pos = dw_i3c_master_get_free_pos(master);
+
+	if (data->index > pos && pos > 0) {
+		writel(0,
+		       master->regs +
+		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+
+		master->addrs[data->index] = 0;
+		master->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		master->addrs[pos] = dev->info.dyn_addr;
+		master->free_pos &= ~BIT(pos);
+	}
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
 	       master->regs +
-- 
2.7.4
