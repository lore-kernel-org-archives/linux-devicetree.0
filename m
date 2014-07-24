From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Add USB HCD support for STi SoCs
Date: Thu, 24 Jul 2014 12:00:13 +0100
Message-ID: <1406199616-10533-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver adds support for the USB HCD controller present in STi
SoC's from STMicroelectronics. It has been tested on the stih416-b2020
board.

The original author is no longer with the company and therefore emails
to his address bounce, thus I have not added him to CC.

Changes since v1:
 - Correct s/OCHI/OHCI/ spelling
 - Improve kconfig help message
 - Various formating / spelling nits identified by Lee Jones
 - Make driver depend on OF & remove node checks in code
 - Use devm_ioremap_resource
 - Remove unnecessary header files

Peter Griffin (3):
  usb: host: st-hcd: Add USB HCD support for STi SoCs
  usb: host: st-hcd: Add st-hcd devicetree bindings documentation.
  MAINTAINERS: Add st-hcd to ARCH/STI architecture

 Documentation/devicetree/bindings/usb/st-hcd.txt |  51 +++
 MAINTAINERS                                      |   1 +
 drivers/usb/host/Kconfig                         |  13 +
 drivers/usb/host/Makefile                        |   1 +
 drivers/usb/host/st-hcd.c                        | 471 +++++++++++++++++++++++
 5 files changed, 537 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st-hcd.txt
 create mode 100644 drivers/usb/host/st-hcd.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
