From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: Virtual devices (cpufreq etc) and DT
Date: Thu, 4 Aug 2011 11:23:21 +0100
Message-ID: <20110804102321.GC2899@pulham.picochip.com>
References: <20110803095019.GB2607@pulham.picochip.com>
	<4E39775C.4090305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E39775C.4090305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Aug 03, 2011 at 11:29:16AM -0500, Rob Herring wrote:
[...]
> Making of_clk_get take a struct device_node ptr instead of struct 
> device fixes the problem. Here's a patch that does that.
> 
> Rob
> 
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Subject: [PATCH] of/clk: use struct device_node for of_clk_get
> 
> In order to allow clock retrieval without having a struct device,
> use the OF node pointer instead for of_clk_get.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/clk/clkdev.c   |    3 ++-
>  drivers/of/clock.c     |   12 +++++-------
>  include/linux/of_clk.h |    4 ++--
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 9252b4f..a8f1d29 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -89,7 +89,8 @@ struct clk *clk_get(struct device *dev, const char
> *con_id)
>  	const char *dev_id = dev ? dev_name(dev) : NULL;
>  	struct clk *clk;
> 
> -	clk = of_clk_get(dev, con_id);
> +	if (dev)
> +		clk = of_clk_get(dev->of_node, con_id);
>  	if (clk && __clk_get(clk))
>  		return clk;

I've just tried this patch and it works a treat, but I had to change 
this hunk to the one below to stop the compiler warning about a possible 
uninitialized use of clk.

Jamie

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index f2b1224..bc5ae55 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -80,9 +80,10 @@ EXPORT_SYMBOL(clk_get_sys);
 struct clk *clk_get(struct device *dev, const char *con_id)
 {
 	const char *dev_id = dev ? dev_name(dev) : NULL;
-	struct clk *clk;
+	struct clk *clk = NULL;
 
-	clk = of_clk_get(dev, con_id);
+	if (dev->of_node)
+		clk = of_clk_get(dev->of_node, con_id);
 	if (clk && __clk_get(clk))
		return clk;
