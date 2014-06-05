From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v7 6/7] dt-bindings: add documentation for Mediatek SoC
Date: Thu,  5 Jun 2014 19:26:20 +0200
Message-ID: <1401989181-4712-7-git-send-email-matthias.bgg@gmail.com>
References: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, matthias.bgg@gmail.com, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds a DT binding documentation for the MT6589 SoC from Mediatek.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.txt |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
new file mode 100644
index 0000000..d6ac71f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -0,0 +1,8 @@
+Mediatek MT6589 Platforms Device Tree Bindings
+
+Boards with a SoC of the Mediatek MT6589 shall have the following property:
+
+Required root node property:
+
+compatible: must contain "mediatek,mt6589"
+
-- 
1.7.9.5
