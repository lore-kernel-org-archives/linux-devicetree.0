From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 01/12] bus: mvebu-mbus: Factor out initialization details
Date: Sat, 29 Jun 2013 16:04:04 -0300
Message-ID: <1372532655-20321-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1372532655-20321-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372532655-20321-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We introduce a common initialization function mvebu_mbus_common_init()
that will be used by both legacy and device-tree initialization code.
This patch is an intermediate step, which will allow to introduce the
DT binding for this driver in a less intrusive way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/bus/mvebu-mbus.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 33c6947..d0feee5 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -830,26 +830,14 @@ static __init int mvebu_mbus_debugfs_init(void)
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
@@ -870,3 +858,28 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
 
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
