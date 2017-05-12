From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] Fix mdp device tree
Date: Fri, 12 May 2017 11:15:11 +0800
Message-ID: <1494558914-41591-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

If the mdp_* nodes are under an mdp sub-node, their corresponding
platform device does not automatically get its iommu assigned properly.

Fix this by moving the mdp component nodes up a level such that they are
siblings of mdp and all other SoC subsystems.  This also simplifies the
device tree.

Although it fixes iommu assignment issue, it also break compatibility
with old device tree. So, the patch in driver is needed to iterate over
sibling mdp device nodes, not child ones, to keep driver work properly.

Daniel Kurtz (2):
  arm64: dts: mt8173: Fix mdp device tree
  media: mtk-mdp: Fix mdp device tree

Minghsiu Tsai (1):
  dt-bindings: mt8173: Fix mdp device tree

 .../devicetree/bindings/media/mediatek-mdp.txt     |  12 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 126 ++++++++++-----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |   2 +-
 3 files changed, 64 insertions(+), 76 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
