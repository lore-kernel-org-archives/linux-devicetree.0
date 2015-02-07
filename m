From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] add usb support for hi6220
Date: Sat,  7 Feb 2015 12:56:02 +0800
Message-ID: <1423284966-3485-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v2:
address comments from Sergei and Peter
add hi6220_phy_setup(false) code

v1:
hi6220 usb controller is inherited from dwc2
add phy accordingly
support otg gadget/host

Zhangfei Gao (4):
  Documentation: dt-bindings: add dt binding info for hi6220 dwc2
  Documentation: dt-bindings: add dt binding info for hi6220
  usb: dwc2: platform: add hi6220 support
  usb: phy: add phy-hi6220-usb

 Documentation/devicetree/bindings/usb/dwc2.txt     |   1 +
 .../devicetree/bindings/usb/hi6220-usb.txt         |  49 ++++
 drivers/usb/dwc2/platform.c                        |  30 +++
 drivers/usb/phy/Kconfig                            |   9 +
 drivers/usb/phy/Makefile                           |   1 +
 drivers/usb/phy/phy-hi6220-usb.c                   | 297 +++++++++++++++++++++
 6 files changed, 387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hi6220-usb.txt
 create mode 100644 drivers/usb/phy/phy-hi6220-usb.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
