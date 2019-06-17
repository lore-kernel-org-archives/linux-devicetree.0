From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/4] dt-bindings: clock: mvebu: Add compatible string for 98dx1135 core clock
Date: Tue, 18 Jun 2019 09:54:56 +1200
Message-ID: <20190617215458.32688-3-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Add compatible string for the core clock on the 98dx1135 switch with
integrated CPU.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- Update description to make it clear the clock names are the same as Kir=
kwood

 Documentation/devicetree/bindings/clock/mvebu-core-clock.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt=
 b/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
index 796c260c183d..d8f5c490f893 100644
--- a/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
+++ b/Documentation/devicetree/bindings/clock/mvebu-core-clock.txt
@@ -59,6 +59,7 @@ Required properties:
 	"marvell,dove-core-clock" - for Dove SoC core clocks
 	"marvell,kirkwood-core-clock" - for Kirkwood SoC (except mv88f6180)
 	"marvell,mv88f6180-core-clock" - for Kirkwood MV88f6180 SoC
+	"marvell,mv98dx1135-core-clock" - for Kirkwood 98dx1135 SoC
 	"marvell,mv88f5181-core-clock" - for Orion MV88F5181 SoC
 	"marvell,mv88f5182-core-clock" - for Orion MV88F5182 SoC
 	"marvell,mv88f5281-core-clock" - for Orion MV88F5281 SoC
--=20
2.21.0
