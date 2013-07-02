From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyA1LzVdIEFSTTogZHRzOiBBZGQgZGV2aWNlIHRyZWUg?=
 =?UTF-8?B?c3VwcG9ydCBmb3IgcGh5Y2FyZCBwY2ExMDA=?=
Date: Tue, 02 Jul 2013 20:27:49 +0400
Message-ID: <1372782469.486055292@f129.mail.ru>
References: <1372431037-13519-1-git-send-email-mpa@pengutronix.de>
 <1372431037-13519-6-git-send-email-mpa@pengutronix.de>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372431037-13519-6-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: =?UTF-8?B?TWFya3VzIFBhcmdtYW5u?= <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: =?UTF-8?B?RmFiaW8gRXN0ZXZhbQ==?= <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, =?UTF-8?B?U3RlZmZlbiBUcnVtdHJhcg==?= <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?B?U2FzY2hhIEhhdWVy?= <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Board files for Phytec phyCARD-S "System on Module" and "Rapid
> Development Kit".
> 
> Based on patches from:
> 
> Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
>  - Original patch
>  - ARM: dts: Set partition offsets for phycard
>  - ARM: dts: Use CSPI1 instead of CSPI2 on phycard pca100
>  - ARM: imx27-phytec-phycard-S.dts: resize nand partitions
...
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
...
> +&i2c1 {
> +	status = "okay";
> +
> +	ioexpander@41 {
> +		compatible = "nxp,pca9536";
> +		reg = <0x41>;
> +	};
> +
> +	rtc@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	lm75@4a {
> +		compatible = "national,lm75";
> +		reg = <0x4a>;
> +	};
> +
> +	rtc@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +	};

Really two identical RTC on I2C1 & I2C2 or it is typo?

---
