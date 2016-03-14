From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] phy: rcar-gen3-usb2: add extcon support
Date: Mon, 14 Mar 2016 12:36:01 +0900
Message-ID: <56E631A1.2090302@samsung.com>
References: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1456999746-2800-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1456999746-2800-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Yoshihiro,

On 2016=EB=85=84 03=EC=9B=94 03=EC=9D=BC 19:09, Yoshihiro Shimoda wrote=
:
> This patch adds extcon support for otg related channel.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/Kconfig              |  1 +
>  drivers/phy/phy-rcar-gen3-usb2.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index ba68f14..db57d6c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -121,6 +121,7 @@ config PHY_RCAR_GEN2
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on OF && ARCH_RENESAS
> +	depends on EXTCON
>  	select GENERIC_PHY
>  	help
>  	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
> diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-=
gen3-usb2.c
> index 7b14244..76bb88f 100644
> --- a/drivers/phy/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/phy-rcar-gen3-usb2.c
> @@ -12,6 +12,7 @@
>   * published by the Free Software Foundation.
>   */
> =20
> +#include <linux/extcon.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -77,6 +78,7 @@
> =20
>  struct rcar_gen3_chan {
>  	void __iomem *base;
> +	struct extcon_dev *extcon;
>  	struct phy *phy;
>  	struct regulator *vbus;
>  	bool has_otg;
> @@ -127,6 +129,9 @@ static void rcar_gen3_init_for_host(struct rcar_g=
en3_chan *ch)
>  	rcar_gen3_set_linectrl(ch, 1, 1);
>  	rcar_gen3_set_host_mode(ch, 1);
>  	rcar_gen3_enable_vbus_ctrl(ch, 1);
> +
> +	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, true);
> +	extcon_set_cable_state_(ch->extcon, EXTCON_USB, false);
>  }
> =20
>  static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
> @@ -134,6 +139,9 @@ static void rcar_gen3_init_for_peri(struct rcar_g=
en3_chan *ch)
>  	rcar_gen3_set_linectrl(ch, 0, 1);
>  	rcar_gen3_set_host_mode(ch, 0);
>  	rcar_gen3_enable_vbus_ctrl(ch, 0);
> +
> +	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, false);
> +	extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
>  }
> =20
>  static bool rcar_gen3_check_vbus(struct rcar_gen3_chan *ch)
> @@ -272,6 +280,12 @@ static const struct of_device_id rcar_gen3_phy_u=
sb2_match_table[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
> =20
> +static const unsigned int rcar_gen3_phy_cable[] =3D {
> +	EXTCON_USB,
> +	EXTCON_USB_HOST,
> +	EXTCON_NONE,
> +};
> +
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -297,11 +311,23 @@ static int rcar_gen3_phy_usb2_probe(struct plat=
form_device *pdev)
>  	/* call request_irq for OTG */
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq >=3D 0) {
> +		int ret;
> +
>  		irq =3D devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
>  				       IRQF_SHARED, dev_name(dev), channel);
>  		if (irq < 0)
>  			dev_err(dev, "No irq handler (%d)\n", irq);
>  		channel->has_otg =3D true;
> +		channel->extcon =3D devm_extcon_dev_allocate(dev,
> +							rcar_gen3_phy_cable);
> +		if (IS_ERR(channel->extcon))
> +			return PTR_ERR(channel->extcon);
> +
> +		ret =3D devm_extcon_dev_register(dev, channel->extcon);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to register extcon\n");
> +			return ret;
> +		}
>  	}
> =20
>  	/* devm_phy_create() will call pm_runtime_enable(dev); */
>=20

Looks good to me about extcon usgae.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi
