From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx53: add support for USB armory board
Date: Mon, 8 Aug 2016 15:08:03 +0800
Message-ID: <20160808070803.GB4678@tiger>
References: <20160628125444.16531-1-andrej@inversepath.com>
 <20160628125444.16531-3-andrej@inversepath.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160628125444.16531-3-andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

One more comment below.

On Tue, Jun 28, 2016 at 02:54:44PM +0200, andrej-6l9oX9VzF44FueaiHvvTSg@public.gmane.org wrote:
> +&iomuxc {
> +	pinctrl_esdhc1: esdhc1grp {
> +		fsl,pins = <
> +			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
> +			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
> +			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
> +			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
> +			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
> +			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
> +		>;
> +	};
> +
> +	pinctrl_i2c1_pmic: i2c1grp_pmic {
> +		fsl,pins = <
> +			MX53_PAD_EIM_D21__I2C1_SCL	0x0
> +			MX53_PAD_EIM_D28__I2C1_SDA	0x0

Please use a proper pin configuration value rather than 0x0.

> +		>;
> +	};
> +
> +	pinctrl_led: led {
> +		fsl,pins = <
> +			MX53_PAD_DISP0_DAT6__GPIO4_27 0x0

Ditto.

Shawn

> +		>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
