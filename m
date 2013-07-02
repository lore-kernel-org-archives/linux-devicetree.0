From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: remove dmacap,memset from Device tree binding
Date: Tue,  2 Jul 2013 12:54:12 +0200
Message-ID: <1372762453-12018-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1372762453-12018-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372762453-12018-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DMA_MEMSET support has been removed, so update the device tree files
and corresponding binding documentation for Marvell SoCs.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> 
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org 
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
---
 Documentation/devicetree/bindings/dma/mv-xor.txt |    2 --
 arch/arm/boot/dts/armada-370.dtsi                |    2 --
 arch/arm/boot/dts/armada-xp.dtsi                 |    2 --
 arch/arm/boot/dts/dove.dtsi                      |    2 --
 arch/arm/boot/dts/kirkwood.dtsi                  |    2 --
 arch/arm/boot/dts/orion5x.dtsi                   |    1 -
 6 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/mv-xor.txt b/Documentation/devicetree/bindings/dma/mv-xor.txt
index 7c6cb7f..68f7004 100644
--- a/Documentation/devicetree/bindings/dma/mv-xor.txt
+++ b/Documentation/devicetree/bindings/dma/mv-xor.txt
@@ -14,7 +14,6 @@ properties:
 
 And the following optional properties:
 - dmacap,memcpy to indicate that the XOR channel is capable of memcpy operations
-- dmacap,memset to indicate that the XOR channel is capable of memset operations
 - dmacap,xor to indicate that the XOR channel is capable of xor operations
 
 Example:
@@ -35,6 +34,5 @@ xor@d0060900 {
 	      interrupts = <52>;
 	      dmacap,memcpy;
 	      dmacap,xor;
-	      dmacap,memset;
 	};
 };
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index fa3dfc6..a315ad1 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -132,7 +132,6 @@
 					interrupts = <52>;
 					dmacap,memcpy;
 					dmacap,xor;
-					dmacap,memset;
 				};
 			};
 
@@ -151,7 +150,6 @@
 					interrupts = <95>;
 					dmacap,memcpy;
 					dmacap,xor;
-					dmacap,memset;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 416eb94..4b3dd56 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -114,7 +114,6 @@
 					interrupts = <52>;
 					dmacap,memcpy;
 					dmacap,xor;
-					dmacap,memset;
 				};
 			};
 
@@ -134,7 +133,6 @@
 					interrupts = <95>;
 					dmacap,memcpy;
 					dmacap,xor;
-					dmacap,memset;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 6cab468..2cef34f 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -232,7 +232,6 @@
 
 			channel1 {
 				interrupts = <40>;
-				dmacap,memset;
 				dmacap,memcpy;
 				dmacap,xor;
 			};
@@ -253,7 +252,6 @@
 
 			channel1 {
 				interrupts = <43>;
-				dmacap,memset;
 				dmacap,memcpy;
 				dmacap,xor;
 			};
diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 9809fc1..078637c 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -126,7 +126,6 @@
 			      interrupts = <6>;
 			      dmacap,memcpy;
 			      dmacap,xor;
-			      dmacap,memset;
 			};
 		};
 
@@ -146,7 +145,6 @@
 			      interrupts = <8>;
 			      dmacap,memcpy;
 			      dmacap,xor;
-			      dmacap,memset;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/orion5x.dtsi b/arch/arm/boot/dts/orion5x.dtsi
index 892c64e..f82ece7 100644
--- a/arch/arm/boot/dts/orion5x.dtsi
+++ b/arch/arm/boot/dts/orion5x.dtsi
@@ -120,7 +120,6 @@
 			      interrupts = <31>;
 			      dmacap,memcpy;
 			      dmacap,xor;
-			      dmacap,memset;
 			};
 		};
 
-- 
1.7.2.5
