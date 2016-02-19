From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] add DTS for hi6220 and HiKey
Date: Fri, 19 Feb 2016 13:19:03 +0800
Message-ID: <1455859148-29098-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset include more dts changes for hi6220 SoC and HiKey board.

Patch 1 adds pinctrl to uart ports in SoC and enables them for HiKey board.
Patch 2 adds gpio LEDs device nodes.
Patch 3 adds dwmmc nodes description for hi6220. It refers to two LDO's
which are defined in regulator patchsets which pending on review:
[PATCH v8 5/5] arm64: dts: hisilicon: Add hi655x pmic dts node
http://thread.gmane.org/gmane.linux.kernel/2151688

Patch 4 adds resets property into dwmmc nodes.
Patch 5 adds wifi device nodes (TI's wl1835) for HiKey board.

Guodong Xu (4):
  arm64: dts: hi6220: add pinctrl for uarts and enable them
  arm64: dts: add LED nodes for hi6220-hikey
  arm64: dts: hi6220: add resets property into dwmmc nodes
  arm64: dts: add wifi nodes support for hi6220-hikey

Xinwei Kong (1):
  arm64: dts: add dwmmc nodes for hi6220

 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 81 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 66 +++++++++++++++++++++
 2 files changed, 147 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
