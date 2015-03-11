From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v2 1/1] DT: video: atmel_lcdc: Add example of fixed framebuffer
 memory
Date: Wed, 11 Mar 2015 17:39:25 +0100
Message-ID: <55006FBD.80701@atmel.com>
References: <1425540938-20538-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425540938-20538-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 05/03/2015 08:35, Alexander Stein a =E9crit :
> This drivers allows a fixed framebuffer memory to be set by an additi=
onal
> IORESOURCE_MEM resource. Thus add an example to the DT documentation.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com=
>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Queued in at91-4.1-dt. Thanks!

> ---
> Changes in v2:
> * Fix typo noticed by checkpatch.pl
>=20
>  Documentation/devicetree/bindings/video/atmel,lcdc.txt | 12 ++++++++=
+++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/video/atmel,lcdc.txt b=
/Documentation/devicetree/bindings/video/atmel,lcdc.txt
> index f059dd0..ecb8da0 100644
> --- a/Documentation/devicetree/bindings/video/atmel,lcdc.txt
> +++ b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
> @@ -10,7 +10,9 @@ Required properties:
>  	"atmel,at91sam9g45es-lcdc" ,
>  	"atmel,at91sam9rl-lcdc" ,
>  	"atmel,at32ap-lcdc"
> -- reg : Should contain 1 register ranges(address and length)
> +- reg : Should contain 1 register ranges(address and length).
> +	Can contain an additional register range(address and length)
> +	for fixed framebuffer memory. Useful for dedicated memories.
>  - interrupts : framebuffer controller interrupt
>  - display: a phandle pointing to the display node
> =20
> @@ -38,6 +40,14 @@ Example:
> =20
>  	};
> =20
> +Example for fixed framebuffer memory:
> +
> +	fb0: fb@0x00500000 {
> +		compatible =3D "atmel,at91sam9263-lcdc";
> +		reg =3D <0x00700000 0x1000 0x70000000 0x200000>;
> +		[...]
> +	};
> +
>  Atmel LCDC Display
>  -----------------------------------------------------
>  Required properties (as per of_videomode_helper):
>=20


--=20
Nicolas Ferre
