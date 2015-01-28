From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/3] dts: versatile: add sysregs node
Date: Wed, 28 Jan 2015 11:56:32 -0600
Message-ID: <1422467792-2065-4-git-send-email-robh@kernel.org>
References: <1422467792-2065-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422467792-2065-1-git-send-email-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Versatile boards have the same sysregs as other ARM Ltd boards. Add
the nodes in order to enable support for 24MHz counter as sched_clock.

This is a minimal node definition as the existing sub node definition
used on VExpress has some issues raised by Linus W.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org
---
 arch/arm/boot/dts/versatile-ab.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 27d0d9c..01f4019 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -252,6 +252,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x10000000 0x10000>;
 
+			sysreg@0 {
+				compatible = "arm,versatile-sysreg", "syscon";
+				reg = <0x00000 0x1000>;
+			};
+
 			aaci@4000 {
 				compatible = "arm,primecell";
 				reg = <0x4000 0x1000>;
-- 
2.1.0
