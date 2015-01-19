From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] remoteproc: microblaze: Document device tree bindings
Date: Mon, 19 Jan 2015 11:30:19 +0100
Message-ID: <a458462d2dc6901440bded015608f7a9df9e7942.1421662385.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-14735-1421663420-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-14735-1421663420-0001

Add device tree binding documentation for the Microblaze remoteproc
on Xilinx Zynq.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 .../bindings/remoteproc/mb_remoteproc.txt          | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
new file mode 100644
index 000000000000..a2490eac0208
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
@@ -0,0 +1,46 @@
+Xilinx ARM-Microblaze remoteproc driver
+
+This driver requires specific Zynq hardware design where Microblaze is added
+to the programmable logic.
+Microblaze is connected with PS block via axi bus connected to PS HP port
+to ensure access to PS DDR.
+Communication channels are done via soft GPIO IP connected to PS block
+and to Microblaze. There are also 2 gpio control signals reset and debug
+which are used for resetting Microblaze.
+
+Required properties:
+- compatible : Should be "xlnx,mb_remoteproc"
+- reg : Address and length of the ddr address space
+- bram: Phandle to bram controller which can access Microblaze BRAM
+- bram-firmware : Microblaze BRAM bootloader name
+- firmware : Default firmware name which can be override by
+	     "firmware" module parameter
+- reset : Gpio phandle which reset Microblaze remoteproc
+- debug : Gpio phandle which setup Microblaze to debug state
+- ipino : Gpio phandle for Microblaze to ARM communication
+- vring0 : Gpio phandle for ARM to Microblaze communication vring 0
+- vring1 : Gpio phandle for ARM to Microblaze communication vring 1
+
+Microblaze SoC can be also connected to the PS block via a axi bus.
+That's why there is the option to allocate interrupts for Microblaze use only.
+The driver will allocate interrupts to itself and Microblaze sw has to ensure
+that interrupts are properly enabled and handled by Microblaze interrupt
+controller.
+
+Optional properties:
+ - interrupts : Interrupt mapping for remoteproc
+ - interrupt-parent : Phandle for the interrupt controller
+
+Example:
+mb_remoteproc@800000 {
+	compatible = "xlnx,mb_remoteproc";
+	reg = < 0x8000000 0x8000000 >;
+	bram = <&axi_bram_ctrl_0>;
+	bram-firmware = "mb.bin";
+	firmware = "image.elf";
+	reset = <&zynq_gpio_reset 1 0>;
+	debug = <&zynq_gpio_reset 0 0>;
+	ipino = <&zynq_gpio_vring 0 0>;
+	vring0 = <&zynq_gpio_vring 1 0>;
+	vring1 = <&zynq_gpio_vring 2 0>;
+};
--
1.8.2.3


--=_mimegpg-monstr-desktop-14735-1421663420-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlS83LwACgkQykllyylKDCGp+wCfTMBKmR5SHw+rSCKAlXCUYZyo
y1cAoITTr1IVefSUj//blZusJTI/YVnb
=b2g1
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-14735-1421663420-0001--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
