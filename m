From: hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Subject: [PATCHv3 1/3] dt-bindings: display: Intel FPGA VIP drm driver Devicetree bindings
Date: Tue, 11 Jul 2017 13:52:00 +0800
Message-ID: <1499752322-9196-2-git-send-email-hean.loong.ong@intel.com>
References: <1499752322-9196-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499752322-9196-1-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ong-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Device tree binding for Intel FPGA Video and Image
Processing Suite. The binding involved would be generated
from the Altera (Intel) Qsys system. The bindings would
set the max width, max height, buts per pixel and memory
port width. The device tree binding only supports the Intel
Arria10 devkit and its variants. Vendor name retained as
altr.

Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/display/altr,vip-fb2.txt   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt

diff --git a/Documentation/devicetree/bindings/display/altr,vip-fb2.txt b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
new file mode 100644
index 0000000..ce249fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
@@ -0,0 +1,41 @@
+Intel Video and Image Processing(VIP) Frame Buffer II bindings
+
+Supported hardware: Arria 10 and above with display port IP
+
+The hardware associated with this device tree is a SoC FPGA. Where there is an ARM controller
+and a FPGA device. The ARM controller would host the Linux OS while the FPGA device runs on its
+individual IP firmware. In the Intel VIP Frame Buffer II the ARM controller would be 
+driving data from the Linux OS to the FPGA device programmed with the Frame Buffer II IP
+to render pixels to be streamed to the Display Port connector.
+
+The DRM driver for the Arria 10 devkit would require the display resolution
+and pixel information to be included as these values are generated based
+on the FPGA design that drives the video connector attached to the DRM driver.
+
+The Frame Buffer II device is a simple frame buffer device. The device contains the display
+properties and the bridge or connector register. The output for this device currently 
+is a dedicated to a single Display Port.
+
+More information the FPGA video IP component can be acquired from
+https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_vip.pdf  							 
+
+Required properties:
+----------------------------
+- compatible: "altr,vip-frame-buffer-2.0"
+- reg: Physical base address and length of the framebuffer controller's
+  registers.
+- altr,max-width: The width of the framebuffer in pixels.
+- altr,max-height: The height of the framebuffer in pixels.
+- altr,bits-per-symbol: only "8" is currently supported
+- altr,mem-port-width = the bus width of the avalon master port on the frame reader
+
+Example:
+----------------------------
+	dp_0_frame_buf: vip@100000280 {
+			compatible = "altr,vip-frame-buffer-2.0";
+			reg = <0x00000001 0x00000280 0x00000040>;
+			altr,max-width = <1280>;
+			altr,max-height = <720>;
+			altr,bits-per-symbol = <8>;
+			altr,mem-port-width = <128>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
