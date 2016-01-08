From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] Mediatek MT2701 SCPSYS power domain support
Date: Fri, 8 Jan 2016 11:32:44 +0800
Message-ID: <1452223968-6566-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.4-rc7, add scpsys power domain support for
Mediatek MT2701.

This patchset also separate MT8173 scpsys driver into common part
(mtk-scpsys.c) and platform part (mtk-scpsys-mt8173.c), so that MT2701
scpsys driver can share most implementation with MT8173.

MT8173 and MT2701 scpsys init level are now subsys_init. Please refer to [1]
to see discussion details.

changes since v1:
- Make MTK_SCPSYS in Kconfig invisible from users.
- Add comments for changing scpsys init level to subsys_init.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2015-December/003416.html

James Liao (2):
  soc: mediatek: Separate scpsys driver common code
  soc: mediatek: Init MT8173 scpsys driver earlier

Shunli Wang (2):
  soc: mediatek: Add MT2701 power dt-bindings
  soc: mediatek: Add MT2701 scpsys driver

 drivers/soc/mediatek/Kconfig             |  27 ++-
 drivers/soc/mediatek/Makefile            |   2 +
 drivers/soc/mediatek/mtk-scpsys-mt2701.c | 172 ++++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys-mt8173.c | 201 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys.c        | 301 ++++++++-----------------------
 drivers/soc/mediatek/mtk-scpsys.h        |  54 ++++++
 include/dt-bindings/power/mt2701-power.h |  27 +++
 7 files changed, 554 insertions(+), 230 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-mt2701.c
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-mt8173.c
 create mode 100644 drivers/soc/mediatek/mtk-scpsys.h
 create mode 100644 include/dt-bindings/power/mt2701-power.h

--
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
