From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/4] Mediatek MT2701 SCPSYS power domain support
Date: Wed, 20 Jan 2016 14:08:13 +0800
Message-ID: <1453270097-53853-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on v4.4-next/soc from Matthias [1], which is
4.4-rc1 plus 2 patches. This patchset adds scpsys power domain support
for Mediatek MT2701.

The major change from v3 is merging MT2701 and MT8173 scpsys support
in a single file (mtk-scpsys.c).

To share the code between MT2701 and MT8173, this patchset also refined
original mtk-scpsys.c to separate common codes and platform codes, so
that mtk-scpsys.c can support new SoCs more easily.

MT8173 and MT2701 scpsys init level are now subsys_init. Please refer to [2]
to see discussion details.

changes since v3:
- Implement MT8173 and MT2701 scpsys drivers in a signle file.
- Remove naming of registers that can't be shared among SoCs.

changes since v2:
- Rebase to mbgg/linux-mediatek v4.4-next/soc [1].
- Remove MTK_SCPSYS_MT8173 and MTK_SCPSYS_MT2701.
- Modify scpsys dt-binding document to support MT2701.

changes since v1:
- Make MTK_SCPSYS in Kconfig invisible from users.
- Add comments for changing scpsys init level to subsys_init.

[1] https://github.com/mbgg/linux-mediatek/commits/v4.4-next/soc
[2] http://lists.infradead.org/pipermail/linux-mediatek/2015-December/003416.html

James Liao (2):
  soc: mediatek: Refine scpsys to support multiple platform
  soc: mediatek: Init MT8173 scpsys driver earlier

Shunli Wang (2):
  soc: mediatek: Add MT2701 power dt-bindings
  soc: mediatek: Add MT2701 scpsys driver

 .../devicetree/bindings/soc/mediatek/scpsys.txt    |   6 +-
 drivers/soc/mediatek/mtk-scpsys.c                  | 534 +++++++++++++--------
 drivers/soc/mediatek/mtk-scpsys.h                  |  55 +++
 include/dt-bindings/power/mt2701-power.h           |  27 ++
 4 files changed, 416 insertions(+), 206 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys.h
 create mode 100644 include/dt-bindings/power/mt2701-power.h

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
