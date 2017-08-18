From: Klaus Goger <klaus.goger@theobroma-systems.com>
Subject: [PATCH v2 2/5] dt-bindings: add amc6821, isl1208 trivial bindings
Date: Fri, 18 Aug 2017 21:34:42 +0200
Message-ID: <20170818193445.47542-3-klaus.goger@theobroma-systems.com>
References: <20170818193445.47542-1-klaus.goger@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818193445.47542-1-klaus.goger@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Paul Kocialkowski <contact@paulk.fr>, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Florian Larysch <fl@n621.de>, Jelle van der Waa <jelle@vdwaa.nl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>, Jiri Kosina <trivial@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

TI AMC6821 fan controller and Intersil ISL1208 are trivial
devices, so add them to the binding list.

Signed-off-by: Klaus Goger <klaus.goger@theobroma-systems.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/trivial-devices.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 0e6e95394200..ed7c2cf52f6a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -64,6 +64,7 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
+isil,isl1208		Intersil ISL1208 Low Power RTC with Battery Backed SRAM
 isil,isl29028		Intersil ISL29028 Ambient Light and Proximity Sensor
 isil,isl29030		Intersil ISL29030 Ambient Light and Proximity Sensor
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
@@ -178,6 +179,7 @@ st,m41t80		M41T80 - SERIAL ACCESS RTC WITH ALARMS
 taos,tsl2550		Ambient Light Sensor with SMBUS/Two Wire Serial Interface
 ti,ads7828		8-Channels, 12-bit ADC
 ti,ads7830		8-Channels, 8-bit ADC
+ti,amc6821		Temperature Monitoring and Fan Control
 ti,tsc2003		I2C Touch-Screen Controller
 ti,tmp102		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
 ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-- 
2.11.0
