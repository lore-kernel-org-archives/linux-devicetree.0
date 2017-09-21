From: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] AUXADC: Mediatek auxadc driver for mt2712
Date: Thu, 21 Sep 2017 09:26:49 +0800
Message-ID: <1505957212-13402-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series includes three patches:
1.Add mt2712 auxadc compatible node in binding document.
2.Add mt2712 auxadc compatible node in "mt6577_auxadc.c".
2.Add mt2712 auxadc device node.

Zhiyong Tao (3):
  dt-bindings: adc: mt2712: add binding document
  iio: adc: mt2712: Add compatible node for mt2712.
  arm64: dts: mt2712: Add auxadc device node.

 .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |    1 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |    4 ++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |    9 +++++++++
 drivers/iio/adc/mt6577_auxadc.c                    |    1 +
 4 files changed, 15 insertions(+)

--
1.7.9.5
