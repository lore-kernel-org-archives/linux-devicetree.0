From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 01/10] devicetree: bindings: add DT binding for the Marvell Armada 39x SoC family
Date: Fri,  6 Feb 2015 16:57:47 +0100
Message-ID: <1423238276-9206-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The Marvell Armada 39x is a family of two SoCs: the Armada 390 and the
Armada 398, with a slightly different number of interfaces. This
commit introduces the Device Tree binding that documents the top-level
compatible strings for Armada 39x based platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/armada-39x.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/armada-39x.txt

diff --git a/Documentation/devicetree/bindings/arm/armada-39x.txt b/Documentation/devicetree/bindings/arm/armada-39x.txt
new file mode 100644
index 0000000..53d4ff9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/armada-39x.txt
@@ -0,0 +1,20 @@
+Marvell Armada 39x Platforms Device Tree Bindings
+-------------------------------------------------
+
+Boards with a SoC of the Marvell Armada 39x family shall have the
+following property:
+
+Required root node property:
+
+ - compatible: must contain "marvell,armada390"
+
+In addition, boards using the Marvell Armada 398 SoC shall have the
+following property before the previous one:
+
+Required root node property:
+
+compatible: must contain "marvell,armada398"
+
+Example:
+
+compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada390";
-- 
2.1.0

