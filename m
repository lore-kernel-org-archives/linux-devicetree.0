From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 2/2] mtd: nand: sunxi: add reset line support
Date: Sun, 19 Jun 2016 21:37:17 +0200
Message-ID: <20160619193717.GE26668@lukather>
References: <20160619161435.50404-1-icenowy@aosc.xyz>
 <20160619161435.50404-2-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3XITO5QKGQEL4NEDZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160619161435.50404-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Jun 20, 2016 at 12:14:35AM +0800, Icenowy Zheng wrote:
> The NAND controller on some sun8i chips needs its reset line to be
> deasserted before they can enter working state.
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> Changes in v2:
>   - Corrected the error checking code of reset line.
> 
> Changes in v3:
>   - Corrected a more serious error brought in the "fix" of v2.
> 
> Changes in v4:
>   - Removed unneeded code block after "else".
> 
> Changes in v5:
>   - Added reassertion code in case of initialization error and device
>     remove.
> 
>  drivers/mtd/nand/sunxi_nand.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index a83a690..3b40186 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -39,6 +39,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/reset.h>
>  
>  #define NFC_REG_CTL		0x0000
>  #define NFC_REG_ST		0x0004
> @@ -269,6 +270,7 @@ struct sunxi_nfc {
>  	void __iomem *regs;
>  	struct clk *ahb_clk;
>  	struct clk *mod_clk;
> +	struct reset_control *reset;
>  	unsigned long assigned_cs;
>  	unsigned long clk_rate;
>  	struct list_head chips;
> @@ -1871,26 +1873,41 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_ahb_clk_unprepare;
>  
> +	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
> +
> +	if (!IS_ERR(nfc->reset)) {
> +		ret = reset_control_deassert(nfc->reset);
> +		if (ret) {
> +			dev_err(dev, "reset err %d\n", ret);
> +			goto out_mod_clk_unprepare;
> +		}
> +	} else if (PTR_ERR(nfc->reset) != -ENOENT) {
> +		return PTR_ERR(nfc->reset);

You're leaking all the resources here. Please use a goto.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--xA/XKXTdy9G3iaIz--
