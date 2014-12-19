From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/13] clk: sunxi: Make the mod0 clk
 driver also a platform driver
Date: Fri, 19 Dec 2014 19:24:05 +0100
Message-ID: <20141219182405.GU4820@lukather>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
 <1418836704-15689-7-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8Tx+BDMK09J610+l"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPF72KSAKGQE6WV63NA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418836704-15689-7-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--8Tx+BDMK09J610+l
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Dec 17, 2014 at 06:18:17PM +0100, Hans de Goede wrote:
> With the prcm in sun6i (and some later SoCs) some mod0 clocks are instantiated
> through the mfd framework, and as such do not work with of_clk_declare, since
> they do not have registers assigned to them yet at of_clk_declare init time.
> 
> Silence the error on not finding registers in the of_clk_declare mod0 clk
> setup method, and also register mod0-clk support as a platform driver to work
> properly with mfd instantiated mod0 clocks.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/sunxi/clk-mod0.c | 41 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> index 658d74f..7ddab6f 100644
> --- a/drivers/clk/sunxi/clk-mod0.c
> +++ b/drivers/clk/sunxi/clk-mod0.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  
>  #include "clk-factors.h"
>  
> @@ -67,7 +68,7 @@ static struct clk_factors_config sun4i_a10_mod0_config = {
>  	.pwidth = 2,
>  };
>  
> -static const struct factors_data sun4i_a10_mod0_data __initconst = {
> +static const struct factors_data sun4i_a10_mod0_data = {
>  	.enable = 31,
>  	.mux = 24,
>  	.muxmask = BIT(1) | BIT(0),
> @@ -82,17 +83,47 @@ static void __init sun4i_a10_mod0_setup(struct device_node *node)
>  	void __iomem *reg;
>  
>  	reg = of_iomap(node, 0);
> -	if (!reg) {
> -		pr_err("Could not get registers for mod0-clk: %s\n",
> -		       node->name);
> +	if (!reg)
>  		return;
> -	}

A comment here would be nice to mention that this is intentional.

It looks good otherwise, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--8Tx+BDMK09J610+l--
