From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/12] add dts nodes to MT7622 SoC
Date: Thu, 4 Jan 2018 17:40:50 +0800
Message-ID: <cover.1515057696.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add dts nodes to MT7622 SoC and related rfb1 board

Ryder Lee (2):
  arm64: dts: mt7622: add PCIe device nodes
  arm64: dts: mt7622: add SATA device nodes

Sean Wang (10):
  dt-bindings: clock: mediatek: add missing required #reset-cells
  arm64: dts: mt7622: add clock controller device nodes
  arm64: dts: mt7622: add power domain controller device nodes
  arm64: dts: mt7622: add pinctrl related device nodes
  arm64: dts: mt7622: add PMIC MT6380 related nodes
  arm64: dts: mt7622: add cpufreq related device nodes
  arm64: dts: mt7622: turn uart0 clock to real ones
  arm64: dts: mt7622: add SoC and peripheral related device nodes
  arm64: dts: mt7622: add flash related device nodes
  arm64: dts: mt7622: add ethernet device nodes

 .../bindings/arm/mediatek/mediatek,ethsys.txt      |   2 +
 .../bindings/arm/mediatek/mediatek,pciesys.txt     |   2 +
 .../bindings/arm/mediatek/mediatek,ssusbsys.txt    |   2 +
 arch/arm64/boot/dts/mediatek/mt6380.dtsi           |  91 ++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       | 337 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           | 533 ++++++++++++++++++++-
 6 files changed, 962 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6380.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
