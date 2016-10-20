From: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: sun8i: Support NanoPi SBCs
Date: Thu, 20 Oct 2016 17:06:58 +0900
Message-ID: <20161020080701.15993-1-woogyom.kim@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>, Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

NanoPi M1 and NEO have common features, so duplicate properties can be 
moved into new dtsi file.

Milo Kim (3):
  ARM: dts: sun8i: Add common dtsi file for NanoPi SBCs
  ARM: dts: sun8i: Use the common file in NanoPi NEO SBC
  ARM: dts: sun8i: Add dts file for NanoPi M1 SBC

 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts  |  64 +++++++++++++
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts |  79 +----------------
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi    | 143 ++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+), 78 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
