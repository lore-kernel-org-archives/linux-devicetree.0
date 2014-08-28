From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/6] hix5hd2 add some nodes
Date: Thu, 28 Aug 2014 13:34:14 +0800
Message-ID: <1409204060-9223-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v2:
Add comments of mac-address, suggested by Mark

Zhangfei Gao (6):
  ARM: dts: hix5hd2: add gmac node
  ARM: dts: hix5hd2: add mmc node
  ARM: dts: hix5hd2: add usb node
  ARM: dts: hix5hd2: add sata node
  ARM: dts: hix5hd2: add gpio node
  ARM: dts: hix5hd2: add wdg node

 arch/arm/boot/dts/hisi-x5hd2-dkb.dts |   33 ++++
 arch/arm/boot/dts/hisi-x5hd2.dtsi    |  310 ++++++++++++++++++++++++++++++++++
 2 files changed, 343 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
