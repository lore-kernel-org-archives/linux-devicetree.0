From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/8] firmware: arm_scpi: add support for legacy SCPI protocol
Date: Wed,  2 Nov 2016 22:52:03 -0600
Message-ID: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This is minor rework of the series[1] from Neil Armstrong's to support
legacy SCPI protocol to make DT bindings more generic and move out all
the platform specific bindings out of the generic binding document.

--
Regards,
Sudeep

[1] http://www.spinics.net/lists/arm-kernel/msg534999.html

Neil Armstrong (4):
  firmware: arm_scpi: increase MAX_DVFS_OPPS to 16 entries
  firmware: arm_scpi: add alternative legacy structures, functions and
    macros
  firmware: arm_scpi: allow firmware with get_capabilities not
    implemented
  Documentation: bindings: Add support for Amlogic GXBB SCPI protocol

Sudeep Holla (4):
  firmware: arm_scpi: add command indirection to support legacy commands
  Documentation: bindings: decouple juno specific details from generic
    binding
  Documentation: bindings: add compatible specific to legacy SCPI
    protocol
  firmware: arm_scpi: add support for legacy SCPI compatible

 .../devicetree/bindings/arm/amlogic,scpi.txt       |  20 ++
 Documentation/devicetree/bindings/arm/arm,scpi.txt |  24 +-
 .../devicetree/bindings/arm/juno,scpi.txt          |  26 ++
 drivers/firmware/arm_scpi.c                        | 276 ++++++++++++++++++---
 4 files changed, 300 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic,scpi.txt
 create mode 100644 Documentation/devicetree/bindings/arm/juno,scpi.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
