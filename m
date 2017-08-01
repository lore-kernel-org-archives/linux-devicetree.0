From: "Hean Loong, Ong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv4 1/3] ARM:dt-bindings Intel FPGA Video and Image Processing Suite
Date: Tue,  1 Aug 2017 10:31:32 +0800
Message-ID: <1501554694-3378-2-git-send-email-hean.loong.ong@intel.com>
References: <1501554694-3378-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501554694-3378-1-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Ong-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Device tree binding for Intel FPGA Video and Image
Processing Suite. The binding involved would be generated
from the Altera (Intel) Qsys system. The bindings would
set the max width, max height, buts per pixel and memory
port width. The device tree binding only supports the Intel
Arria10 devkit and its variants. Vendor name retained as
altr.

Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/display/altr,vip-fb2.txt   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt

diff --git a/Documentation/devicetree/bindings/display/altr,vip-fb2.txt b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
new file mode 100644
index 0000000..c4338d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
@@ -0,0 +1,39 @@
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
+The Frame Buffer II device is a simple frame buffer device. The device contains the display
+properties and the bridge or connector register. The output for this device currently
+is a dedicated to a single Display Port. Currently the max resolution supported is 1280 x 720 at
+60Hz.
+
+More information the FPGA video IP component can be acquired from
+https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_vip.pdf
+
+
+New bindings:
+=============
+Required properties:
+----------------------------
+- compatible: "altr,vip-frame-buffer-2.0"
+- reg: Physical base address and length of the framebuffer controller's
+  registers.
+- altr,max-width: The width of the framebuffer in pixels.
+- altr,max-height: The height of the framebuffer in pixels.
+- altr,mem-port-width = the bus width of the avalon master port on the frame reader
+
+Example:
+----------------------------
+       dp_0_frame_buf: display-controller@100000280 {
+                       compatible = "altr,vip-frame-buffer-2.0";
+                       reg = <0x00000001 0x00000280 0x00000040>;
+                       altr,max-width = <1280>;
+                       altr,max-height = <720>;
+                       altr,mem-port-width = <128>;
+       };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
