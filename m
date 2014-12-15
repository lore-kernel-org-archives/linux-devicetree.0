From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/2] add the dvs support for rk808
Date: Mon, 15 Dec 2014 11:07:56 +0800
Message-ID: <1418612879-16094-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

rk808 has a dvs function, there are 3 pins for dvs, dvs1 & dvs2 & dvsok.
Normally, the voltage of DCDC1/DCDC2 are controlled by BUCKn_ON_VSEL, when
we pull dvs1/dvs2 pin to active, they would be controlled by BUCKn_DVS_VSEL.
And the dvsok pin is used to indicate whether regulating has been completed.
When dvs1/dvs2 pin change, dvsok would be pull down, and it would be pull up
once the regulating is complete.

Changes in v3:
- Modify the syntax error

Changes in v2:
- increase description about dvs pins
- modify the multiline commenting

Chris Zhong (2):
  mfd: dt-bindings: add the description about dvs gpio for rk808
  regulator: rk808: add dvs support

 Documentation/devicetree/bindings/mfd/rk808.txt |  13 +-
 drivers/regulator/rk808-regulator.c             | 192 ++++++++++++++++++++++--
 2 files changed, 192 insertions(+), 13 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
