From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/4] DT: Add binding for Altera FPGAs in passive-serial mode
Date: Tue, 12 Nov 2013 15:31:40 +0100
Message-ID: <1384266701-12608-4-git-send-email-s.hauer@pengutronix.de>
References: <1384266701-12608-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384266701-12608-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/firmware/altr,passive-serial.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/altr,passive-serial.txt

diff --git a/Documentation/devicetree/bindings/firmware/altr,passive-serial.txt b/Documentation/devicetree/bindings/firmware/altr,passive-serial.txt
new file mode 100644
index 0000000..6d40c91
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
+- compatible: shall be "altr,passive-serial"
+- reg: SPI chip select
+- nstat-gpio: Specify GPIO for controlling the nstat pin
+- confd-gpio: Specify GPIO for controlling the confd pin
+- nconfig-gpio: Specify GPIO for controlling the nconfig pin
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
