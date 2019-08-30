From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 05/16] dt-bindings: phy-mmp3-usb: Add bindings
Date: Sat, 31 Aug 2019 00:07:32 +0200
Message-ID: <20190830220743.439670-6-lkundrak@v3.sk>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "To : Olof Johansson" <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Lubomir Rintel <lkundrak@v3.sk>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is the PHY chip for USB OTG on MMP3 platform.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v2:
- Add Rob's Reviewed-by tag

Changes since v1:
- s/usbphy@/usb-phy@/
- Dropped a reference to Documentation/phy.txt

 .../devicetree/bindings/phy/phy-mmp3-usb.txt        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
new file mode 100644
index 0000000000000..7183b9102f917
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
@@ -0,0 +1,13 @@
+Marvell MMP3 USB PHY
+--------------------
+
+Required properties:
+- compatible: must be "marvell,mmp3-usb-phy"
+- #phy-cells: must be 0
+
+Example:
+	usb-phy: usb-phy@d4207000 {
+		compatible = "marvell,mmp3-usb-phy";
+		reg = <0xd4207000 0x40>;
+		#phy-cells = <0>;
+	};
-- 
2.21.0
