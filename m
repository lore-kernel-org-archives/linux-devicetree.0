From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Mon, 27 Feb 2017 10:58:19 +0100
Message-ID: <20170227095819.u3qxsijpxqyejpvf@lukather>
References: <20170226161003.12433-1-icenowy@aosc.xyz>
 <20170226161003.12433-2-icenowy@aosc.xyz>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4w6iiuvwddxy3lz"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPHQZ7CQKGQESVIJG6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170226161003.12433-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l4w6iiuvwddxy3lz
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Mon, Feb 27, 2017 at 12:10:02AM +0800, Icenowy Zheng wrote:
> The H3 SoC have a bigger SID controller, which has its direct read
> address at 0x200 position in the SID block, not 0x0.
> 
> Also, H3 SID controller has some silicon bug that makes the direct read
> value wrong at cold boot, add code to workaround the bug. (This bug has
> already been fixed on A64 and later SoCs)
> 
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
> Changes in v4:
> - Use readl_poll_timeout.
> - Do register offset in sunxi_sid_read.
> - Merge SUN8I_SID_OP_LOCK and SUN8I_SID_LOCK_SHIFT into one macro.
> - Drop the result of register-based read operation.
> 
>  .../bindings/nvmem/allwinner,sunxi-sid.txt         | 12 +++-
>  drivers/nvmem/sunxi_sid.c                          | 66 ++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> index d543ed3f5363..9ab9e75a6351 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
> @@ -1,7 +1,11 @@
>  Allwinner sunxi-sid
>  
>  Required properties:
> -- compatible: "allwinner,sun4i-a10-sid" or "allwinner,sun7i-a20-sid"
> +- compatible: Should be one of the following (depending on your SoC):

There's no need to add that it depends on the SoC, it's kind of obvious.

> +  "allwinner,sun4i-a10-sid"
> +  "allwinner,sun7i-a20-sid"
> +  "allwinner,sun8i-h3-sid"
> +
>  - reg: Should contain registers location and length
>  
>  = Data cells =
> @@ -19,3 +23,9 @@ Example for sun7i:
>  		compatible = "allwinner,sun7i-a20-sid";
>  		reg = <0x01c23800 0x200>
>  	};
> +
> +Example for sun8i-h3:
> +	sid@01c14000 {
> +		compatible = "allwinner,sun8i-h3-sid";
> +		reg = <0x01c14000 0x400>;
> +	};

And there's no need to add an example either, this is just as obvious
if you compare it to the other.

> diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> index 69524b67007f..5179add54749 100644
> --- a/drivers/nvmem/sunxi_sid.c
> +++ b/drivers/nvmem/sunxi_sid.c
> @@ -17,6 +17,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/of.h>
> @@ -25,6 +26,15 @@
>  #include <linux/slab.h>
>  #include <linux/random.h>
>  
> +/* Registers and special values for doing register-based SID readout on H3 */
> +#define SUN8I_SID_PRCTL		0x40
> +#define SUN8I_SID_RDKEY		0x60
> +
> +#define SUN8I_SID_OFFSET_MASK	0x1FF
> +#define SUN8I_SID_OFFSET_SHIFT	16
> +#define SUN8I_SID_OP_LOCK	(0xAC << 8)
> +#define SUN8I_SID_READ		BIT(1)
> +
>  static struct nvmem_config econfig = {
>  	.name = "sunxi-sid",
>  	.read_only = true,
> @@ -34,11 +44,14 @@ static struct nvmem_config econfig = {
>  };
>  
>  struct sunxi_sid_cfg {
> +	u32	value_offset;
>  	u32	size;
> +	bool	need_register_readout;
>  };
>  
>  struct sunxi_sid {
>  	void __iomem		*base;
> +	u32			value_offset;
>  };
>  
>  /* We read the entire key, due to a 32 bit read alignment requirement. Since we
> @@ -63,12 +76,36 @@ static int sunxi_sid_read(void *context, unsigned int offset,
>  	struct sunxi_sid *sid = context;
>  	u8 *buf = val;
>  
> +	/* Offset the read operation to the real position of SID */
> +	offset += sid->value_offset;
> +
>  	while (bytes--)
>  		*buf++ = sunxi_sid_read_byte(sid, offset++);
>  
>  	return 0;
>  }
>  
> +static int sun8i_sid_register_readout(const struct sunxi_sid *sid,
> +				      const unsigned int word)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	/* Set word, lock access, and set read command */
> +	reg_val = (word & SUN8I_SID_OFFSET_MASK)
> +		  << SUN8I_SID_OFFSET_SHIFT;
> +	reg_val |= SUN8I_SID_OP_LOCK | SUN8I_SID_READ;
> +	writel(reg_val, sid->base + SUN8I_SID_PRCTL);
> +
> +	ret = readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
> +				 !(reg_val & SUN8I_SID_READ), 100, 250000);
> +	if (ret)
> +		return ret;
> +
> +	writel(0, sid->base + SUN8I_SID_PRCTL);
> +	return 0;
> +}
> +
>  static int sunxi_sid_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -86,6 +123,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
>  	cfg = of_device_get_match_data(dev);
>  	if (!cfg)
>  		return -EINVAL;
> +	sid->value_offset = cfg->value_offset;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	sid->base = devm_ioremap_resource(dev, res);
> @@ -94,6 +132,23 @@ static int sunxi_sid_probe(struct platform_device *pdev)
>  
>  	size = cfg->size;
>  
> +	if (cfg->need_register_readout) {
> +		/*
> +		 * H3's SID controller have a bug that the value at 0x200
> +		 * offset is not the correct value when the hardware is reseted.
> +		 * However, after doing a register-based read operation, the
> +		 * value become right.
> +		 * Do a full read operation here, but ignore its value
> +		 * (as it's more fast to read by direct MMIO value than
> +		 * with registers)
> +		 */
> +		for (i = 0; i < (size >> 2); i++) {
> +			ret = sun8i_sid_register_readout(sid, i);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>  	econfig.size = size;
>  	econfig.dev = dev;
>  	econfig.reg_read = sunxi_sid_read;
> @@ -131,16 +186,27 @@ static int sunxi_sid_remove(struct platform_device *pdev)
>  }
>  
>  static const struct sunxi_sid_cfg sun4i_a10_cfg = {
> +	.value_offset = 0,

This is already the default value

>  	.size = 0x10,
> +	.need_register_readout = false,

And here too

>  };
>  
>  static const struct sunxi_sid_cfg sun7i_a20_cfg = {
> +	.value_offset = 0,
>  	.size = 0x200,
> +	.need_register_readout = false,

Ditto.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--l4w6iiuvwddxy3lz--
