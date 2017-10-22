From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 01/10 v3] usb: usb251xb: Update usb251xb bindings
Date: Sun, 22 Oct 2017 23:38:03 +0300
Message-ID: <20171022203812.9379-2-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20171022203812.9379-1-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171022203812.9379-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.leitner@skidata.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Since hub usb2517 is going to be supported by the usb251xb driver,
the bindings need to be properly updated. Particularly:
- add "microchip,usb2517" and "microchip,usb2517i" compatible strings.
- add "boolean" description to all the properties, which really accept
a boolean value including a new one "led-{usb,speed}-mode".
- move reset-gpios property to the optional section. It isn't
defined as required in the code and shouldn't be required at all, since
hardware may handle reset pins by itself.
- add new led-{usb,speed}-mode mode property. USB2517 device supports
two LED modes: USB mode and speed (default) indication mode. The last one
can be switched on by this property.
- add {bp,sp}-max-{total,removable}-current-microamp property measured in
microamp. It hasn't been defined as property before. Since the limitation
specified by these parameters is hardware specific it needs to be defined
in dts.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../devicetree/bindings/usb/usb251xb.txt           | 46 +++++++++++++++-------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 3957d4eda..168ff819e 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -1,16 +1,17 @@
 Microchip USB 2.0 Hi-Speed Hub Controller
 
-The device node for the configuration of a Microchip USB251xB/xBi USB 2.0
+The device node for the configuration of a Microchip USB251x/xBi USB 2.0
 Hi-Speed Controller.
 
 Required properties :
  - compatible : Should be "microchip,usb251xb" or one of the specific types:
 	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
-	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
- - reset-gpios : Should specify the gpio for hub reset
+	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
+	"microchip,usb2517", "microchip,usb2517i"
  - reg : I2C address on the selected bus (default is <0x2C>)
 
 Optional properties :
+ - reset-gpios : Should specify the gpio for hub reset
  - skip-config : Skip Hub configuration, but only send the USB-Attach command
  - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
  - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
@@ -19,29 +20,47 @@ Optional properties :
  - manufacturer : Set USB Manufacturer string (max 31 characters long)
  - product : Set USB Product string (max 31 characters long)
  - serial : Set USB Serial string (max 31 characters long)
- - {bus,self}-powered : selects between self- and bus-powered operation (default
-	is self-powered)
- - disable-hi-speed : disable USB Hi-Speed support
+ - {bus,self}-powered : selects between self- and bus-powered operation
+	(boolean, default is self-powered)
+ - disable-hi-speed : disable USB Hi-Speed support (boolean)
  - {multi,single}-tt : selects between multi- and single-transaction-translator
-	(default is multi-tt)
- - disable-eop : disable End of Packet generation in full-speed mode
+	(boolean, default is multi-tt)
+ - disable-eop : disable End of Packet generation in full-speed mode (boolean)
  - {ganged,individual}-sensing : select over-current sense type in self-powered
-	mode (default is individual)
+	mode (boolean, default is individual)
  - {ganged,individual}-port-switching : select port power switching mode
-	(default is individual)
+	(boolean, default is individual)
  - dynamic-power-switching : enable auto-switching from self- to bus-powered
-	operation if the local power source is removed or unavailable
+	operation if the local power source is removed or unavailable (boolean)
  - oc-delay-us : Delay time (in microseconds) for filtering the over-current
 	sense inputs. Valid values are 100, 4000, 8000 (default) and 16000. If
 	an invalid value is given, the default is used instead.
- - compound-device : indicate the hub is part of a compound device
- - port-mapping-mode : enable port mapping mode
+ - compound-device : indicate the hub is part of a compound device (boolean)
+ - port-mapping-mode : enable port mapping mode (boolean)
+ - led-{usb,speed}-mode : led usb/speed indication mode selection
+	(boolean, default is speed mode)
  - string-support : enable string descriptor support (required for manufacturer,
 	product and serial string configuration)
  - non-removable-ports : Should specify the ports which have a non-removable
 	device connected.
  - sp-disabled-ports : Specifies the ports which will be self-power disabled
  - bp-disabled-ports : Specifies the ports which will be bus-power disabled
+ - sp-max-total-current-microamp: Specifies max current consumed by the hub
+	from VBUS when operating in self-powered hub. It includes the hub
+	silicon along with all associated circuitry including a permanently
+	attached peripheral (range: 0 - 100000 uA, default 1000 uA)
+ - bp-max-total-current-microamp: Specifies max current consumed by the hub
+	from VBUS when operating in self-powered hub. It includes the hub
+	silicon along with all associated circuitry including a permanently
+	attached peripheral (range: 0 - 510000 uA, default 100000 uA)
+ - sp-max-removable-current-microamp: Specifies max current consumed by the hub
+	from VBUS when operating in self-powered hub. It includes the hub
+	silicon along with all associated circuitry excluding a permanently
+	attached peripheral (range: 0 - 100000 uA, default 1000 uA)
+ - bp-max-removable-current-microamp: Specifies max current consumed by the hub
+	from VBUS when operating in self-powered hub. It includes the hub
+	silicon along with all associated circuitry excluding a permanently
+	attached peripheral (range: 0 - 510000 uA, default 100000 uA)
  - power-on-time-ms : Specifies the time it takes from the time the host
 	initiates the power-on sequence to a port until the port has adequate
 	power. The value is given in ms in a 0 - 510 range (default is 100ms).
@@ -56,7 +75,6 @@ Examples:
 	usb2514b@2c {
 		compatible = "microchip,usb2514b";
 		reg = <0x2c>;
-		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 		vendor-id = /bits/ 16 <0x0000>;
 		product-id = /bits/ 16 <0x0000>;
 		string-support;
-- 
2.12.0
