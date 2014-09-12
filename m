From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] clk: rockchip: rk3288: add VOP1 softresets and rename VOP0 softresets
Date: Fri, 12 Sep 2014 12:41:30 +0200
Message-ID: <3298686.YKlhYtF9M9@diego>
References: <1410518004-19040-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410518004-19040-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kfx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yxj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am Freitag, 12. September 2014, 18:33:23 schrieb Mark yao:
> The rk3288 have two vop, and each vop has three softresets were axi_reset,
> ahb_reset and dclk_reset.

I'm not sure about renaming the indices, since they're part of the devicetree-
binding. We know that so far no device in the wild used them, so it might be 
ok.

But in any case could you also add the rest of the indices of the "new" reset 
registers please, so that we don't end up adding each small index in a 
separate patch.

patch1: add reset indices for SOFTRST9 - SOFTRST11
patch2: rename LCDC0 -> VOP0


Heiko

> 
> Signed-off-by: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  include/dt-bindings/clock/rk3288-cru.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/rk3288-cru.h
> b/include/dt-bindings/clock/rk3288-cru.h index ebcb460..4d65959 100644
> --- a/include/dt-bindings/clock/rk3288-cru.h
> +++ b/include/dt-bindings/clock/rk3288-cru.h
> @@ -235,9 +235,9 @@
>  #define SRST_RGA_NIU		97
>  #define SRST_VIO0_NIU_AXI	98
>  #define SRST_VIO_NIU_AHB	99
> -#define SRST_LCDC0_AXI		100
> -#define SRST_LCDC0_AHB		101
> -#define SRST_LCDC0_DCLK		102
> +#define SRST_VOP0_AXI		100
> +#define SRST_VOP0_AHB		101
> +#define SRST_VOP0_DCLK		102
>  #define SRST_VIO1_NIU_AXI	103
>  #define SRST_VIP		104
>  #define SRST_RGA_CORE		105
> @@ -276,3 +276,7 @@
>  #define SRST_USBHOST1_CON	140
>  #define SRST_USB_ADP		141
>  #define SRST_ACC_EFUSE		142
> +
> +#define SRST_VOP1_AXI		176
> +#define SRST_VOP1_AHB		177
> +#define SRST_VOP1_DCLK		178

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
