From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Mediatek MT2701 SCPSYS power domain support
Date: Wed, 30 Dec 2015 14:41:42 +0800
Message-ID: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.4-rc7, add scpsys power domain support for
Mediatek MT2701/MT7623.

This patchset also separate MT8173 scpsys driver into common part
(mtk-scpsys.c) and platform part (mtk-scpsys-mt8173.c), so that MT2701
scpsys driver can share most implementation with MT8173.

James Liao (2):
  soc: mediatek: Separate scpsys driver common code
  soc: mediatek: Init MT8173 scpsys driver earlier

Shunli Wang (2):
  soc: mediatek: Add MT2701 power dt-bindings
  soc: mediatek: Add MT2701/MT7623 scpsys driver

 drivers/soc/mediatek/Kconfig             |  24 ++-
 drivers/soc/mediatek/Makefile            |   2 +
 drivers/soc/mediatek/mtk-scpsys-mt2701.c | 161 +++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys-mt8173.c | 190 +++++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys.c        | 301 ++++++++-----------------------
 drivers/soc/mediatek/mtk-scpsys.h        |  54 ++++++
 include/dt-bindings/power/mt2701-power.h |  27 +++
 7 files changed, 531 insertions(+), 228 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-mt2701.c
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-mt8173.c
 create mode 100644 drivers/soc/mediatek/mtk-scpsys.h
 create mode 100644 include/dt-bindings/power/mt2701-power.h

--
1.9.1
