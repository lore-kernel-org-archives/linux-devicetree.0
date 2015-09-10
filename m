From: Olliver Schinagl <o.schinagl@ultimaker.com>
Subject: [PATCH v2 1/5] dts: sunxi: add eeprom to A10 OLinuXino Lime board
Date: Thu, 10 Sep 2015 10:31:17 +0200
Message-ID: <1441873881-3665-2-git-send-email-o.schinagl@ultimaker.com>
References: <1441873881-3665-1-git-send-email-o.schinagl@ultimaker.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1441873881-3665-1-git-send-email-o.schinagl@ultimaker.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver@schinagl.nl>

The Olimex A10 OLinuXino Lime features an eeprom that is always on the
board. This patch adds it to the dts.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
index b64aa4e..0f3ed86 100644
--- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
@@ -124,6 +124,18 @@
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_a>;
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
 &mdio {
 	status = "okay";
 
-- 
2.1.4
