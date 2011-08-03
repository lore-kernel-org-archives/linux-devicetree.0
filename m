From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtual devices (cpufreq etc) and DT
Date: Wed, 03 Aug 2011 11:29:16 -0500
Message-ID: <4E39775C.4090305@gmail.com>
References: <20110803095019.GB2607@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110803095019.GB2607-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/03/2011 04:50 AM, Jamie Iles wrote:
> I'm trying to work out how our cpufreq driver fits in with device tree 
> bindings.  We have a simple driver that just takes a struct clk and 
> calls clk_set_rate() on it.  Is a node in the device tree the right way 
> to do this as it isn't really a physical device?  I have the PLL in the 
> clocks group of the DT:

Sounds generically useful...

The OF clock bindings are not really completely finalized and work on
the OF clk code is basically blocked waiting on the common struct clk
infrastructure.

> 
> 	clocks {
> 		...
> 
> 		arm_clk: clock@11 {
> 			compatible = "picochip,pc3x3-pll";
> 			reg = <0x800a0050 0x8>;
> 			picoxcell,min-freq = <140000000>;
> 			picoxcell,max-freq = <700000000>;
> 			ref-clock = <&ref_clk>, "ref";
> 			clock-outputs = "cpu";
> 		};
> 	};
> 

This describes the clock output. You still need to describe the
connection which is what the cpufreq driver should get. For that you
need something like this:

	cpu@0 {
		compatible = "arm,cortex-a9";
		reg = <0>;
		cpu-clock = <&arm_clk>, "cpu";
	};

	cpu@1 {
		compatible = "arm,cortex-a9";
		cpu-clock = <&arm_clk>, "cpu";
	};

Then look for the cpu node(s) and get it's clock.

> so I could reference that.  The of clk interface also requires a struct 
> device for getting the clk so I guess this is needed...

I ran into that problem as well. Making of_clk_get take a struct
device_node ptr instead of struct device fixes the problem. Here's a
patch that does that.

Rob

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] of/clk: use struct device_node for of_clk_get

In order to allow clock retrieval without having a struct device,
use the OF node pointer instead for of_clk_get.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/clkdev.c   |    3 ++-
 drivers/of/clock.c     |   12 +++++-------
 include/linux/of_clk.h |    4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 9252b4f..a8f1d29 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -89,7 +89,8 @@ struct clk *clk_get(struct device *dev, const char
*con_id)
 	const char *dev_id = dev ? dev_name(dev) : NULL;
 	struct clk *clk;

-	clk = of_clk_get(dev, con_id);
+	if (dev)
+		clk = of_clk_get(dev->of_node, con_id);
 	if (clk && __clk_get(clk))
 		return clk;

diff --git a/drivers/of/clock.c b/drivers/of/clock.c
index 4a6eb0a..7c90994 100644
--- a/drivers/of/clock.c
+++ b/drivers/of/clock.c
@@ -89,7 +89,7 @@ static struct clk *__of_clk_get_from_provider(struct
device_node *np, const char
 	return clk;
 }

-struct clk *of_clk_get(struct device *dev, const char *id)
+struct clk *of_clk_get(struct device_node *node, const char *id)
 {
 	struct device_node *provnode;
 	u32 provhandle;
@@ -98,12 +98,10 @@ struct clk *of_clk_get(struct device *dev, const
char *id)
 	char prop_name[32]; /* 32 is max size of property name */
 	const void *prop;

-	if (!dev)
-		return NULL;
-	dev_dbg(dev, "Looking up %s-clock from device tree\n", id);
+	pr_debug("Looking up %s-clock from device tree\n", id);

 	snprintf(prop_name, 32, "%s-clock", id ? id : "bus");
-	prop = of_get_property(dev->of_node, prop_name, &sz);
+	prop = of_get_property(node, prop_name, &sz);
 	if (!prop || sz < 4)
 		return NULL;

@@ -122,12 +120,12 @@ struct clk *of_clk_get(struct device *dev, const
char *id)
 	provnode = of_find_node_by_phandle(provhandle);
 	if (!provnode) {
 		pr_warn("%s: %s property in node %s references invalid phandle",
-			__func__, prop_name, dev->of_node->full_name);
+			__func__, prop_name, node->full_name);
 		return NULL;
 	}
 	clk = __of_clk_get_from_provider(provnode, prop);
 	if (clk)
-		dev_dbg(dev, "Using clock from %s\n", provnode->full_name);
+		pr_debug("Using clock from %s\n", provnode->full_name);

 	of_node_put(provnode);

diff --git a/include/linux/of_clk.h b/include/linux/of_clk.h
index 71a29eb..848b1c27 100644
--- a/include/linux/of_clk.h
+++ b/include/linux/of_clk.h
@@ -23,12 +23,12 @@ void of_clk_del_provider(struct device_node *np,
 			void *data),
 		void *data);

-struct clk *of_clk_get(struct device *dev, const char *id);
+struct clk *of_clk_get(struct device_node *node, const char *id);

 int of_clk_fixed_parse(void);

 #else
-static inline struct clk *of_clk_get(struct device *dev, const char *id)
+struct clk *of_clk_get(struct device_node *node, const char *id)
 {
 	return NULL;
 }
-- 
1.7.4.1
