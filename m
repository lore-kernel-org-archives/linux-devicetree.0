From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH v4 2/2] ARM: socfpga: dts: add sdram controller dt binding doc
Date: Fri, 22 May 2015 13:02:15 -0500
Message-ID: <1432317735-29413-3-git-send-email-atull@opensource.altera.com>
References: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1432317735-29413-1-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alan Tull <atull@opensource.altera.com>, Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Delicious Quinoq <delicious.quinoa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding doc for Altera SOCFPGA SDRAM controller.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v4: Add bindings doc
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
