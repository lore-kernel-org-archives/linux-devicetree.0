From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use of 4byte-address op codes
Date: Tue, 22 Mar 2016 16:13:56 +0100
Message-ID: <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1458657802.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

This patch adds a new optional DT property which enables an alternative
way of supporting memory size above 16MiB (128Mib). This new mechanism
translates the regular 3byte-address op codes into their 4byte-address
version whereas the old/default mecanism makes the SPI memory enter its
4byte-address mode, which has annoying side effects for early bootloaders.

We cannot discover at run time whether the SPI NOR memory supports the
4byte-address op codes. For instance both Macronix MX25L25635E and
MX25L25673G share the same JEDEC ID (C22019 without any extension byte).
However the first one doesn't support 4byte-address op codes whereas the
second one does.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03e7eb0..8be610482089 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -66,6 +66,17 @@ Optional properties:
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
 
+- m25p,4byte-opcodes: For memory size above 16MiB (128Mib), use the dedicated
+                      4byte-address opcodes instead of entering the 4byte
+                      address mode. This mode changes the internal state of the
+                      chip so may conflict with some early boot loaders, which
+                      expect to use the regular (Fast) Read opcodes with 3byte
+                      address.
+                      However 4byte-address opcodes are not supported by all
+                      chips and support for them can not be detected at runtime.
+                      Refer to you chip's datasheet to check if this is
+                      supported by your chip.
+
 Example:
 
 	flash: m25p80@0 {
-- 
1.8.2.2
