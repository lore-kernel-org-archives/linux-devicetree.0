From: Adam Baker <linux@baker-net.org.uk>
Subject: [PATCH 3/3] ARM: mvebu: Add the hardware monitor to the NSA320 device
 tree
Date: Wed, 10 Feb 2016 23:33:44 +0000
Message-ID: <1455147224-6742-4-git-send-email-linux@baker-net.org.uk>
References: <1455147224-6742-1-git-send-email-linux@baker-net.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1455147224-6742-1-git-send-email-linux@baker-net.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Adam Baker <linux@baker-net.org.uk>, lm-sensors@lm-sensors.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add an entry for the hardware monitoring MCU

Signed-off-by: Adam Baker <linux@baker-net.org.uk>
---
 arch/arm/boot/dts/kirkwood-nsa320.dts | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-nsa320.dts b/arch/arm/boot/dts/kirkwood-nsa320.dts
index 24f686d..2a935e9 100644
--- a/arch/arm/boot/dts/kirkwood-nsa320.dts
+++ b/arch/arm/boot/dts/kirkwood-nsa320.dts
@@ -193,10 +193,19 @@
 		};
 	};
 
+	hwmon {
+		compatible = "zyxel,nsa320-mcu";
+		pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
+		pinctrl-names = "default";
+
+		data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
+	};
+
 	/* The following pins are currently not assigned to a driver,
 	   some of them should be configured as inputs.
-	pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act
-		     &pmx_htp &pmx_vid_b1
+	pinctrl-0 = <&pmx_htp &pmx_vid_b1
 		     &pmx_power_resume_data &pmx_power_resume_clk>; */
 };
 
-- 
2.1.4
