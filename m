From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: media: adv7604: Add support for i2c_new_secondary_device
Date: Tue, 13 Feb 2018 14:06:51 +0200
Message-ID: <84376496.fPaZ5qpN3E@avalon>
References: <1518473273-6333-1-git-send-email-kbingham@kernel.org> <1518473273-6333-2-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518473273-6333-2-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tuesday, 13 February 2018 00:07:49 EET Kieran Bingham wrote:
> From: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
>=20
> The ADV7604 has thirteen 256-byte maps that can be accessed via the main
> I=B2C ports. Each map has it own I=B2C address and acts as a standard sla=
ve
> device on the I=B2C bus.
>=20
> Extend the device tree node bindings to be able to override the default
> addresses so that address conflicts with other devices on the same bus
> may be resolved at the board description level.
>=20
> Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
> [Kieran: Re-adapted for mainline]
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Nitpicking, I might not mention i2c_new_secondary_device in the subject, as=
=20
this is a DT bindings change. I don't mind too much though, as long as the=
=20
bindings themselves don't contain Linux-specific information, and they don'=
t,=20
so

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
> Based upon the original posting :
>   https://lkml.org/lkml/2014/10/22/469
>=20
> v2:
>  - DT Binding update separated from code change
>  - Minor reword to commit message to account for DT only change.
>  - Collected Rob's RB tag.
>=20
> v3:
>  - Split map register addresses into individual declarations.
>=20
>  .../devicetree/bindings/media/i2c/adv7604.txt          | 18
> ++++++++++++++++-- 1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> b/Documentation/devicetree/bindings/media/i2c/adv7604.txt index
> 9cbd92eb5d05..ebb5f070c05b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> @@ -13,7 +13,11 @@ Required Properties:
>      - "adi,adv7611" for the ADV7611
>      - "adi,adv7612" for the ADV7612
>=20
> -  - reg: I2C slave address
> +  - reg: I2C slave addresses
> +    The ADV76xx has up to thirteen 256-byte maps that can be accessed via
> the +    main I=B2C ports. Each map has it own I=B2C address and acts as a
> standard +    slave device on the I=B2C bus. The main address is mandator=
y,
> others are +    optional and revert to defaults if not specified.
>=20
>    - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
>      detection pins, one per HDMI input. The active flag indicates the GP=
IO
> @@ -35,6 +39,11 @@ Optional Properties:
>=20
>    - reset-gpios: Reference to the GPIO connected to the device's reset p=
in.
> - default-input: Select which input is selected after reset.
> +  - reg-names : Names of maps with programmable addresses.
> +		It can contain any map needing a non-default address.
> +		Possible maps names are :
> +		  "main", "avlink", "cec", "infoframe", "esdp", "dpp", "afe",
> +		  "rep", "edid", "hdmi", "test", "cp", "vdp"
>=20
>  Optional Endpoint Properties:
>=20
> @@ -52,7 +61,12 @@ Example:
>=20
>  	hdmi_receiver@4c {
>  		compatible =3D "adi,adv7611";
> -		reg =3D <0x4c>;
> +		/*
> +		 * The edid page will be accessible @ 0x66 on the i2c bus. All
> +		 * other maps will retain their default addresses.
> +		 */
> +		reg =3D <0x4c>, <0x66>;
> +		reg-names "main", "edid";
>=20
>  		reset-gpios =3D <&ioexp 0 GPIO_ACTIVE_LOW>;
>  		hpd-gpios =3D <&ioexp 2 GPIO_ACTIVE_HIGH>;


=2D-=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
