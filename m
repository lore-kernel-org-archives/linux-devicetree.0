From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Wed, 24 Aug 2016 21:36:00 +0200
Message-ID: <20160824193600.GS8103@lukather>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8328559119004443516=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823064451.25997-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8328559119004443516==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pa4xkLBhPDIhDLv1"
Content-Disposition: inline


--Pa4xkLBhPDIhDLv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2016 at 02:44:51PM +0800, Icenowy Zheng wrote:
> UART1 is connected to the bluetooth part of RTL8723BS WiFi/BT combo card
> on iNet D978 Rev2 board.
>=20
> Enable the UART1 to make it possible to use the modified hciattach by
> Realtek to drive the BT part of RTL8723BS.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

I guess you could fold that patch into the previous one.

> ---
>  arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/arch/arm/bo=
ot/dts/sun8i-a33-inet-d978-rev2.dts
> index 78823d8..3ac22d4 100644
> --- a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> +++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> @@ -48,6 +48,10 @@
>  	model =3D "INet-D978 Rev 02";
>  	compatible =3D "primux,inet-d978-rev2", "allwinner,sun8i-a33";
> =20
> +	aliases {
> +		serial1 =3D &uart1;
> +	};
> +

Is there any other UART in the system?

The alias is not supposed to be about the controller index, but the
index in the board, meaning that if you only have a single UART, that
would be serial0.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Pa4xkLBhPDIhDLv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvfcgAAoJEBx+YmzsjxAgGQ0P/2/AbbM6QYL2xW+HiVx9jth/
b+zpGe76ov3FfI0zl9hkwuxaEOfQXse7sb96v49veloi0Qxft7GTPZY7W3co1Oza
x+zShHNLnAQrEFl7yaCuRpH+jTPJzyP01mcWGknbl/QK2wOal++30XgoWhtqHpZI
Wqfv4ULB4dpyQZHxErc189WbLQ2T6dzQj3h2es8l9yp+cjMpod3MjGyiDo1FsMPy
lPz18KWkUUQBG0HBC7dIKCISu638e5Rmb5cdi3hFJjCh/Y4mljoiZkzX0eRmCjc7
dXbXwBJlEvLijnDffnjkKDd5mnzPDK6sCDYGEWX78bMO9Vz0Q75IvvVgc8BhGlZA
+3fWvDnX5wBHvWLvK6dpDbZFUL1MtRSKkj7xcqSp37LNYWt1L0z/hHL5VoaMpwVN
bEuFdxuL92Lkqqlw1fPd0DkbJb+iuifZb337Y0womoovkKeX5PPPNhG2WkO3Njk1
zz3kf0kvFrjr11rj55j5PWI4UWqWEAZ/clt/VoIqTLBzG13ARYhaMvyLUu04sUy7
qbWmFsQILdb6oPvBS3d8ZiIzKHxXAYPKofqgWrvQHFekBd8RR73syKIEFFoLoDL9
angiTZ02I75ZjtN4k99JSykqaWhVvxgcL4TL82MrdxOdSTM0IZRDcc6kyO7a8nQh
tm7Jhcx7eVuiTOJ3EmcR
=mNJv
-----END PGP SIGNATURE-----

--Pa4xkLBhPDIhDLv1--


--===============8328559119004443516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8328559119004443516==--
