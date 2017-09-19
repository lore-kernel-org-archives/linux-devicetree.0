From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] nvmem: sunxi-sid: add support for A64/H5's
 SID controller
Date: Tue, 19 Sep 2017 10:20:19 +0200
Message-ID: <20170919082019.6bopwauso4mbslqo@flea.lan>
References: <20170918154204.54427-1-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="whqjkw4wpkjzhnli"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTVGQPHAKGQEFNEW4IQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170918154204.54427-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--whqjkw4wpkjzhnli
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Sep 18, 2017 at 11:42:04PM +0800, Icenowy Zheng wrote:
> Allwinner A64/H5 SoCs come with a SID controller like the one in H3, but
> without the silicon bug that makes the initial value at 0x200 wrong, so
> the value at 0x200 can be directly read.
> 
> Add support for this kind of SID controller.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1 +
>  drivers/nvmem/sunxi_sid.c                                       | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> index ef06d061913c..6ea0836939ee 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> @@ -5,6 +5,7 @@ Required properties:
>    "allwinner,sun4i-a10-sid"
>    "allwinner,sun7i-a20-sid"
>    "allwinner,sun8i-h3-sid"
> +  "allwinner,sun50i-a64-sid"
>  
>  - reg: Should contain registers location and length
>  
> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index 0d6648be93b8..3c9fd4fb9207 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -199,10 +199,16 @@ static const struct sunxi_sid_cfg sun8i_h3_cfg = {
>  	.need_register_readout = true,
>  };
>  
> +static const struct sunxi_sid_cfg sun50i_a64_cfg = {
> +	.value_offset = 0x200,
> +	.size = 0x100,
> +};
> +

How did you get those values?

Also, it's reported that the SID can only be accessed in secure mode,
did you test it?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--whqjkw4wpkjzhnli--
