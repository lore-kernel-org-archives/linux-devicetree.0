From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: rockchip: reanme RK1108 to RV1108
Date: Wed, 22 Feb 2017 09:10:16 -0600
Message-ID: <20170222151016.bsiyv2j5sg2qvkhm@rob-hp-laptop>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
 <1486984234-32693-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486984234-32693-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2yhQFI55V6+gNQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 07:10:34PM +0800, Andy Yan wrote:
> Rockchip finally named the SOC as RV1108, so change it
> for compatible.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt   | 4 ++--
>  arch/arm/boot/dts/Makefile                           | 2 +-
>  arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} | 7 ++++---
>  3 files changed, 7 insertions(+), 6 deletions(-)
>  rename arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} (89%)

Would be nice to have the information in the discussion summarized here.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
