From: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
Subject: [PATCH v5] Documentation: add Device tree bindings for hwmon/nct7802
Date: Sun, 13 Sep 2015 23:16:38 +0300
Message-ID: <1442175440-20152-1-git-send-email-const@MakeLinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add sensors' types configuration.

---
Changed on v5:
- Fixed typos

Changed on v4:
- Removed registers initialization by names
- Added properties nuvoton,sensor*-type

Changed in v3:
- Fixed vendor prefix
- Added short registers description,
  full registers description is available at
https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/

Changed in v2:
- Removed nct7802,reg-init
- Added registers initialization by names

Introduced in v1:
 - nct7802,reg-init

Signed-off-by: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
---
 .../devicetree/bindings/hwmon/nct7802.txt          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..d9f2fda
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,31 @@
+Nuvoton NCT7802Y Hardware Monitoring IC
+
+Required node properties:
+
+ - "compatible": must be "nuvoton,nct7802"
+ - "reg": I2C bus address of the device
+
+Optional string properties:
+
+ - nuvoton,sensor1-type
+ - nuvoton,sensor2-type
+ - nuvoton,sensor3-type
+
+Allowed values for nuvoton,sensor*-type:
+ - "disabled"
+ - "thermal diode"
+ - "thermistor"
+ - "voltage"
+
+Except "nuvoton,sensor3-type" can't be "thermal diode".
+
+Example nct7802 node:
+
+nct7802 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x2a>;
+	nuvoton,start = <0x01>;
+	nuvoton,sensor1-type = "thermistor";
+	nuvoton,sensor2-type = "disabled";
+	nuvoton,sensor3-type = "voltage";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
