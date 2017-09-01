From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for
 Allwinner A64
Date: Fri,  1 Sep 2017 01:31:35 +0100
Message-ID: <20170901003135.10058-1-andre.przywara@arm.com>
References: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBROWULGQKGQEZ3SBATA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170830233609.13855-4-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 31/08/17 00:36, Stefan Br=C3=BCns wrote:
> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> reduced amount of physical channels. Add the proper config data
> and compatible string to support it.

...

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 5f4eee4513e5..6a17c5d63582 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1068,6 +1068,12 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =
=3D {
>  	.nr_max_vchans   =3D 34,
>  	.dmac_variant    =3D DMAC_VARIANT_H3,
>  };
> +
> +static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
> +	.nr_max_channels =3D 8,
> +	.nr_max_requests =3D 27,
> +	.nr_max_vchans   =3D 38,
> +	.dmac_variant    =3D DMAC_VARIANT_H3,
>  };
> =20
>  static const struct of_device_id sun6i_dma_match[] =3D {
> @@ -1075,6 +1081,7 @@ static const struct of_device_id sun6i_dma_match[] =
=3D {
>  	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_dma_c=
fg },
>  	{ .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a83t_dma=
_cfg },
>  	{ .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_dma_cfg=
 },
> +	{ .compatible =3D "allwinner,sun50i-a64-dma", .data =3D &sun50i_a64_dma=
_cfg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_dma_match);

I was wondering if should use the opportunity to expose those values as
DT properties instead of hard-wiring them to a compatible string in the
driver every time we add support for a new SoC?
We could introduce a new compatible string (say: "allwinner,sunxi-dma"),
then describe properties for the number of channels and requests and
vchans and parse those from the DT at probe time.
With this we might be able to support future SoCs without Linux *driver*
changes, by just providing the right DT. This would have worked already
for instance for the A83T support, which just changed those values.

For instance with this quick patch below (just compile tested, and without
your refactoring).
The DT node would then read something like:
	dma: dma-controller@01c02000 {
		compatible =3D "allwinner,sun50i-a64-dma",
			     "allwinner,sunxi-dma";
		reg =3D <0x01c02000 0x1000>;
		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
		clocks =3D <&ccu CLK_BUS_DMA>;
		resets =3D <&ccu RST_BUS_DMA>;
		#dma-cells =3D <1>;
		allwinner,max_channels =3D <8>;
		allwinner,max_requests =3D <27>;
		allwinner,max_vchans =3D <38>;
	};

Cheers,
Andre.

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a2358780ab2c..5ae8032f2065 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1033,6 +1033,7 @@ static const struct of_device_id sun6i_dma_match[] =
=3D {
 	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_dma_cfg=
 },
 	{ .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a83t_dma_c=
fg },
 	{ .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_dma_cfg }=
,
+	{ .compatible =3D "allwinner,sunxi-dma", .data =3D NULL },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);
@@ -1051,7 +1052,43 @@ static int sun6i_dma_probe(struct platform_device *p=
dev)
 	device =3D of_match_device(sun6i_dma_match, &pdev->dev);
 	if (!device)
 		return -ENODEV;
-	sdc->cfg =3D device->data;
+	if (!device->data) {
+		struct sun6i_dma_config *config;
+
+		config =3D devm_kmalloc(&pdev->dev, sizeof(*config), GFP_KERNEL);
+		if (!config)
+			return -ENOMEM;
+
+		ret =3D of_property_read_u32(pdev->dev.of_node,
+					   "allwinner,max_channels",
+					   &config->nr_max_channels);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"missing allwinner,max_channels property\n");
+			return ret;
+		}
+
+		ret =3D of_property_read_u32(pdev->dev.of_node,
+					   "allwinner,max_requests",
+					   &config->nr_max_requests);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"missing allwinner,max_requests property\n");
+			return ret;
+		}
+
+		ret =3D of_property_read_u32(pdev->dev.of_node,
+					   "allwinner,max_vchans",
+					   &config->nr_max_vchans);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"missing allwinner,max_vchans property\n");
+			return ret;
+		}
+		sdc->cfg =3D config;
+	} else {
+		sdc->cfg =3D device->data;
+	}
=20
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sdc->base =3D devm_ioremap_resource(&pdev->dev, res);
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
