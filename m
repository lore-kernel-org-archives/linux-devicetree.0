From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/2] fixed the overshoot when adjust voltage
Date: Mon, 20 Jul 2015 17:23:51 +0800
Message-ID: <1437384233-26169-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark

Sorry for the belated update.
As you said, constantly checking dvsok pin and waiting it to active is
not a good idea, so I remove the dvsok pin in latest patch.
This patchset have been tested on ChromeBook, the overshoot has
disappeared on the boards with dvs pin. And for the other boards without
dvs pin, the overshoot alse significantly reduced to a negligible level.

Changes in v4:
- Remove the description about dvs-ok
- remove dvsok pin
- add support gradual adjustment

Changes in v3:
- Modify the syntax error

Changes in v2:
- increase description about dvs pins
- modify the multiline commenting

Chris Zhong (2):
  mfd: dt-bindings: add the description about dvs gpio for rk808
  regulator: rk808: fixed the overshoot when adjust voltage

 Documentation/devicetree/bindings/mfd/rk808.txt |   8 +-
 drivers/regulator/rk808-regulator.c             | 219 ++++++++++++++++++++++--
 2 files changed, 214 insertions(+), 13 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
