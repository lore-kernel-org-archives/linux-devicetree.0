From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 1/3] usb: usb251xb: Add US lanes inversion dts-bindings
Date: Thu, 25 Apr 2019 00:12:05 +0300
Message-ID: <20190424211208.17499-2-fancer.lancer@gmail.com>
References: <20190424211208.17499-1-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424211208.17499-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Serge Semin <Sergey.Semin@t-platforms.ru>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since a separate US ports lanes polarity inversion property is going to
be available the bindings doc-file should be updated with information
about swap-us-lanes bool property, which will be responsible for it.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 17915f64b8ee..bc7945e9dbfe 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -64,8 +64,10 @@ Optional properties :
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
- - swap-dx-lanes : Specifies the ports which will swap the differential-pair
-	(D+/D-), default is not-swapped.
+ - swap-dx-lanes : Specifies the downstream ports which will swap the
+	differential-pair (D+/D-), default is not-swapped.
+ - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
+	swapping (boolean, default is not-swapped)
 
 Examples:
 	usb2512b@2c {
-- 
2.21.0
