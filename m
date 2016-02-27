From: =?UTF-8?q?Antti=20Sepp=C3=A4l=C3=A4?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: dwc2: Add support for Lantiq ARX and XRX SoCs
Date: Sat, 27 Feb 2016 12:31:24 +0200
Message-ID: <1456569084-31292-1-git-send-email-a.seppala@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, =?UTF-8?q?Antti=20Sepp=C3=A4l=C3=A4?= <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for Lantiq ARX and XRX SoC families to the dwc2 driver.

Signed-off-by: Antti Sepp=C3=A4l=C3=A4 <a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
 drivers/usb/dwc2/platform.c                    | 34 ++++++++++++++++++=
++++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documenta=
tion/devicetree/bindings/usb/dwc2.txt
index 2213682..20a68bf 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -8,6 +8,8 @@ Required properties:
   - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk306=
6 Soc;
   - "rockchip,rk3188-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3=
188 Soc;
   - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3=
288 Soc;
+  - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq AR=
X SoCs;
+  - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XR=
X SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 690b9fd..0e9e4d3 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -149,6 +149,38 @@ static const struct dwc2_core_params params_rk3066=
 =3D {
 	.hibernation			=3D -1,
 };
=20
+static const struct dwc2_core_params params_ltq =3D {
+	.otg_cap			=3D 2,	/* non-HNP/non-SRP */
+	.otg_ver			=3D -1,
+	.dma_enable			=3D -1,
+	.dma_desc_enable		=3D -1,
+	.dma_desc_fs_enable		=3D -1,
+	.speed				=3D -1,
+	.enable_dynamic_fifo		=3D -1,
+	.en_multiple_tx_fifo		=3D -1,
+	.host_rx_fifo_size		=3D 288,	/* 288 DWORDs */
+	.host_nperio_tx_fifo_size	=3D 128,	/* 128 DWORDs */
+	.host_perio_tx_fifo_size	=3D 96,	/* 96 DWORDs */
+	.max_transfer_size		=3D 65535,
+	.max_packet_count		=3D 511,
+	.host_channels			=3D -1,
+	.phy_type			=3D -1,
+	.phy_utmi_width			=3D -1,
+	.phy_ulpi_ddr			=3D -1,
+	.phy_ulpi_ext_vbus		=3D -1,
+	.i2c_enable			=3D -1,
+	.ulpi_fs_ls			=3D -1,
+	.host_support_fs_ls_low_power	=3D -1,
+	.host_ls_low_power_phy_clk	=3D -1,
+	.ts_dline			=3D -1,
+	.reload_ctl			=3D -1,
+	.ahbcfg				=3D GAHBCFG_HBSTLEN_INCR16 <<
+					  GAHBCFG_HBSTLEN_SHIFT,
+	.uframe_sched			=3D -1,
+	.external_id_pin_ctl		=3D -1,
+	.hibernation			=3D -1,
+};
+
 /*
  * Check the dr_mode against the module configuration and hardware
  * capabilities.
@@ -428,6 +460,8 @@ static const struct of_device_id dwc2_of_match_tabl=
e[] =3D {
 	{ .compatible =3D "brcm,bcm2835-usb", .data =3D &params_bcm2835 },
 	{ .compatible =3D "hisilicon,hi6220-usb", .data =3D &params_hi6220 },
 	{ .compatible =3D "rockchip,rk3066-usb", .data =3D &params_rk3066 },
+	{ .compatible =3D "lantiq,arx100-usb", .data =3D &params_ltq },
+	{ .compatible =3D "lantiq,xrx200-usb", .data =3D &params_ltq },
 	{ .compatible =3D "snps,dwc2", .data =3D NULL },
 	{ .compatible =3D "samsung,s3c6400-hsotg", .data =3D NULL},
 	{},
--=20
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
