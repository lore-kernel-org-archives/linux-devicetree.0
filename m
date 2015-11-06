From: Kapil Hali <kapilh@broadcom.com>
Subject: [PATCH RESEND v2 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Fri, 6 Nov 2015 14:49:28 -0500
Message-ID: <1446839371-22601-2-git-send-email-kapilh@broadcom.com>
References: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell
 King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Heiko Stuebner <heiko@sntech.de>, Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Olof Johansson <olof@lixom.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, Kapil Hali <kapilh@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
Northstar Plus CPU to the 32-bit ARM CPU device tree binding
documentation file and create a new binding documentation for
Northstar Plus CPU.

Signed-off-by: Kapil Hali <kapilh@broadcom.com>
---
 .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
new file mode 100644
index 0000000..8506da7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
@@ -0,0 +1,36 @@
+Broadcom Northstar Plus SoC CPU Enable Method
+---------------------------------------------
+This binding defines the enable method used for starting secondary
+CPUs in the following Broadcom SoCs:
+  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
+
+The enable method is specified by defining the following required
+properties in the "cpus" device tree node:
+  - enable-method = "brcm,bcm-nsp-smp";
+  - secondary-boot-reg = <...>;
+
+The secondary-boot-reg property is a u32 value that specifies the
+physical address of the register used to request the ROM holding pen
+code release a secondary CPU.
+
+Example:
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "brcm,bcm-nsp-smp";
+		secondary-boot-reg = <0xffff042c>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <1>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 91e6e5c..6abe3f3 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -191,6 +191,7 @@ nodes to be present and contain the properties described below.
 			    "allwinner,sun8i-a23"
 			    "arm,psci"
 			    "brcm,brahma-b15"
+			    "brcm,bcm-nsp-smp"
 			    "marvell,armada-375-smp"
 			    "marvell,armada-380-smp"
 			    "marvell,armada-390-smp"
-- 
2.1.0
