From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Mon, 18 Aug 2014 20:58:10 +0200
Message-ID: <20140818185810.GG15297@lukather>
References: <1408382788-32153-1-git-send-email-boris.brezillon@free-electrons.com>
 <1408382788-32153-3-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6S+CllbbV/7E5K18"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNE2ZGPQKGQE6TTZTZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408382788-32153-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "Dmitriy B." <rzk333-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Meyer <quitte-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6S+CllbbV/7E5K18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Mon, Aug 18, 2014 at 07:26:28PM +0200, Boris BREZILLON wrote:
> Add the sunxi NAND Flash Controller dt bindings documentation.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         | 45 ++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Docum=
entation/devicetree/bindings/mtd/sunxi-nand.txt
> new file mode 100644
> index 0000000..798c691
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -0,0 +1,45 @@
> +Allwinner NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible : "allwinner,sun4i-nand".

The pattern we usually have for the sunxi SoCs is
allwinner,family-soc-*, which would be allwinner,sun4i-a10-nand in
this case.

> +- reg : shall contain registers location and length for data and reg.
> +- interrupts : shall define the nand controller interrupt.
> +- #address-cells: shall be set to 1. Encode the nand CS.
> +- #size-cells : shall be set to 0.
> +- clocks : shall reference nand controller clocks.
> +- clock-names : nand controller internal clock names. Shall contain :
> +    * "ahb_clk" : AHB gating clock
> +    * "sclk" : nand controller clock

And we're usually using "ahb" and "mod" in such a case.

It looks fine otherwise.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--6S+CllbbV/7E5K18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT8kzCAAoJEBx+YmzsjxAgovsQAKVS7HRggRv6xTKlPP+3jzTx
I3nWydlAfO9HJ5U9lxJ1CUZeuptXVq+rfqNmNqrMNyJzFYjrYAIqryaKeM4CP0b6
WV6rTX2u6nBJ2mmRi4lx1WRnAaCBrqsl7QOMAyPhdAJQzd23vidvDLXKB1XnFLhQ
jDFC5bO00XhCOoCrtVlVekWUu18s5aY28VjcaJP/xxok2aQsh/DVqoHPNrh8Fx4d
kEcI8MscDOsbpSz5PugHo7B4vuKfJ7Rd86B76oYXqHi5FbInj1xwqVb69gGvO/AX
qkizphhrmDJGvGHR7xTE3K6m1nx6eCLdfP2PQpPSwePRsZ4m0tO3NooNbgnhOdhN
I8LVjZzgL0Kn9VP+JNVqDY15hEoFRrdjKYPTZh5/1TcEA0pwEOX6TydCVviAko5e
G95+H6meVCKEPuxGP5zO0S5CL1Cv+kyfVXGm89CWp3Vp46uU9Xc+UW0aBh2BeVsB
IHxfwKCg8S7ThVPOYtK/0x52XPW+psfFrnDieCFwfckOkAFiVu4LA5RNipWHn0ad
w5lxIUutIwmNlcXw2PwwekTIL6h6P6mqPT9O+JyPlrxtdHvsOiFR0x09RiV7Rhv4
O89ArjzKtT103BVMDc+EQeSbkg4Q3lGHSryL1mnomZDdzPZJNrwhrxS2m/0vxyv4
HCFs0yjEqw26oNACMB6k
=CIrS
-----END PGP SIGNATURE-----

--6S+CllbbV/7E5K18--
