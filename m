From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 00/10] ARM: dts: keystone*: Continued warnings cleanups
Date: Fri, 19 Jan 2018 16:54:05 -0600
Message-ID: <ecde90ae-7456-cadb-5ce4-6b63f4ed036a@ti.com>
References: <20180104195701.4042-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104195701.4042-1-afd-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/04/2018 01:56 PM, Andrew F. Davis wrote:
> Hello all,
> 
> Just a couple cleanups for DT warnings when compiling with W=1.
> 
> This clears up 51 more warnings when building keystone_defconfig.
> 
> Based on Santosh's "for_4.16/keystone-dts" branch.
> 
> Thanks,
> Andrew
> 
> Changes from v1:
>  - Added to more patches from Suman
>  - Reworded commit message to include "address space" distinction

Thanks, you still have left in the "and simply use get_resource() in
the driver." part in the commit descriptions though, which is not right.
Otherwise, the changes look good.


>  - Added "ranges" property
>  - Reordered #address/size-cells

For the entire series,
Tested-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>

regards
Suman

> 
> Andrew F. Davis (8):
>   ARM: dts: keystone: Move keystone_irq to under device-state-control
>   ARM: dts: keystone: Move reset-controller to under
>     device-state-control
>   ARM: dts: keystone-k2e: Move keystone_dsp_gpio to under
>     device-state-control
>   ARM: dts: keystone-k2l: Move keystone_dsp_gpio to under
>     device-state-control
>   ARM: dts: keystone-k2hk: Move keystone_dsp_gpio to under
>     device-state-control
>   ARM: dts: keystone-k2g: Move keystone_irq to under
>     device-state-control
>   ARM: dts: keystone-k2g: Move keystone_dsp_gpio to under
>     device-state-control
>   ARM: dts: keystone-k2g: Move usb-phy nodes out of soc0
> 
> Suman Anna (2):
>   ARM: dts: keystone-k2g: Fix unit-address formatting for serial nodes
>   ARM: dts: keystone-k2e-clocks: Fix missing unit address separator
> 
>  arch/arm/boot/dts/keystone-k2e-clocks.dtsi |   2 +-
>  arch/arm/boot/dts/keystone-k2e.dtsi        |  13 ++--
>  arch/arm/boot/dts/keystone-k2g.dtsi        |  69 +++++++++++--------
>  arch/arm/boot/dts/keystone-k2hk.dtsi       | 104 ++++++++++++++++-------------
>  arch/arm/boot/dts/keystone-k2l.dtsi        |  52 ++++++++-------
>  arch/arm/boot/dts/keystone.dtsi            |  35 +++++-----
>  6 files changed, 156 insertions(+), 119 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
