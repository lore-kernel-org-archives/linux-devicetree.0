From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 07/28] bus: mvebu-mbus: Factor out initialization details
Date: Tue, 23 Jul 2013 10:31:11 -0300
Message-ID: <1374586292-4941-8-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

We introduce a common initialization function mvebu_mbus_common_init()
that will be used by both legacy and device-tree initialization code.
This patch is an intermediate step, which will allow to introduce the
DT binding for this driver in a less intrusive way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/bus/mvebu-mbus.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 827468a..1b17954 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -847,26 +847,14 @@ static __init int mvebu_mbus_debugfs_init(void)
 }
 fs_initcall(mvebu_mbus_debugfs_init);
 
-int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
-			   size_t mbuswins_size,
-			   phys_addr_t sdramwins_phys_base,
-			   size_t sdramwins_size)
+static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
+					 phys_addr_t mbuswins_phys_base,
+					 size_t mbuswins_size,
+					 phys_addr_t sdramwins_phys_base,
+					 size_t sdramwins_size)
 {
-	struct mvebu_mbus_state *mbus = &mbus_state;
-	const struct of_device_id *of_id;
 	int win;
 
-	for (of_id = of_mvebu_mbus_ids; of_id->compatible; of_id++)
-		if (!strcmp(of_id->compatible, soc))
-			break;
-
-	if (!of_id->compatible) {
-		pr_err("could not find a matching SoC family\n");
-		return -ENODEV;
-	}
-
-	mbus->soc = of_id->data;
-
 	mbus->mbuswins_base = ioremap(mbuswins_phys_base, mbuswins_size);
 	if (!mbus->mbuswins_base)
 		return -ENOMEM;
@@ -887,3 +875,28 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
 
 	return 0;
 }
+
+int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
+			   size_t mbuswins_size,
+			   phys_addr_t sdramwins_phys_base,
+			   size_t sdramwins_size)
+{
+	const struct of_device_id *of_id;
+
+	for (of_id = of_mvebu_mbus_ids; of_id->compatible; of_id++)
+		if (!strcmp(of_id->compatible, soc))
+			break;
+
+	if (!of_id->compatible) {
+		pr_err("could not find a matching SoC family\n");
+		return -ENODEV;
+	}
+
+	mbus_state.soc = of_id->data;
+
+	return mvebu_mbus_common_init(&mbus_state,
+			mbuswins_phys_base,
+			mbuswins_size,
+			sdramwins_phys_base,
+			sdramwins_size);
+}
-- 
1.8.1.5
