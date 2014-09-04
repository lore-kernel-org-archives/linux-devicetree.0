From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 3/4] DT: Add binding for Altera FPGAs in passive-serial mode
Date: Thu,  4 Sep 2014 15:47:16 +0200
Message-ID: <1409838437-3625-4-git-send-email-s.trumtrar@pengutronix.de>
References: <1409838437-3625-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409838437-3625-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Altera FPGAs that are programmed via SPI use the passive serial protocol.
Add a simple binding that describes the setup for this usecase.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/firmware/altr,passive-serial.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/altr,passive-serial.txt

diff --git a/Documentation/devicetree/bindings/firmware/altr,passive-serial.txt b/Documentation/devicetree/bindings/firmware/altr,passive-serial.txt
new file mode 100644
index 000000000000..1305901a4dd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/altr,passive-serial.txt
@@ -0,0 +1,13 @@
+Altera FPGAs in passive serial mode
+-----------------------------------
+
+This binding defines the control interface to Altera FPGAs in
+passive serial mode. This is used to upload the firmware and
+to start the FPGA.
+
+Required properties:
+- compatible: shall be "altr,fpga-passive-serial"
+- reg: SPI chip select
+- nstat-gpio: Specify GPIO for controlling the nstat pin
+- confd-gpio: Specify GPIO for controlling the confd pin
+- nconfig-gpio: Specify GPIO for controlling the nconfig pin
+
+Example:
+
+	fpga@0 {
+		compatible = "altr,fpga-passive-serial";
+		nstat-gpios = <&gpio4 18 0>;
+		confd-gpios = <&gpio4 19 0>;
+		nconfig-gpios = <&gpio4 20 0>;
+		spi-max-frequency = <10000000>;
+		reg = <0>;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
