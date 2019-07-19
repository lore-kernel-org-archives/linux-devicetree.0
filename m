Return-Path: <SRS0=OQoQ=VQ=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/3] Revert "usb: usb251xb: Add US lanes inversion dts-bindings"
Date: Fri, 19 Jul 2019 10:44:05 +0200
Message-Id: <20190719084407.28041-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Serge Semin <fancer.lancer@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

This reverts commit 3342ce35a1, as there is no need for this separate
property and it breaks compatibility with existing devicetree files
(arch/arm64/boot/dts/freescale/imx8mq.dtsi).

CC: stable@vger.kernel.org #5.2
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index bc7945e9dbfe..17915f64b8ee 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -64,10 +64,8 @@ Optional properties :
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
- - swap-dx-lanes : Specifies the downstream ports which will swap the
-	differential-pair (D+/D-), default is not-swapped.
- - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
-	swapping (boolean, default is not-swapped)
+ - swap-dx-lanes : Specifies the ports which will swap the differential-pair
+	(D+/D-), default is not-swapped.
 
 Examples:
 	usb2512b@2c {
-- 
2.20.1
