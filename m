From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/2] Patches to add dr_mode for dwc2
Date: Wed,  6 Aug 2014 09:01:48 +0800
Message-ID: <1407286910-30906-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These two patches enable the dr_mode for the dwc2 usb
controller.  These are split from the patch series adding
rk3288 dwc2 support.

Changes in v4:
- From Doug's suggestion:
 -- remove dr_mode init from Kconfig code
 -- change the commit meesage

Changes in v3:
- fix the odd spacing in dwc2_hsotg struct
- From Jingoo's suggestion:
    change the commit message
- add dr_mode init from Kconfig

Changes in v2:
- Split out dr_mode and rk3288 bindings.
- put spaces around '+' operator
- expand the comment for dr_mode
- handle dr_mode is USB_DR_MODE_OTG

Kever Yang (2):
  Documentation: dt-bindings: add dt binding info for dwc2 dr_mode
  usb: dwc2: add 'mode' which based on Kconfig select or dts setting

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
 drivers/usb/dwc2/core.c                        | 18 ++++++++++++++++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/platform.c                    |  4 ++++
 4 files changed, 29 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
