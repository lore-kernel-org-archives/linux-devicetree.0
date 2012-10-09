From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/3] of/address: sparse fixes
Date: Mon, 8 Oct 2012 19:41:58 -0500
Message-ID: <20121008194158.bd759eebd0e81de06a03b04b@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

drivers/of/address.c:66:29: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:66:29:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:66:29:    got unsigned int [usertype] *addr
drivers/of/address.c:87:32: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:87:32:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:87:32:    got unsigned int [usertype] *addr
drivers/of/address.c:91:30: warning: incorrect type in assignment (different base types)
drivers/of/address.c:91:30:    expected unsigned int [unsigned] [usertype] <noident>
drivers/of/address.c:91:30:    got restricted __be32 [usertype] <noident>
drivers/of/address.c:92:22: warning: incorrect type in assignment (different base types)
drivers/of/address.c:92:22:    expected unsigned int [unsigned] [usertype] <noident>
drivers/of/address.c:92:22:    got restricted __be32 [usertype] <noident>
drivers/of/address.c:147:35: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:147:35:    expected restricted __be32 const [usertype] *addr
drivers/of/address.c:147:35:    got unsigned int [usertype] *addr
drivers/of/address.c:157:34: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:157:34:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:157:34:    got unsigned int [usertype] *
drivers/of/address.c:256:29: warning: restricted __be32 degrades to integer
drivers/of/address.c:256:36: warning: restricted __be32 degrades to integer
drivers/of/address.c:262:34: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:262:34:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:262:34:    got unsigned int [usertype] *
drivers/of/address.c:372:41: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:372:41:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:372:41:    got unsigned int [usertype] *addr
drivers/of/address.c:395:53: warning: incorrect type in argument 2 (different base types)
drivers/of/address.c:395:53:    expected restricted __be32 const [usertype] *addr
drivers/of/address.c:395:53:    got unsigned int [usertype] *addr
drivers/of/address.c:443:50: warning: incorrect type in argument 2 (different base types)
drivers/of/address.c:443:50:    expected restricted __be32 const [usertype] *addr
drivers/of/address.c:443:50:    got unsigned int *<noident>
drivers/of/address.c:455:49: warning: incorrect type in argument 1 (different base types)
drivers/of/address.c:455:49:    expected restricted __be32 const [usertype] *cell
drivers/of/address.c:455:49:    got unsigned int *<noident>
drivers/of/address.c:480:60: warning: incorrect type in argument 2 (different base types)
drivers/of/address.c:480:60:    expected restricted __be32 const [usertype] *addr
drivers/of/address.c:480:60:    got unsigned int *<noident>
drivers/of/address.c:412:5: warning: symbol '__of_translate_address' was not declared. Should it be static?
drivers/of/address.c:520:14: error: symbol 'of_get_address' redeclared with different type (originally declared at include/linux/of_address.h:22) - different base types

Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/address.c       | 24 ++++++++++++------------
 include/linux/of_address.h |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 72e496f..0125524 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -37,9 +37,9 @@ struct of_bus {
 	int		(*match)(struct device_node *parent);
 	void		(*count_cells)(struct device_node *child,
 				       int *addrc, int *sizec);
-	u64		(*map)(u32 *addr, const __be32 *range,
+	u64		(*map)(__be32 *addr, const __be32 *range,
 				int na, int ns, int pna);
-	int		(*translate)(u32 *addr, u64 offset, int na);
+	int		(*translate)(__be32 *addr, u64 offset, int na);
 	unsigned int	(*get_flags)(const __be32 *addr);
 };
 
@@ -56,7 +56,7 @@ static void of_bus_default_count_cells(struct device_node *dev,
 		*sizec = of_n_size_cells(dev);
 }
 
-static u64 of_bus_default_map(u32 *addr, const __be32 *range,
+static u64 of_bus_default_map(__be32 *addr, const __be32 *range,
 		int na, int ns, int pna)
 {
 	u64 cp, s, da;
@@ -82,7 +82,7 @@ static u64 of_bus_default_map(u32 *addr, const __be32 *range,
 	return da - cp;
 }
 
-static int of_bus_default_translate(u32 *addr, u64 offset, int na)
+static int of_bus_default_translate(__be32 *addr, u64 offset, int na)
 {
 	u64 a = of_read_number(addr, na);
 	memset(addr, 0, na * 4);
@@ -138,7 +138,7 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
 	return flags;
 }
 
-static u64 of_bus_pci_map(u32 *addr, const __be32 *range, int na, int ns,
+static u64 of_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
 		int pna)
 {
 	u64 cp, s, da;
@@ -165,7 +165,7 @@ static u64 of_bus_pci_map(u32 *addr, const __be32 *range, int na, int ns,
 	return da - cp;
 }
 
-static int of_bus_pci_translate(u32 *addr, u64 offset, int na)
+static int of_bus_pci_translate(__be32 *addr, u64 offset, int na)
 {
 	return of_bus_default_translate(addr + 1, offset, na - 1);
 }
@@ -247,7 +247,7 @@ static void of_bus_isa_count_cells(struct device_node *child,
 		*sizec = 1;
 }
 
-static u64 of_bus_isa_map(u32 *addr, const __be32 *range, int na, int ns,
+static u64 of_bus_isa_map(__be32 *addr, const __be32 *range, int na, int ns,
 		int pna)
 {
 	u64 cp, s, da;
@@ -270,7 +270,7 @@ static u64 of_bus_isa_map(u32 *addr, const __be32 *range, int na, int ns,
 	return da - cp;
 }
 
-static int of_bus_isa_translate(u32 *addr, u64 offset, int na)
+static int of_bus_isa_translate(__be32 *addr, u64 offset, int na)
 {
 	return of_bus_default_translate(addr + 1, offset, na - 1);
 }
@@ -338,7 +338,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
 }
 
 static int of_translate_one(struct device_node *parent, struct of_bus *bus,
-			    struct of_bus *pbus, u32 *addr,
+			    struct of_bus *pbus, __be32 *addr,
 			    int na, int ns, int pna, const char *rprop)
 {
 	const __be32 *ranges;
@@ -409,12 +409,12 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
  * that can be mapped to a cpu physical address). This is not really specified
  * that way, but this is traditionally the way IBM at least do things
  */
-u64 __of_translate_address(struct device_node *dev, const __be32 *in_addr,
-			   const char *rprop)
+static u64 __of_translate_address(struct device_node *dev,
+				  const __be32 *in_addr, const char *rprop)
 {
 	struct device_node *parent = NULL;
 	struct of_bus *bus, *pbus;
-	u32 addr[OF_MAX_ADDR_CELLS];
+	__be32 addr[OF_MAX_ADDR_CELLS];
 	int na, ns, pna, pns;
 	u64 result = OF_BAD_ADDR;
 
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index c3cdc10..a1984dd 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -19,7 +19,7 @@ extern void __iomem *of_iomap(struct device_node *device, int index);
  * the address space flags too. The PCI version uses a BAR number
  * instead of an absolute index
  */
-extern const u32 *of_get_address(struct device_node *dev, int index,
+extern const __be32 *of_get_address(struct device_node *dev, int index,
 			   u64 *size, unsigned int *flags);
 
 #ifndef pci_address_to_pio
@@ -44,7 +44,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 {
 	return NULL;
 }
-static inline const u32 *of_get_address(struct device_node *dev, int index,
+static inline const __be32 *of_get_address(struct device_node *dev, int index,
 					u64 *size, unsigned int *flags)
 {
 	return NULL;
-- 
1.7.12.2
