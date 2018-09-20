Return-Path: <SRS0=lNwp=MC=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 3/4] Input: egalax_ts - add property for protocol version
Date: Thu, 20 Sep 2018 16:22:55 +0200
Message-Id: <20180920142256.2788-3-l.stach@pengutronix.de>
In-Reply-To: <20180920142256.2788-1-l.stach@pengutronix.de>
References: <20180920142256.2788-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

EETI changed the i2c protocol in an incompatible way at some point. The
documentation doesn't state if there is a way to autodetect the used
protocol. Thus we introduce a DT property to let the driver know about
the protocol version used by the touch controller.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../devicetree/bindings/input/touchscreen/egalax-ts.txt   | 8 ++++++++
 drivers/input/touchscreen/egalax_ts.c                     | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
index 92fb2620f5e2..41be6287589d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
@@ -7,6 +7,13 @@ Required properties:
 - wakeup-gpios: the gpio pin to be used for waking up the controller
   and also used as irq pin
 
+Optional properties:
+- eeti,protocol-version: protocol version used by the controller
+	0: This is the default protocol used when the property is absent. This
+	protocol supports up to 5 touch points with 1 points per report.
+	1: Protocol supports up to 10 touch points with a maximum of 5 points
+	per report.
+
 Example:
 
 	touchscreen@4 {
@@ -15,4 +22,5 @@ Example:
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 2>;
 		wakeup-gpios = <&gpio1 9 0>;
+		eeti,protocol-version = <1>;
 	};
diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 4c751f8f806d..0f924d8c17c8 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -58,6 +58,7 @@
 struct egalax_ts {
 	struct i2c_client		*client;
 	struct input_dev		*input_dev;
+	int				protocol_version;
 	struct touchscreen_properties	props;
 };
 
@@ -195,6 +196,9 @@ static int egalax_ts_probe(struct i2c_client *client,
 		return error;
 	}
 
+	of_property_read_u32(client->dev.of_node, "eeti,protocol-version",
+			     &ts->protocol_version);
+
 	input_dev->name = "EETI eGalax Touch Screen";
 	input_dev->id.bustype = BUS_I2C;
 
-- 
2.19.0
