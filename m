Return-Path: <SRS0=rSv0=RZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfCVBtx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Mar 2019 21:49:53 -0400
Date: Fri, 22 Mar 2019 09:49:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: i.MX50: Add i2c, mmc and spi aliases
Message-ID: <20190322014928.GU12513@dragon>
References: <20190315211423.11308-1-akurz@blala.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190315211423.11308-1-akurz@blala.de>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 15, 2019 at 09:14:21PM +0000, Alexander Kurz wrote:
> Using aliases, the devices will be enumerated properly.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  arch/arm/boot/dts/imx50.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
> index ee1e3e8bf4ec..82e7acd7fc2a 100644
> --- a/arch/arm/boot/dts/imx50.dtsi
> +++ b/arch/arm/boot/dts/imx50.dtsi
> @@ -26,11 +26,20 @@
>  		gpio3 = &gpio4;
>  		gpio4 = &gpio5;
>  		gpio5 = &gpio6;
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;

Reminded by Jonathan's patch, i2c3 is missing here.  I just fixed it up.
Let's me know if you have a reason for not adding i2c3.

Shawn

> +		mmc0 = &esdhc1;
> +		mmc1 = &esdhc2;
> +		mmc2 = &esdhc3;
> +		mmc3 = &esdhc4;
>  		serial0 = &uart1;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
>  		serial3 = &uart4;
>  		serial4 = &uart5;
> +		spi0 = &ecspi1;
> +		spi1 = &ecspi2;
> +		spi2 = &cspi;
>  	};
>  
>  	cpus {
> -- 
> 2.11.0
> 
