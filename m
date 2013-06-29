From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 06/12] memory: mvebu-devbus: Remove address decoding window
 workaround
Date: Sat, 29 Jun 2013 16:04:09 -0300
Message-ID: <1372532655-20321-7-git-send-email-ezequiel.garcia@free-electrons.com>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that mbus device tree binding has been introduced, remove the address
decoding window management from this driver.
A suitable 'ranges' entry should be added to the devbus-compatible node in
the device tree, as described by the mbus binding documentation.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/memory/mvebu-devbus.c | 64 ++-----------------------------------------
 1 file changed, 2 insertions(+), 62 deletions(-)

diff --git a/drivers/memory/mvebu-devbus.c b/drivers/memory/mvebu-devbus.c
index 978e8e3..94c9248 100644
--- a/drivers/memory/mvebu-devbus.c
+++ b/drivers/memory/mvebu-devbus.c
@@ -208,16 +208,11 @@ static int mvebu_devbus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *parent;
 	struct devbus *devbus;
 	struct resource *res;
 	struct clk *clk;
 	unsigned long rate;
-	const __be32 *ranges;
-	int err, cs;
-	int addr_cells, p_addr_cells, size_cells;
-	int ranges_len, tuple_len;
-	u32 base, size;
+	int err;
 
 	devbus = devm_kzalloc(&pdev->dev, sizeof(struct devbus), GFP_KERNEL);
 	if (!devbus)
@@ -248,68 +243,13 @@ static int mvebu_devbus_probe(struct platform_device *pdev)
 		return err;
 
 	/*
-	 * Allocate an address window for this device.
-	 * If the device probing fails, then we won't be able to
-	 * remove the allocated address decoding window.
-	 *
-	 * FIXME: This is only a temporary hack! We need to do this here
-	 * because we still don't have device tree bindings for mbus.
-	 * Once that support is added, we will declare these address windows
-	 * statically in the device tree, and remove the window configuration
-	 * from here.
-	 */
-
-	/*
-	 * Get the CS to choose the window string.
-	 * This is a bit hacky, but it will be removed once the
-	 * address windows are declared in the device tree.
-	 */
-	cs = (((unsigned long)devbus->base) % 0x400) / 8;
-
-	/*
-	 * Parse 'ranges' property to obtain a (base,size) window tuple.
-	 * This will be removed once the address windows
-	 * are declared in the device tree.
-	 */
-	parent = of_get_parent(node);
-	if (!parent)
-		return -EINVAL;
-
-	p_addr_cells = of_n_addr_cells(parent);
-	of_node_put(parent);
-
-	addr_cells = of_n_addr_cells(node);
-	size_cells = of_n_size_cells(node);
-	tuple_len = (p_addr_cells + addr_cells + size_cells) * sizeof(__be32);
-
-	ranges = of_get_property(node, "ranges", &ranges_len);
-	if (ranges == NULL || ranges_len != tuple_len)
-		return -EINVAL;
-
-	base = of_translate_address(node, ranges + addr_cells);
-	if (base == OF_BAD_ADDR)
-		return -EINVAL;
-	size = of_read_number(ranges + addr_cells + p_addr_cells, size_cells);
-
-	/*
-	 * Create an mbus address windows.
-	 * FIXME: Remove this, together with the above code, once the
-	 * address windows are declared in the device tree.
-	 */
-	err = mvebu_mbus_add_window(devbus_wins[cs], base, size);
-	if (err < 0)
-		return err;
-
-	/*
 	 * We need to create a child device explicitly from here to
 	 * guarantee that the child will be probed after the timing
 	 * parameters for the bus are written.
 	 */
 	err = of_platform_populate(node, NULL, NULL, dev);
-	if (err < 0) {
-		mvebu_mbus_del_window(base, size);
+	if (err < 0)
 		return err;
-	}
 
 	return 0;
 }
-- 
1.8.1.5
