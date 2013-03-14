From: "Christian Daudt" <csd@broadcom.com>
Subject: [PATCH V2 2/2] ARM: bcm281xx: Add DT support for SMC handler
Date: Thu, 14 Mar 2013 15:14:28 -0700
Message-ID: <1363299268-10506-2-git-send-email-csd@broadcom.com>
References: <1363299268-10506-1-git-send-email-csd@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1363299268-10506-1-git-send-email-csd@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, abhimanyu.kapur@outlook.com, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>
Cc: Christian Daudt <csd@broadcom.com>, csd_b@daudt.org, devicetree-discuss@lists.ozlabs.org, "arm@kernel.org" <arm@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

- Adds devicetree binding and documentation for the smc handler

Updates from V1:
- Created this separate patch for the DT portion
- Added SoC compatible to smc binding

Signed-off-by: Christian Daudt <csd@broadcom.com>

diff --git a/Documentation/devicetree/bindings/misc/smc.txt b/Documentation/devicetree/bindings/misc/smc.txt
new file mode 100644
index 0000000..02b4281
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/smc.txt
@@ -0,0 +1,14 @@
+Broadcom Secure Monitor Bounce buffer
+-----------------------------------------------------
+This binding defines the location of the bounce buffer
+used for non-secure to secure communications.
+
+Required properties:
+- compatible : "bcm,kona-smc"
+- reg : Location and size of bounce buffer
+
+Example:
+	smc@0x3404c000 {
+		compatible = "bcm,bcm11351-smc", "bcm,kona-smc";
+		reg = <0x3404c000 0x400>; //1 KiB in SRAM
+	};
diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 8f71f40..b2b9d80 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -55,4 +55,9 @@
 		clock-frequency = <32768>;
 	};
 
+	smc@0x3404c000 {
+		compatible = "bcm,bcm11351-smc", "bcm,kona-smc";
+		reg = <0x3404c000 0x400>; //1 KiB in SRAM
+	};
+
 };
-- 
1.7.10.4
