Return-Path: <robherring2@gmail.com>
Message-ID: <5ca841f6.1c69fb81.4e9ad.d718@mx.google.com>
Date: Sat, 06 Apr 2019 01:06:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] ARM: dts: am33xx: Added AM33XX_PADCONF macro
References: <20190314150524.GB19425@atomide.com>  <20190402160949.14190-1-cquast@hanoverdisplays.com> <20190402160949.14190-3-cquast@hanoverdisplays.com>
In-Reply-To: <20190402160949.14190-3-cquast@hanoverdisplays.com>
Cc: Christina Quast <cquast@hanoverdisplays.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Tue,  2 Apr 2019 18:09:47 +0200, Christina Quast wrote:
> AM33XX_PADCONF takes three instead of two parameters, to make
> future changes to #pinctrl-cells easier.
> 
> For old boards which are not mainlined, we left the AM33XX_IOPAD
> macro.
> 
> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
> ---
>  include/dt-bindings/pinctrl/omap.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
