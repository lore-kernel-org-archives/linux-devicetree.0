From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Fri, 16 Feb 2018 16:34:42 +0530
Message-ID: <a9eac594-33d5-6171-51ca-66204008fc1f@ti.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486712654-15431-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 10 February 2017 01:14 PM, Chris Zhong wrote:
> 
> There are 2 Type-c PHYs in RK3399, but only one DP controller. Hence
> only one PHY can connect to DP controller at one time, the other should
> be disconnected. The GRF_SOC_CON26 register has a switch bit to do it,
> set this bit means enable PHY 1, clear this bit means enable PHY 0.
> 
> If the board has 2 Type-C ports, the DP driver get the phy id from
> devm_of_phy_get_by_index, and then control this switch according to
> this id. But some others board only has one Type-C port, it may be PHY 0
> or PHY 1. The dts node id can not tell us the correct PHY id. Hence move
> this switch to PHY driver, the PHY driver can distinguish between PHY 0
> and PHY 1, and then write the correct register bit.
> 
> 

Changed subject of "Documentation: bindings: add uphy-dp-sel for Rockchip USB
Type-C PHY" as suggested by Rob, rebased "phy: rockchip-typec: support DP phy
switch" to the latest kernel and merged.

Thanks
Kishon

> 
> Chris Zhong (4):
>   Documentation: bindings: add uphy-dp-sel for Rockchip USB Type-C PHY
>   arm64: dts: rockchip: add rockchip,uphy-dp-sel for Type-C phy
>   phy: rockchip-typec: support DP phy switch
>   drm/rockchip: cdn-dp: remove the DP phy switch
> 
>  Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 5 +++++
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi                     | 2 ++
>  drivers/gpu/drm/rockchip/cdn-dp-core.c                       | 7 -------
>  drivers/phy/phy-rockchip-typec.c                             | 9 +++++++++
>  4 files changed, 16 insertions(+), 7 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
