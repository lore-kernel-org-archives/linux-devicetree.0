From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 00/18] ARM64: meson: DT cleanups
Date: Fri, 20 Jan 2017 23:21:00 +0100
Message-ID: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series fixes several cosmetic issues, on top of v4.11/dt64 branch.

Patches 3-5 rename a node, the rest should all be non-functional changes.
Patches 10-18 could be squashed if desired.

Regards,
Andreas

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (18):
  Documentation: devicetree: amlogic: Reorder boards
  ARM64: dts: amlogic: Sort Makefile
  ARM64: dts: meson-gxbb-vega-s95: Fix Wifi node name
  ARM64: dts: meson-gxbb-p20x: Fix Wifi node name
  ARM64: dts: meson-gx-p23x-q20x: Fix Wifi node name
  ARM64: dts: meson-gxm-nexbox-a1: Drop UART comment
  ARM64: dts: meson-gxl-s905x: Comment typo fix
  ARM64: dts: meson-gxm: Drop trailing white line
  ARM64: dts: meson-gxbb-wetek-hub: Reference CVBS node by label
  ARM64: dts: meson-gxbb: Reorder nodes
  ARM64: dts: meson-gxbb-odroidc2: Reorder nodes
  ARM64: dts: meson-gxbb-vega-s95: Reorder nodes
  ARM64: dts: meson-gxbb-nexbox-a95x: Reorder nodes
  ARM64: dts: meson-gxbb-p20x: Reorder nodes
  ARM64: dts: meson-gxl: Reorder nodes
  ARM64: dts: meson-gxl-s905x-nexbox-a95x: Reorder nodes
  ARM64: dts: meson-gxm-nexbox-a1: Reorder nodes
  ARM64: dts: meson-gx-p23x-q20x: Reorder nodes

 Documentation/devicetree/bindings/arm/amlogic.txt  | 19 ++++--
 arch/arm64/boot/dts/amlogic/Makefile               |  4 +-
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 26 ++++----
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 28 ++++----
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 52 +++++++--------
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   | 58 ++++++++---------
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 53 ++++++++-------
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |  6 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 76 +++++++++++-----------
 .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    | 28 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 40 ++++++------
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 59 +++++++++--------
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         |  1 -
 14 files changed, 228 insertions(+), 224 deletions(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
