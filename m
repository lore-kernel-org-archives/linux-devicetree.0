From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2  0/2] correct ids for clk_testout
Date: Tue, 25 Apr 2017 14:41:08 +0800
Message-ID: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

we use clk_testout1 and clk_testout2 for camera. e.g. mipi 24M mclk. the ids of
clk_testout1 and clk_testout2 is wrong. it's time to correct it. 

Eddie Cai (2):
  clk: rockchip: add ids for camera
  clk: rockchip: fix the incorrect ids

 drivers/clk/rockchip/clk-rk3399.c      | 4 ++--
 include/dt-bindings/clock/rk3399-cru.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
