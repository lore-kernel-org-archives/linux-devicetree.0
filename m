From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Add spi/iommu/nand/auxadc DT nodes for Mediatek MT2701
Date: Wed, 11 Jan 2017 16:38:40 +0800
Message-ID: <1484123924-8946-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series base on v4.10-rc2, include MT2701 spi/iommu/nand/auxadc DT nodes.

Dependent on "Add clock and power domain DT nodes for Mediatek MT2701"[1].

[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-December/007637.html

Honghui Zhang (1):
  arm: dts: mt2701: Add iommu/smi device node

Leilk Liu (1):
  arm: dts: mt2701: Add spi device node

Xiaolei Li (1):
  arm: dts: mt2701: Add nand device node

Zhiyong Tao (1):
  arm: dts: mt2701: Add auxadc device node.

 arch/arm/boot/dts/mt2701.dtsi | 124 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
