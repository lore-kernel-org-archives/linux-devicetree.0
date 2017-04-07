From: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Device Tree Binding for Intel FPGA Video and Image Processing Suite
Date: Fri, 07 Apr 2017 10:13:37 +0800
Message-ID: <1491531217.2232.3.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Rob,

I am resubmitting the patch again since the last doesn't comply with
the rules of the community.

>From 23a9e274bb517b8e232c5aa4cf9737de1644b708 Mon Sep 17 00:00:00 2001
From: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Thu, 30 Mar 2017 17:59:37 +0800
Subject: [PATCHv0] Intel FPGA Video and Image Processing Suite device
tree binding

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device tree binding for Int=
el FPGA Video and Image
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Processing Suite. The bindi=
ng involved would be generated
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from the Altera (Intel) Qsy=
s system. The bindings would
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set the max width, max heig=
ht, buts per pixel and memory
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0port width. The device tree=
 binding only supports the Intel
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Arria10 devkit and its vari=
ants. Vendor name retained as
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0altr.

Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
=C2=A0.../devicetree/bindings/gpu/altr,vip-fb2.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A024
++++++++++++++++++++
=C2=A01 files changed, 24 insertions(+), 0 deletions(-)
=C2=A0create mode 100644 Documentation/devicetree/bindings/gpu/altr,vip-
fb2.txt

diff --git a/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
b/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
new file mode 100644
index 0000000..9ba3209
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
@@ -0,0 +1,24 @@
+Intel Video and Image Processing(VIP) Frame Buffer II bindings
+
+Supported hardware:=C2=A0=C2=A0Arria 10 and above with display port IP
+
+Required properties:
+- compatible: "altr,vip-frame-buffer-2.0"
+- reg: Physical base address and length of the framebuffer
controller's
+=C2=A0=C2=A0registers.
+- max-width: The width of the framebuffer in pixels.
+- max-height: The height of the framebuffer in pixels.
+- bits-per-symbol: only "8" is currently supported
+- mem-port-width =3D the bus width of the avalon master port on the
frame reader
+
+Example:
+
+dp_0_frame_buf: vip@0x100000280 {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "altr,vip-frame-b=
uffer-2.0";
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x00000001 0x00000280 0=
x00000040>;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0altr,max-width =3D <1280>;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0altr,max-height =3D <720>;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0altr,bits-per-symbol =3D <8>;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0altr,mem-port-width =3D <128>;
+};
+
--=C2=A0
1.7.1

--=20
BR

Hean-Loong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
