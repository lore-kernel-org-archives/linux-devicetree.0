From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/2] nvmem: efuse support for rk3328
Date: Wed, 13 Dec 2017 07:51:53 +0100
Message-ID: <20171213065155.32020-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pretty similar to the other variants.

changes in v2:
- rebased on 4.15-rc2
- added Acks by Rob Herring
- increased udelay a tiny bit, due to infrequent read errors

Finley Xiao (2):
  nvmem: rockchip-efuse: parse 'rockchip,efuse-size'
  nvmem: rockchip-efuse: add support for rk3328-efuse

 .../devicetree/bindings/nvmem/rockchip-efuse.txt   |  5 ++
 drivers/nvmem/rockchip-efuse.c                     | 70 +++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
