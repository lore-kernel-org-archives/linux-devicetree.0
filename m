From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/3] ARM: sunxi: Add documentation for
 sunxi consumer infrared devices
Date: Sat, 3 May 2014 10:45:20 -0700
Message-ID: <20140503174520.GA15342@lukather>
References: <1398871010-30681-1-git-send-email-bay@hackerdom.ru>
 <1398871010-30681-2-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBTOYSSNQKGQEGIMYMHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398871010-30681-2-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 09:16:48PM +0600, Alexander Bersenev wrote:
> This patch adds documentation for Device-Tree bindings for sunxi IR
> controller.
>=20
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
> ---
>  .../devicetree/bindings/media/sunxi-ir.txt         | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Docum=
entation/devicetree/bindings/media/sunxi-ir.txt
> new file mode 100644
> index 0000000..d502cf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> @@ -0,0 +1,23 @@
> +Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
> +
> +Required properties:
> +- compatible	    : should be "allwinner,sun7i-a20-ir";
> +- clocks	    : list of clock specifiers, corresponding to
> +		      entries in clock-names property;
> +- clock-names	    : should contain "apb0_ir0" and "ir0" entries;
> +- interrupts	    : should contain IR IRQ number;
> +- reg		    : should contain IO map address for IR.
> +
> +Optional properties:
> +- linux,rc-map-name : Remote control map name.
> +
> +Example:
> +
> +ir0: ir@01c21800 {
> +       	compatible =3D "allwinner,sun7i-a20-ir";
> +       	clocks =3D <&apb0_gates 6>, <&ir0_clk>;
> +       	clock-names =3D "apb0_ir0", "ir0";

Most of the time, we use something like "apb" and "ir". The names
being generic, if there ever comes a time where you have a second
controller, you don't have to do anything confusing or inconsistent.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTZSswAAoJEBx+YmzsjxAg5gYP/2lsQUHZgbQkji8OwT4EDdzy
JSsE8bmWB+YZjkD0GHMKEn5RUqxt0VCNiNngpKAFwT0A8n3HFN5AlCo3ZZz70RyN
88l5R2pfq/ftzhDJE+Pp8Q5ToQ+XR2k4CmEA5UpdMsJ8+stxNRlaKOnYIPfnK1Wj
Hmi9xSyJZ1Nz6sdw7fxy051lmPiWWSvrmVjh6OqAxGte+Odw5lz0fiosNv9VpJo6
8luskf+PHPAk5clbTqd7RyZ//sGB9r6htc5ybeh5ql4OJ1Yp/ntWs/yhZ3Sn3iyA
V6vgGNEmdsJleWOeN0on3/cccTFLnDkWNQXYOQDPGx573WTtWoSwW94nJICFe0Hl
8P1ZTvwD3bVrAebdWEGa6yAJ1vETU5heTFCY2llO0JZLaeCL6DaSU2f8fjWHJOp+
7g2zAdISKm9qaPRdVF/K1Hdt2flp8TWAq4sxZUer7eTGab6NYGrGmG4cATpBhcDr
ZGcYmGjoC7kswPP5frVg7q+6r3RWu1r+BA9ZqdJGHHZjrHrINANLyn1uybKPTTgB
h2RuKVdfIm4DvMIMaiVE8x4dK/NjXa2Y4ptdG20eNVaxIuPQ9gAZN878Pdf4u7Iu
B/jAqkE4r3lVfjarMyHMSKx1yjXKgjBujhCj0J1eveiLWCOeg+MLIzUGNQoyjlPO
vfI/90NAa3X3SlyoQ8tY
=B/uK
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
