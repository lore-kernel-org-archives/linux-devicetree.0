Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49738 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbeI2DgS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Sep 2018 23:36:18 -0400
Subject: Re: [PATCH] ARM: dts: am335x: Replace remaining legacy phy_id with
 phy-handle
References: <20180928203457.121761-1-tony@atomide.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <a07fa3e0-df8e-b7da-e006-e46818a66a20@ti.com>
Date: Fri, 28 Sep 2018 16:10:37 -0500
MIME-Version: 1.0
In-Reply-To: <20180928203457.121761-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Koen Kooi <koen@dominion.thruhere.net>, Neeraj Dantu <dantuguf14105@gmail.com>
List-ID: <devicetree@vger.kernel.org>



On 09/28/2018 03:34 PM, Tony Lindgren wrote:
> Looks like we still have two instances of phy_handle that did not
> get update by Grygorii's series. Let's replace these too with
> standard phy-handle.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Neeraj Dantu <dantuguf14105@gmail.com>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> ---
>   arch/arm/boot/dts/am335x-osd3358-sm-red.dts | 6 +++++-
>   arch/arm/boot/dts/am335x-sancloud-bbe.dts   | 6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> --- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> +++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
> @@ -424,7 +424,7 @@
>   };
>   
>   &cpsw_emac0 {
> -	phy_id = <&davinci_mdio>, <4>;
> +	phy-handle = <&ethphy0>;
>   	phy-mode = "rgmii-txid";
>   };
>   
> @@ -441,6 +441,10 @@
>   	pinctrl-0 = <&davinci_mdio_default>;
>   	pinctrl-1 = <&davinci_mdio_sleep>;
>   	status = "okay";
> +
> +	ethphy0: ethernet-phy@4 {
> +		reg = <4>;
> +	};
>   };
>   
>   &mmc1 {
> diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> --- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> @@ -103,10 +103,14 @@
>   	pinctrl-0 = <&davinci_mdio_default>;
>   	pinctrl-1 = <&davinci_mdio_sleep>;
>   	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
>   };
>   
>   &cpsw_emac0 {
> -	phy_id = <&davinci_mdio>, <0>;
> +	phy-handle = <&ethphy0>;
>   	phy-mode = "rgmii-txid";
>   };
>   
> 

-- 
regards,
-grygorii
