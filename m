From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Patch v2][ 02/37] dma: ipu: Add devicetree support.
Date: Fri, 18 Oct 2013 08:42:25 +0200
Message-ID: <20131018064224.GR30088@pengutronix.de>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-3-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382022155-21954-3-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric =?iso-8859-15?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 17, 2013 at 05:02:00PM +0200, Denis Carikli wrote:
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/fsl-imx-ipu.txt        |   53 ++++++++++=
++++++++++
>  drivers/dma/ipu/ipu_idmac.c                        |    8 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-ipu=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt b/=
Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt
> new file mode 100644
> index 0000000..a901c33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt
> @@ -0,0 +1,53 @@
> +* Freescale Image Processing Unit DMA support for i.MX3x.
> +
> +This document will only describe differences to the generic DMA Cont=
roller and
> +DMA request bindings as described in dma/dma.txt .
> +
> +This dma driver supports the imx31 and imx35 devices.
> +
> +* DMA controller
> +
> +Required properties:
> +- compatible : Should be "fsl,imx31-ipu".
> +- reg : Should contain DMA registers location and length
> +- interrupts : First item should be DMA interrupt, second one is opt=
ional and
> +    should contain DMA Error interrupt.
> +- #dma-cells : Has to be 1. The ipu driver does not support anything=
 else.
> +
> +Optional properties:
> +- dma-channels : Number of DMA channels supported. Should be 32.
> +- #dma-requests : Number of DMA requests supported.
> +
> +Example:
> +
> +	ipu: ipu@53fc0000 {
> +		compatible =3D "fsl,imx31-ipu";
> +		reg =3D <	0x53fc0000 0x5f
> +			0x53fc0088 0x2b >;
> +		interrupts =3D <42 41>;
> +		dma-channels =3D <32>;
> +		#dma-cells =3D <1>;
> +		clocks =3D <&clks 55>;
> +		clock-names =3D "";
> +		status =3D "disabled";
> +	};

We already have a binding for the IPUv3. We shouldn't introduce a
completely different binding for the IPUv1. We shouldn't expose the dma
channels to dt and the lcdc should either be not exported to dt or be a
subnode of the ipu node. The above binding is very close to what Linux
has implemented, but not so close to the hardware.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
