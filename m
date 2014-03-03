From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/3] ARM: sun7i/sun6i: irqchip: Update
 the documentation
Date: Mon, 3 Mar 2014 12:02:40 +0100
Message-ID: <20140303110240.GW607@lukather>
References: <1393529662-8663-1-git-send-email-carlo@caione.org>
 <1393529662-8663-4-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PsVWHEfaXyN1A/K4"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBX6D2GMAKGQEWQ4RMSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393529662-8663-4-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PsVWHEfaXyN1A/K4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 27, 2014 at 08:34:22PM +0100, Carlo Caione wrote:
> Added documentation for NMI irqchip.
>=20
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> ---
>  .../allwinner,sun67i-sc-nmi.txt                    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/allwinner,sun67i-sc-nmi.txt
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwi=
nner,sun67i-sc-nmi.txt b/Documentation/devicetree/bindings/interrupt-contro=
ller/allwinner,sun67i-sc-nmi.txt
> new file mode 100644
> index 0000000..ac31487
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,su=
n67i-sc-nmi.txt
> @@ -0,0 +1,27 @@
> +Allwinner Sunxi NMI Controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +
> +- compatible : should be "allwinner,sun7i-a20-sc-nmi" or
> +  "allwinner,sun6i-a31-sc-nmi"
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 2. The first cell is the IRQ numb=
er, the
> +  second cell the trigger type.

What values correspond to what trigger type? What are the accepted values?

> +- interrupt-parent: Specifies the parent interrupt controller.
> +- interrupts: Specifies the list of interrupt lines which are handled by
> +  the interrupt controller in the parent controller's notation. This val=
ue
> +  shall be the NMI.

Hmmm, there's only one interrupt, not a list of them.

> +
> +Example:
> +
> +sc-nmi-intc@01c00030 {
> +	compatible =3D "allwinner,sun7i-a20-sc-nmi";
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +	reg =3D <0x01c00030 0x0c>;
> +	interrupt-parent =3D <&gic>;
> +	interrupts =3D <0 0 4>;
> +};
> --=20
> 1.8.3.2
>=20

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PsVWHEfaXyN1A/K4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTFGFQAAoJEBx+YmzsjxAgEvIQAJ4AbC1jbYbS51LoupXRw7Ew
Jdlg6yTuNA1MYg5uDwhUPx+WYcFbDm+SOZaCmDmONamoYDD8g2IxA/uyMc3O7S5F
C8sQXpIpu/OExkGxfO/7au9nl2XqzIBcXZ7nc99JP6BGdVsWcDeLlc+Gp7xcp6/7
qoiBq3sdUeEIgsUcv8pqZGt24Q21W021PA8VMggcMbYWb19OIiKAHx3D463csuZ6
LiJVzQHqP5clUtVcGgDR5ohMhF8xurbSeBsXHrvUf4qWLvCvEMtg5xh0RuI6TU3Z
slZDGvS3N8sleO15VvJyiblnk500BBZdYBQOKgiruo3tRF/ehO5O0QnZRtCQBquw
RtZP3P/f0noi+AV8ctknqDmchcpX9HQJs2jp4vLPBvySOyOZ0zFut8/bwB337WU5
2uW8UZ2WwkGDUABKZBrwlZFPiXEnXBuK2XPb7TkKZkcTfXRIgVDO33bQEQBQOKSA
vyJe7xuPvOyoTId858FfnZPUfGftgqEnyP3kmutKO10thoo9fBbQuvFoDM8WX+yg
3LPyRNHbxtvJ2u9/4oc9YRWPMyl/rplIFlbyFbyDc7FtbAuhIg+waT1OrWd7n8KX
tp9/sECzaO712ahG1+sPyqmLhGLkLeZA/juHQbOKoDEIXUxDS5Hp9iEb4R21Jf/v
aEoFITrRvwIuGkSIVEA0
=jAJf
-----END PGP SIGNATURE-----

--PsVWHEfaXyN1A/K4--
