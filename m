Return-Path: <SRS0=dP36=WL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57598 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbfHOQoL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2019 12:44:11 -0400
Subject: Re: [PATCH 0/3] Drop platform data for cpsw for am3/4 and dra7
References: <20190814101949.50006-1-tony@atomide.com>
From: grygorii <grygorii.strashko@ti.com>
Message-ID: <a4467e6c-88f3-eac8-322a-c0e40360ba36@ti.com>
Date: Thu, 15 Aug 2019 19:44:03 +0300
MIME-Version: 1.0
In-Reply-To: <20190814101949.50006-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Keerthy <j-keerthy@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

On 14/08/2019 13:19, Tony Lindgren wrote:
> Hi all,
> 
> Here are changes to drop legacy platform data for cpsw for am3, am4
> and dra7. Please review and test, I was not able to boot my beagle
> x15 as it seems to have a power supply problem and have only tested
> on am3 and 4.


Thank you.
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> 
> Tony Lindgren (3):
>    ARM: dts: Add fck for cpsw mdio for omap variants
>    ARM: OMAP2+: Drop legacy platform data for cpsw on am3 and am4
>    ARM: OMAP2+: Drop legacy platform data for cpsw on dra7
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi              |  4 +-
>   arch/arm/boot/dts/am437x-l4.dtsi              |  6 +-
>   arch/arm/boot/dts/dra7-l4.dtsi                |  4 +-
>   .../omap_hwmod_33xx_43xx_common_data.h        |  3 -
>   .../omap_hwmod_33xx_43xx_interconnect_data.c  |  6 --
>   .../omap_hwmod_33xx_43xx_ipblock_data.c       | 50 --------------
>   arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  9 ---
>   arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  9 ---
>   arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 65 -------------------
>   9 files changed, 6 insertions(+), 150 deletions(-)
> 

-- 
Best regards,
grygorii
