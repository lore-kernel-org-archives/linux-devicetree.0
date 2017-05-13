From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 0/3] arm64: meson-gxm: R-Box Pro enablement
Date: Sat, 13 May 2017 17:23:09 +0200
Message-ID: <20170513152312.19912-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, ada@kingnoval.com
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds initial support for the Amlogic S912 based
R-Box Pro TV boxes.

v2 depends on my Meson cleanup series (amlogic.txt, Makefile) and
squashes the addition of a board compatible string.

@Kingnovel: Your Acked-by would be appreciated.

Regards,
Andreas

v1 -> v2:
* Dropped Bluetooth patch, awaiting serdev drivers (Kevin)
* Rebased onto my cleanup series
* Added vendor prefix
* Added board compatible string

Cc: devicetree@vger.kernel.org
Cc: ada@kingnoval.com

Andreas Färber (3):
  dt-bindings: Add Kingnovel vendor prefix
  dt-bindings: arm: amlogic: Add R-Box Pro
  arm64: dts: meson-gxm: Add R-Box Pro

 Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 240 +++++++++++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts

-- 
2.12.0
