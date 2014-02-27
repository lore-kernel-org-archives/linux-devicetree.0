From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v4 3/8] staging: imx-drm: Document updated imx-drm
 device tree bindings
Date: Thu, 27 Feb 2014 13:06:52 +0200
Message-ID: <530F1C4C.2010504@ti.com>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
 <1393338203-25051-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9016776371106042492=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393338203-25051-4-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============9016776371106042492==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2Jm4oWKVLoshCinpN22MNiGURK0QhE69f"

--2Jm4oWKVLoshCinpN22MNiGURK0QhE69f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 25/02/14 16:23, Philipp Zabel wrote:

> +Freescale i.MX DRM master device
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The freescale i.MX DRM master device is a virtual device needed to lis=
t all
> +IPU or other display interface nodes that comprise the graphics subsys=
tem.
> +
> +Required properties:
> +- compatible: Should be "fsl,imx-drm"
> +- ports: Should contain a list of phandles pointing to display interfa=
ce ports
> +  of IPU devices
> +
> +example:
> +
> +imx-drm {
> +	compatible =3D "fsl,imx-drm";
> +	ports =3D <&ipu_di0>;
> +};

I'm not a fan of having non-hardware related things in the DT data.
Especially if it makes direct references to our SW, in this case DRM.
There's no DRM on the board. I wanted to avoid all that with OMAP
display bindings.

Is there even need for such a master device? You can find all the
connected display devices from any single display device, by just
following the endpoint links.

>  display@di0 {
>  	compatible =3D "fsl,imx-parallel-display";
>  	edid =3D [edid-data];
> -	crtc =3D <&ipu 0>;
>  	interface-pix-fmt =3D "rgb24";
> +
> +	port {
> +		display_in: endpoint {
> +			remote-endpoint =3D <&ipu_di0_disp0>;
> +		};
> +	};
>  };

Shouldn't the pix-fmt be defined in the endpoint node? It is about pixel
format for a particular endpoint, isn't it?

> diff --git a/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt =
b/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> index ed93778..578a1fc 100644
> --- a/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> +++ b/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> @@ -50,12 +50,14 @@ have a look at Documentation/devicetree/bindings/vi=
deo/display-timing.txt.
> =20
>  Required properties:
>   - reg : should be <0> or <1>
> - - crtcs : a list of phandles with index pointing to the IPU display i=
nterfaces
> -           that can be used as video source for this channel.
>   - fsl,data-mapping : should be "spwg" or "jeida"
>                        This describes how the color bits are laid out i=
n the
>                        serialized LVDS signal.
>   - fsl,data-width : should be <18> or <24>
> + - port: A port node with endpoint definitions as defined in
> +   Documentation/devicetree/bindings/media/video-interfaces.txt.
> +   On i.MX6, there should be four ports (port@[0-3]) that correspond
> +   to the four LVDS multiplexer inputs.

Is the ldb something that's on the imx SoC?

Do you have a public branch somewhere? It'd be easier to look at the
final result, as I'm not familiar with imx.

 Tomi



--2Jm4oWKVLoshCinpN22MNiGURK0QhE69f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTDxxMAAoJEPo9qoy8lh71c/MP/04eHv1fZhQ4xmCgbw+Fe+RN
RCtnaRQaoUPM2vzDfNOkJ7z8CqX3isfTlihtZtj2SrCMOkRI1OYQ4se4QKakWXoW
vya060aFhTOZVFrVuJE74crvsBhVxX8hZcXUAJeAomNl1GKB2CzsFDLDHrfz1BLD
9YlISVbmUiuzkn8CG2dNrqL6HVHbGtDf4d/dSV8xScFMEBdbMrZFsSxO/1p0X7KU
J1dJdGflQpNQfO5/JzGpSmQ9W7l96be+04tGHo8uJ2+iL0NGI3RugxIXLhHUEeqX
xB8RNXpkY/uj/6RgnRt9R7Uyg9zp0/PDXwKR106QFGsi7LbkS4u9Bh13/Qht6/gI
RN+UsevsEJ7/lNeI9/a4LLHW3VTJYU226SkSDP5LYgkjqNW5y7dm2cWuWVNvtGu+
pWKbAZjMQhPanJ5qt3Y9C4p0OHMhlrKPu0fgI5JhIMXdpCsnHIPDNUbHADa4aDld
QIfKBU3TxiHPSfeHhG67bEtECet/Epusuq6jZBsSHakesx+b6z/0LkYB9UolxeQU
VCyli8DRc1lfeG9V9Hs9lwTh33HUDSU/HqBz5YDQBhKnKhfq1VtUDNyXR0Dms+2g
gt6CddmFn2ZMmBUIF2T6M8Pb/4ia9fsbuS3hQ9gKSBATf511x4uQcwwuLj7bmz0i
W+ghvQjvhEwbRvXVLmS/
=V866
-----END PGP SIGNATURE-----

--2Jm4oWKVLoshCinpN22MNiGURK0QhE69f--


--===============9016776371106042492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9016776371106042492==--
