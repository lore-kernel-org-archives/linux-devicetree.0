From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] reset: Add support for OX820 SoC
Date: Fri,  9 Sep 2016 15:19:52 +0200
Message-ID: <20160909131955.27334-1-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the reset controller in the Oxford
Semiconductor OX820 SoC, big brother of the OX810SE.

Since this driver uses a regmap access, it's important to tag each
compatible SoC since the regmap offset could differ in later SoCs.

This patchet also moves the reset indices to a clean DT include file.

Neil Armstrong (3):
  reset: oxnas: Add OX820 support
  dt-bindings: reset: oxnas: Add include file with reset indexes
  dt-bindings: reset: oxnas: Update for OX820

 .../devicetree/bindings/reset/oxnas,reset.txt      | 39 ++--------------
 drivers/reset/reset-oxnas.c                        |  1 +
 include/dt-bindings/reset/oxsemi,ox810se.h         | 53 ++++++++++++++++++++++
 include/dt-bindings/reset/oxsemi,ox820.h           | 53 ++++++++++++++++++++++
 4 files changed, 110 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/oxsemi,ox810se.h
 create mode 100644 include/dt-bindings/reset/oxsemi,ox820.h

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
