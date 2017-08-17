From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v4 1/5] iio: srf08: add device tree binding for srf02 and
 srf10
Date: Fri, 18 Aug 2017 00:08:51 +0200
Message-ID: <20170817220851.GA4698@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hdegoede@redhat.com, wsa@the-dreams.de, chris.packham@alliedtelesis.co.nz, jelle@vdwaa.nl, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add trivial device tree binding "devantech,srf02" and "devantech,srf10"

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 Documentation/devicetree/bindings/trivial-devices.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 35f406dd86b6..f1d3317a4834 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -36,7 +36,9 @@ dallas,ds1775		Tiny Digital Thermometer and Thermostat
 dallas,ds3232		Extremely Accurate I²C RTC with Integrated Crystal and SRAM
 dallas,ds4510		CPU Supervisor with Nonvolatile Memory and Programmable I/O
 dallas,ds75		Digital Thermometer and Thermostat
+devantech,srf02		Devantech SRF02 ultrasonic ranger in I2C mode
 devantech,srf08		Devantech SRF08 ultrasonic ranger
+devantech,srf10		Devantech SRF10 ultrasonic ranger
 dlg,da9053		DA9053: flexible system level PMIC with multicore support
 dlg,da9063		DA9063: system PMIC for quad-core application processors
 domintech,dmard09	DMARD09: 3-axis Accelerometer
-- 
2.1.4


-- 
Andreas Klinger
Grabenreith 27
84508 Burgkirchen
+49 8623 919966
ak@it-klinger.de
www.it-klinger.de
www.grabenreith.de
