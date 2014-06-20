From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v9 3/3] dt-bindings: add mtk-timer bindings
Date: Fri, 20 Jun 2014 13:48:49 +0200
Message-ID: <1403264929-21325-4-git-send-email-matthias.bgg@gmail.com>
References: <1403264929-21325-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403264929-21325-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, grant.likely@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, shawn.guo@freescale.com, anders.berg@lsi.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the General Porpose Timer driver of
the Mediatek SoCs.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/timer/mediatek,mtk-timer.txt          |   18 ++++++++++++=
++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mt=
k-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer=
=2Etxt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
new file mode 100644
index 0000000..10b7e09
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -0,0 +1,18 @@
+Mediatek MT6577, MT6572 and MT6589 Timers
+---------------------------------------
+
+Required properties:
+- compatible: Should be "mediatek,mt6577-timer"
+- reg: Should contain location and length for timers register.
+- clocks: Clocks driving the timer hardware. This list should include =
two
+	clocks. The order is system clock and as second clock the RTC clock.
+
+Examples:
+
+	timer@10008000 {
+		compatible =3D "mediatek,mt6577-timer";
+		reg =3D <0x10008000 0x80>;
+		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+		clocks =3D <&system_clk>, <&rtc_clk>;
+		clock-names =3D "system-clk", "rtc-clk";
+	};
--=20
1.7.9.5
