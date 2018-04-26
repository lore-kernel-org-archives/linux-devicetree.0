Return-Path: <SRS0=pgiu=HP=ideasonboard.com=laurent.pinchart@kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] rcar-vin: remove generic gen3 compatible string
Date: Fri, 27 Apr 2018 02:09:24 +0300
Message-ID: <2062313.TSG5ePb3Hm@avalon>
In-Reply-To: <20180424234321.22367-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180424234321.22367-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Wednesday, 25 April 2018 02:43:21 EEST Niklas S=F6derlund wrote:
> The compatible string "renesas,rcar-gen3-vin" was added before the
> Gen3 driver code was added but it's not possible to use. Each SoC in the
> Gen3 series require SoC specific knowledge in the driver to function.
> Remove it before it is added to any device tree descriptions.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt
> b/Documentation/devicetree/bindings/media/rcar_vin.txt index
> ba31431d4b1fbdbb..a19517e1c669eb35 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -24,7 +24,6 @@ on Gen3 platforms to a CSI-2 receiver.
>     - "renesas,vin-r8a77970" for the R8A77970 device
>     - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatible
>       device.
> -   - "renesas,rcar-gen3-vin" for a generic R-Car Gen3 compatible device.
>=20
>     When compatible with the generic version nodes must list the
>     SoC-specific version corresponding to the platform first


=2D-=20
Regards,

Laurent Pinchart
