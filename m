From: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 0/5] drivers: usb: chipidea: Add qoriq platform
Date: Sat, 9 Jul 2016 10:00:51 +0530
Message-ID: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter.Chen-3arQi8VN3Tc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds qoriq platform driver for chipidea controller as well as
qoriq usb 2.0 phy driver. Also, enables chipidea driver and QorIQ
USB 2.0 PHY driver on LS1021A platform.

Rajesh Bhagat (5):
  drivers: usb: chipidea: Add qoriq platform driver
  usb: DT binding documentation for qoriq usb 2.0 controller
  drivers: usb: phy: Add qoriq usb 2.0 phy driver support
  phy: DT binding documentation for qoriq usb 2.0 phy
  arm: dts: ls1021a: enable chipidea driver and USB 2.0 PHY driver

 .../devicetree/bindings/phy/qoriq-usb2-phy.txt     |  22 ++
 .../devicetree/bindings/usb/ci-hdrc-qoriq.txt      |  34 +++
 arch/arm/boot/dts/ls1021a.dtsi                     |  15 +-
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qoriq-usb2.c                       | 228 ++++++++++++++++++++
 drivers/phy/phy-qoriq-usb2.h                       |  50 +++++
 drivers/usb/chipidea/Makefile                      |   2 +
 drivers/usb/chipidea/ci_hdrc_qoriq.c               | 237 +++++++++++++++++++++
 drivers/usb/chipidea/ci_hdrc_qoriq.h               |  65 ++++++
 10 files changed, 661 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qoriq-usb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
 create mode 100644 drivers/phy/phy-qoriq-usb2.c
 create mode 100644 drivers/phy/phy-qoriq-usb2.h
 create mode 100644 drivers/usb/chipidea/ci_hdrc_qoriq.c
 create mode 100644 drivers/usb/chipidea/ci_hdrc_qoriq.h

-- 
2.6.2.198.g614a2ac

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
