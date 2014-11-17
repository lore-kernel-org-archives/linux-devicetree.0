From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RFC PATCH 0/2] clk: rockchip: leave npll for DCLK_VOP0(HDMI) only
Date: Mon, 17 Nov 2014 22:55:36 +0800
Message-ID: <1416236138-11010-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

To support all kinds of frequency requirement for HDMI on rk3288,
we need a PLL that can change rate at run time.

There are some discussion before at [0], I think we can just leave
the npll for HDMI(DCLK_VOP0) used to make it simple.

Comments are welcome.

[0] https://lkml.org/lkml/2014/11/4/58


Kever Yang (2):
  clk: rockchip: leave npll for VOP0 only
  arm: dts: rockchip: select npll as parent of DCLK_VOP0

 arch/arm/boot/dts/rk3288.dtsi     |  2 ++
 drivers/clk/rockchip/clk-rk3288.c | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
