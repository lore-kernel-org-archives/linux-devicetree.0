From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] Allwinner A83T R_LRADC support
Date: Tue, 20 Jun 2017 21:44:42 +0800
Message-ID: <20170620134445.23097-1-techping.chan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi,

This is the remaining parts of my A83T R_LRADC support series

Allwinner A83T SoC has a low res adc like the one in Allwinner
A10 SoC.

Add support for it. 

Changes for v2:
- Add an A83T specific compatible.

Ziping Chen (3):
  input: sun4i-a10-lradc-keys: Add support for A83T
  dt-bindings: input: Add DT bindings documentation for Allwinner A83T
    R_LRADC
  ARM: dts: sunxi: add R_LRADC support for A83T

 .../devicetree/bindings/input/sun4i-lradc-keys.txt |  6 ++--
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |  7 ++++
 drivers/input/keyboard/sun4i-lradc-keys.c          | 39 +++++++++++++++++++---
 3 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
