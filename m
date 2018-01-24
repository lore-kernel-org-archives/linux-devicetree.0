From: Jolly Shah <jolly.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP firmware
Date: Wed, 24 Jan 2018 15:21:11 -0800
Message-ID: <1516836074-4149-2-git-send-email-jollys@xilinx.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516836074-4149-1-git-send-email-jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rajan Vaja <rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation to describe Xilinx ZynqMP firmware driver
bindings. Firmware driver provides an interface to firmware
APIs. Interface APIs can be used by any driver to communicate
to PMUFW (Platform Management Unit).

Signed-off-by: Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rajan Vaja <rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
new file mode 100644
index 0000000..a7aaf56
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
@@ -0,0 +1,16 @@
+Xilinx Zynq MPSoC Firmware Device Tree Bindings
+
+The zynqmp-firmware node describes the interface to platform firmware.
+
+Required properties:
+ - compatible:	Must contain:  "xlnx,zynqmp-firmware"
+ - method:	The method of calling the PM-API firmware layer.
+		Permitted values are:
+		 - "smc" : To be used in configurations without a hypervisor
+		 - "hvc" : To be used when hypervisor is present
+
+Examples:
+	zynqmp_firmware: zynqmp-firmware {
+		compatible = "xlnx,zynqmp-firmware";
+		method = "smc";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
