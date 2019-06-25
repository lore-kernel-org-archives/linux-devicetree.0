Return-Path: <SRS0=SZwX=UY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43670 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfFYKok (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Jun 2019 06:44:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so15721415ljv.10
        for <devicetree@vger.kernel.org>; Tue, 25 Jun 2019 03:44:39 -0700 (PDT)
Subject: Re: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8b8ffbd5-e481-b425-aa8c-c1b13e93faee@cogentembedded.com>
Date: Tue, 25 Jun 2019 13:44:30 +0300
MIME-Version: 1.0
In-Reply-To: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Peter Chen <Peter.Chen@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 25.06.2019 13:04, Uwe Kleine-König wrote:

> The usb phys are internal to the SoC and so it their 5V supply. With

    s/it/is/?

> this regulator added explicitly the following (harmless) boot messages
> go away:
> 
> 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not found, using dummy regulator
> 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not found, using dummy regulator
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> note I'm an USB noob, so please consider carefully before applying :-)
> I also put the regulator near the usbphy node instead of in alphabetic
> order. Not sure what is sensible/usual here, too.
> 
> Best regards
> Uwe
> 
>   arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
> --- a/arch/arm/boot/dts/imx25.dtsi
> +++ b/arch/arm/boot/dts/imx25.dtsi
> @@ -614,6 +614,11 @@
>   		};
>   	};
>   
> +	reg_usb: regulator_usbphy {

    Hyphens are preferred to underscores in the prop names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb-phy supply";
> +	};
> +
[...]

MBR, Sergei
