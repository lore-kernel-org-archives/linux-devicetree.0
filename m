From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 4/5] devicetree: bindings: Document supported Allwinner sunxi SoCs
Date: Wed,  8 Oct 2014 21:02:55 +0800
Message-ID: <1412773376-25212-5-git-send-email-wens@csie.org>
References: <1412773376-25212-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412773376-25212-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shuge <shuge@allwinnertech.com>, Meng Zhang <kevin@allwinnertech.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: devicetree@vger.kernel.org

This adds a list of supported Allwinner SoC bindings.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi.txt

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
new file mode 100644
index 0000000..42941fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -0,0 +1,12 @@
+Allwinner sunXi Platforms Device Tree Bindings
+
+Each device tree must specify which Allwinner SoC it uses,
+using one of the following compatible strings:
+
+  allwinner,sun4i-a10
+  allwinner,sun5i-a10s
+  allwinner,sun5i-a13
+  allwinner,sun6i-a31
+  allwinner,sun7i-a20
+  allwinner,sun8i-a23
+  allwinner,sun9i-a80
-- 
2.1.1
