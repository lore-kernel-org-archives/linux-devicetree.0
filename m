From: <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC 0/3] MT8173 CMDQ support
Date: Wed, 20 Jan 2016 13:14:37 +0800
Message-ID: <1453266881-16849-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

This is the first version to add Mediatek MT8173 Command Queue(CMDQ)
support. The CMDQ is used to help read/write registers with critical
time limitation, such as updating display configuration during the
vblank. It controls Global Command Engine (GCE) hardware to achieve
this requirement.

These patches have a build dependency on top of v4.4-rc1.

Best regards,
HS Liao

HS Liao (3):
  dt-bindings: soc: Add documentation for the MediaTek GCE unit
  arm64: dts: mt8173: Add GCE node
  CMDQ: Mediatek CMDQ driver

 .../devicetree/bindings/soc/mediatek/gce.txt       |   33 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    8 +
 drivers/soc/mediatek/Kconfig                       |   10 +
 drivers/soc/mediatek/Makefile                      |    1 +
 drivers/soc/mediatek/mtk-cmdq.c                    | 3532 ++++++++++++++++++++
 include/soc/mediatek/cmdq.h                        |  225 ++
 6 files changed, 3809 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/gce.txt
 create mode 100644 drivers/soc/mediatek/mtk-cmdq.c
 create mode 100644 include/soc/mediatek/cmdq.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
