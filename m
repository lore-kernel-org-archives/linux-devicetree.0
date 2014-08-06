From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/6] Add EHCI and OHCI drivers for STi SoC's
Date: Wed,  6 Aug 2014 18:03:03 +0100
Message-ID: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for the OHCI and EHCI on-chip controllers
found in STi consumer electronics SoC's from STMicroelectronics.

The series has been re-worked from v2 to split out the ehci and ohci parts
into their own drivers / devices like most other ARM platforms based on
feedback from Arnd Bergmann (see here http://www.spinics.net/lists/linux-usb/msg111124.html. 

The ehci-platform & ohci-platform have been used as a basis for this in case we
wish to merge the drivers again in the future.

Changes since v2:
 - Based on Arnd Berghman feedback, split out into 2 devices / drivers
 - Base drivers oh ehci-platform.c & ohci-platform.c with required extensions
   to allow possible re-merge in the furture.

Changes since v1:
 - Correct s/OCHI/OHCI/ spelling
 - Improve kconfig help message
 - Various formating / spelling nits identified by Lee Jones
 - Make driver depend on OF & remove node checks in code
 - Use devm_ioremap_resource
 - Remove unnecessary header files

Peter Griffin (6):
  usb: host: usb-st-common: Add common code required by ohci-st and
    ehci-st
  usb: host: ehci-st: Add EHCI support for ST STB devices
  usb: host: ohci-st: Add OHCI driver support for ST STB devices
  usb: host: ehci-st: Add ehci-st devicetree bindings documentation
  usb: host: ohci-st: Add ohci-st devicetree bindings documentation
  MAINTAINERS: Add ehci-st.c and ohci-st.c to ARCH/STI architecture

 Documentation/devicetree/bindings/usb/ehci-st.txt |  41 +++
 Documentation/devicetree/bindings/usb/ohci-st.txt |  40 +++
 MAINTAINERS                                       |   3 +-
 drivers/usb/host/Kconfig                          |  13 +
 drivers/usb/host/Makefile                         |   2 +
 drivers/usb/host/ehci-st.c                        | 334 ++++++++++++++++++++++
 drivers/usb/host/ohci-st.c                        | 302 +++++++++++++++++++
 drivers/usb/host/usb-st-common.c                  |  99 +++++++
 drivers/usb/host/usb-st-common.h                  |  34 +++
 9 files changed, 867 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-st.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ohci-st.txt
 create mode 100644 drivers/usb/host/ehci-st.c
 create mode 100644 drivers/usb/host/ohci-st.c
 create mode 100644 drivers/usb/host/usb-st-common.c
 create mode 100644 drivers/usb/host/usb-st-common.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
