From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH] powerpc/85xx: typo in dts: "interupt" (four devices)
Date: Tue, 12 Nov 2013 17:56:51 +0100
Message-ID: <1384275411-18314-1-git-send-email-kilobyte@angband.pl>
References: <20131112091128.GA2976@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20131112091128.GA2976@e106331-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Mark Rutland <mark.rutland@arm.com>, rob.herring@calxeda.com, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Adam Borowski <kilobyte@angband.pl>
List-Id: devicetree@vger.kernel.org

These lines were inoperative for four years, which puts some doubt into
their importance, and it's possible the fixed version will regress, but
at the very least they should be removed instead.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 arch/powerpc/boot/dts/xcalibur1501.dts | 4 ++--
 arch/powerpc/boot/dts/xpedite5301.dts  | 4 ++--
 arch/powerpc/boot/dts/xpedite5330.dts  | 4 ++--
 arch/powerpc/boot/dts/xpedite5370.dts  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/boot/dts/xcalibur1501.dts b/arch/powerpc/boot/dts/xcalibur1501.dts
index cc00f4d..c409cba 100644
--- a/arch/powerpc/boot/dts/xcalibur1501.dts
+++ b/arch/powerpc/boot/dts/xcalibur1501.dts
@@ -637,14 +637,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2>;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5301.dts b/arch/powerpc/boot/dts/xpedite5301.dts
index 53c1c6a..04cb410 100644
--- a/arch/powerpc/boot/dts/xpedite5301.dts
+++ b/arch/powerpc/boot/dts/xpedite5301.dts
@@ -547,14 +547,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2>;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5330.dts b/arch/powerpc/boot/dts/xpedite5330.dts
index 2152259..73f8620 100644
--- a/arch/powerpc/boot/dts/xpedite5330.dts
+++ b/arch/powerpc/boot/dts/xpedite5330.dts
@@ -583,14 +583,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2>;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5370.dts b/arch/powerpc/boot/dts/xpedite5370.dts
index 11dbda1..cd0ea2b 100644
--- a/arch/powerpc/boot/dts/xpedite5370.dts
+++ b/arch/powerpc/boot/dts/xpedite5370.dts
@@ -545,14 +545,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2>;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
-- 
1.8.5.rc0
