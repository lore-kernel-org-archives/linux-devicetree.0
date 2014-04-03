From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: [PATCH v2 0/2] ARM: dts: add initial Colibri VF61 board support
Date: Thu,  3 Apr 2014 17:47:08 +0200
Message-ID: <cover.1396539657.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

This patches adds initial support for Toradex Colibri VF61
computer-on-module.

Changes since v1:
- Reorder DTS for better readability
- Dumped my broken version of the alphabet and reorderd vendor prefixes

Stefan Agner (2):
  of: add vendor prefix for Toradex AG
  ARM: dts: add initial Colibri VF61 board support

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/vf610-colibri.dts                | 123 +++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm/boot/dts/vf610-colibri.dts

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
