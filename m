From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/3] arm64: dts: Initial MeLE V9 support
Date: Mon, 16 Oct 2017 05:01:50 +0200
Message-ID: <20171016030153.11078-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Bizon <bizongod@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, meleservice@mele.cn, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds a Device Tree for the MeLE V9 Android Media Player.

Same as with PROBOX2 AVA, serial (loady) was the only working way to boot a new
kernel from the vendor's U-Boot on this TV box.

More details at:
https://en.opensuse.org/HCL:Mele_V9

@MeLE: Please review the following three patches and either signal your
acknowledgement of my naming proposals with an "Acked-by: name <email>"
response or point out any changes you would like to see applied. Thanks!

Latest experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: meleservice@mele.cn
Cc: devicetree@vger.kernel.org

Andreas Färber (3):
  dt-bindings: Add vendor prefix for MeLE
  dt-bindings: arm: realtek: Document MeLE V9
  arm64: dts: realtek: Add MeLE V9

 Documentation/devicetree/bindings/arm/realtek.txt  |  1 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/realtek/Makefile               |  1 +
 arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts    | 31 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-mele-v9.dts

-- 
2.13.6
