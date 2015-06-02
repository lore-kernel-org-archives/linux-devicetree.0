From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCHv6 2/2] ARM: socfpga: dts: add sdram controller dt binding doc
Date: Tue, 2 Jun 2015 13:35:39 -0500
Message-ID: <1433270139-7042-3-git-send-email-atull@opensource.altera.com>
References: <1433270139-7042-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433270139-7042-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pavel Machek <pavel@denx.de>, Arnd Bergmann <arnd@arndb.de>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Alan Tull <atull@opensource.altera.com>, Delicious Quinoq <delicious.quinoa@gmail.com>
List-Id: devicetree@vger.kernel.org

Add binding doc for Altera SOCFPGA SDRAM controller.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v4: Add bindings doc
v5: No change for v5
v6: No change for v6
---
 .../arm/altera/socfpga-sdram-controller.txt        |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
new file mode 100644
index 0000000..77ca635
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
@@ -0,0 +1,12 @@
+Altera SOCFPGA SDRAM Controller
+
+Required properties:
+- compatible : Should contain "altr,sdr-ctl" and "syscon".
+  syscon is required by the Altera SOCFPGA SDRAM EDAC.
+- reg : Should contain 1 register range (address and length)
+
+Example:
+	sdr: sdr@ffc25000 {
+		compatible = "altr,sdr-ctl", "syscon";
+		reg = <0xffc25000 0x1000>;
+	};
-- 
1.7.9.5
