From: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC v2 0/3] Mediatek MT8173 CMDQ support
Date: Tue, 1 Mar 2016 21:29:13 +0800
Message-ID: <1456838956-16153-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

This is Mediatek MT8173 Command Queue(CMDQ) driver. The CMDQ is used
to help read/write registers with critical time limitation, such as
updating display configuration during the vblank. It controls Global
Command Engine (GCE) hardware to achieve this requirement.

These patches have a build dependency on top of v4.5-rc1.

Changes since v1:
 - update device tree binding doc
 - use void* for base address
 - use size_t for "size in bytes"
 - use cmdq_thread instead of thread id
 - use flags instead of scenarios
 - call cmdq_event_reset() in suitable places
 - use ktime instead of sched_clock
 - use struct device instead of struct platform_device if possible
 - rename recorder to record
 - correct some typos and remove some useless code

Best regards,
HS Liao

HS Liao (3):
  dt-bindings: soc: Add documentation for the MediaTek GCE unit
  arm64: dts: mt8173: Add GCE node
  CMDQ: Mediatek CMDQ driver

 .../devicetree/bindings/soc/mediatek/gce.txt       |   34 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    8 +
 drivers/soc/mediatek/Kconfig                       |   10 +
 drivers/soc/mediatek/Makefile                      |    1 +
 drivers/soc/mediatek/mtk-cmdq.c                    | 2788 ++++++++++++++++++++
 include/soc/mediatek/cmdq.h                        |  211 ++
 6 files changed, 3052 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/gce.txt
 create mode 100644 drivers/soc/mediatek/mtk-cmdq.c
 create mode 100644 include/soc/mediatek/cmdq.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
