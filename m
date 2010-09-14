From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drivers/of: use __be32 types for big-endian device tree data
Date: Tue, 14 Sep 2010 11:13:51 +0800
Message-ID: <1284434031.863044.443635323150.1.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the sparse annotations so we can keep track of endianness.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/address.c |    2 +-
 drivers/of/base.c    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index fcadb72..3a1c7e7 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -163,7 +163,7 @@ static int of_bus_pci_translate(u32 *addr, u64 offset, int na)
 const u32 *of_get_pci_address(struct device_node *dev, int bar_no, u64 *size,
 			unsigned int *flags)
 {
-	const u32 *prop;
+	const __be32 *prop;
 	unsigned int psize;
 	struct device_node *parent;
 	struct of_bus *bus;
diff --git a/drivers/of/base.c b/drivers/of/base.c
index aa80525..710b53b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -33,7 +33,7 @@ DEFINE_RWLOCK(devtree_lock);
 
 int of_n_addr_cells(struct device_node *np)
 {
-	const int *ip;
+	const __be32 *ip;
 
 	do {
 		if (np->parent)
@@ -49,7 +49,7 @@ EXPORT_SYMBOL(of_n_addr_cells);
 
 int of_n_size_cells(struct device_node *np)
 {
-	const int *ip;
+	const __be32 *ip;
 
 	do {
 		if (np->parent)
