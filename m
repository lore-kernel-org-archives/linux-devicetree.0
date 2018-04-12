From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/5] net: stmmac: dwmac-sun8i: Allow getting
 syscon regmap from device
Date: Thu, 12 Apr 2018 16:56:28 +0200
Message-ID: <20180412145628.iaaeue2imiijwx5d@flea>
References: <20180411141641.14675-1-icenowy@aosc.io>
 <20180411141641.14675-4-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlwjjthzx46dcgln"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKPHXXLAKGQENYPDX4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180411141641.14675-4-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rlwjjthzx46dcgln
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Apr 11, 2018 at 10:16:39PM +0800, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> 
> On the Allwinner R40 SoC, the "GMAC clock" register is in the CCU
> address space; on the A64 SoC this register is in the SRAM controller
> address space, and with a different offset.
> 
> To access the register from another device and hide the internal
> difference between the device, let it register a regmap named
> "emac-clock". We can then get the device from the phandle, and
> retrieve the regmap with dev_get_regmap(); in this situation the
> regmap_field will be set up to access the only register in the regmap.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> [Icenowy: change to use regmaps with single register, change commit
>  message]
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 48 ++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 1037f6c78bca..b61210c0d415 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -85,6 +85,13 @@ const struct reg_field old_syscon_reg_field = {
>  	.msb = 31,
>  };
>  
> +/* Specially exported regmap which contains only EMAC register */
> +const struct reg_field single_reg_field = {
> +	.reg = 0,
> +	.lsb = 0,
> +	.msb = 31,
> +};
> +

I'm not sure this would be wise. If we ever need some other register
exported through the regmap, will have to change all the calling sites
everywhere in the kernel, which will be a pain and will break
bisectability.

Chen-Yu's (or was it yours?) initial solution with a custom writeable
hook only allowing a single register seemed like a better one.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--rlwjjthzx46dcgln--
