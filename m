From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/10] arm64: allwinner: a64: Add
 devicetree binding for DMA controller
Date: Wed, 20 Sep 2017 15:53:00 -0500
Message-ID: <20170920205300.io3ghr54kzk763kt@rob-hp-laptop>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-7-stefan.bruens@rwth-aachen.de>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJIP47K7MERBLVKRPHAKGQEDB5UMWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-7-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 17, 2017 at 05:19:52AM +0200, Stefan Br=C3=BCns wrote:
> The A64 is register compatible with the H3, but has a different number
> of dma channels and request ports.
>=20
> Attach additional properties to the node to allow future reuse of the
> compatible for controllers with different number of channels/requests.
>=20
> If dma-requests is not specified, the register layout defined maximum
> of 32 is used.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/sun6i-dma.txt          | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Docume=
ntation/devicetree/bindings/dma/sun6i-dma.txt
> index 98fbe1a5c6dd..6ebc79f95202 100644
> --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> @@ -27,6 +27,32 @@ Example:
>  		#dma-cells =3D <1>;
>  	};
> =20
> +------------------------------------------------------------------------=
------
> +For A64 DMA controller:
> +
> +Required properties:
> +- compatible:	"allwinner,sun50i-a64-dma"
> +- dma-channels: Number of DMA channels supported by the controller.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt
> +- all properties above, i.e. reg, interrupts, clocks, resets and #dma-ce=
lls
> +
> +Optional properties:
> +- dma-requests: Number of DMA request signals supported by the controlle=
r.
> +		Refer to Documentation/devicetree/bindings/dma/dma.txt
> +
> +Example:
> +	dma: dma-controller@01c02000 {

Drop the leading 0. Building dtbs with W=3D2 will tell you this.

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +		compatible =3D "allwinner,sun50i-a64-dma";
> +		reg =3D <0x01c02000 0x1000>;
> +		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&ccu CLK_BUS_DMA>;
> +		dma-channels =3D <8>;
> +		dma-requests =3D <27>;
> +		resets =3D <&ccu RST_BUS_DMA>;
> +		#dma-cells =3D <1>;
> +	};
> +------------------------------------------------------------------------=
------
> +
>  Clients:
> =20
>  DMA clients connected to the A31 DMA controller must use the format
> --=20
> 2.14.1
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
