From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 8/9] ARM: dt/sunxi: add A20 NAND controller
 pin definitions
Date: Wed, 12 Mar 2014 19:07:43 +0100
Message-ID: <1394647664-8258-9-git-send-email-b.brezillon.dev@gmail.com>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDE6NB73YAMBBDOFQKMQKGQEN4CPO3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394647664-8258-1-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Define the NAND controller pin configs.

Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi |   80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 4c14ed8..c8095c5 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -443,6 +443,86 @@
 				allwinner,drive = <0>;
 				allwinner,pull = <0>;
 			};
+
+			nand_pins_a: nand_base0@0 {
+				allwinner,pins = "PC0", "PC1", "PC2",
+						"PC5", "PC8", "PC9", "PC10",
+						"PC11", "PC12", "PC13", "PC14",
+						"PC15", "PC16";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs0_pins_a: nand_cs@0 {
+				allwinner,pins = "PC4";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs1_pins_a: nand_cs@1 {
+				allwinner,pins = "PC3";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs2_pins_a: nand_cs@2 {
+				allwinner,pins = "PC17";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs3_pins_a: nand_cs@3 {
+				allwinner,pins = "PC18";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs4_pins_a: nand_cs@4 {
+				allwinner,pins = "PC19";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs5_pins_a: nand_cs@5 {
+				allwinner,pins = "PC20";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs6_pins_a: nand_cs@6 {
+				allwinner,pins = "PC21";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_cs7_pins_a: nand_cs@7 {
+				allwinner,pins = "PC22";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_rb0_pins_a: nand_rb@0 {
+				allwinner,pins = "PC6";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			nand_rb1_pins_a: nand_rb@1 {
+				allwinner,pins = "PC7";
+				allwinner,function = "nand0";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
 		};
 
 		timer@01c20c00 {
-- 
1.7.9.5
