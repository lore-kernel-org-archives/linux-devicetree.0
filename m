From: Chris Bostic <christopher.lee.bostic@gmail.com>
Subject: [PATCH 06/16] drivers/fsi: Add slave definition
Date: Tue,  6 Dec 2016 18:14:27 -0600
Message-ID: <1481069677-53660-7-git-send-email-christopher.lee.bostic@gmail.com>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, sre@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org, Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Add the initial fsi slave device, which is private to the core code.
This will be a child of the master, and parent to endpoint devices.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce9428d..60a6d91 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,6 +21,15 @@
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
+struct fsi_slave {
+	struct device		dev;
+	struct fsi_master	*master;
+	int			link;
+	uint8_t			id;
+};
+
+#define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
+
 /* FSI master support */
 
 int fsi_master_register(struct fsi_master *master)
-- 
1.8.2.2
