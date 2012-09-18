From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3] gpio: Add Avionic Design N-bit GPIO expander support
Date: Tue, 18 Sep 2012 15:48:10 +0200
Message-ID: <20120918134810.GA16840@avionic-0098.mockup.avionic-design.de>
References: <1347958630-19672-1-git-send-email-thierry.reding@avionic-design.de>
 <50587903.9060507@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0019557698022208964=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50587903.9060507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0019557698022208964==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 08:37:07AM -0500, Rob Herring wrote:
> On 09/18/2012 03:57 AM, Thierry Reding wrote:
[...]
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-adnp.txt b/Doc=
umentation/devicetree/bindings/gpio/gpio-adnp.txt
> > new file mode 100644
> > index 0000000..5a09a21
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-adnp.txt
> > @@ -0,0 +1,30 @@
> > +Avionic Design N-bit GPIO expander bindings
> > +
> > +Required properties:
> > +- compatible: should be "ad,gpio-adnp"
> > +- reg: The I2C slave address for this device.
> > +- interrupt-parent: phandle of the parent interrupt controller.
> > +- interrupts: Interrupt specifier for the controllers interrupt.
> > +- #gpio-cells: Should be 2. The first cell is the GPIO number and the
> > +  second cell is used to specify optional parameters:
> > +  - bit 0: polarity (0: normal, 1: inverted)
>=20
> This contradicts the documentation changes you just submitted. That's
> fine, but perhaps that documentation should say recommended encoding of
> cells unless defined differently for an individual binding.

The documentation changes were for #interrupt-cells, this is
#gpio-cells.

Thierry

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWHuaAAoJEN0jrNd/PrOhISYQAKgAx8YWuk9HTbH8npCTLmRv
BHAa/7ajWbZRnk/0GPs2JwCq8xc4YdQITlbvH8YbVMMIN8Em122McBJf1XiJi/LD
/hNws6B9ZqEbHr+mwendEQGVFpw1fITO/yPLGKwPlC9vpHZDKuN3cBMK9OCsiS54
Fa1h1kwcXHIbsdyMnsXRsmECz8W4d8k7BeIbSOaOz7awdfNXnzGMm4M8Uxc+uoiV
rpB/zeRLoOW0x5Ucx4nqctZe/2jGdHzOSSqj5NpgIQP3aePT4jp3e5nCP4dbtl+I
H/NQ7IVDVeviEnprPMWWVU1xL2Dac2OuTAFv5iHhIVl9ps45Pb/Zx6ustzyHPUWI
wouOAuW7Zjh1u9moBUSNCmE7IpdBcxiIshrOimQ0NXBYi6aphMaUUiLcbfnE2QHD
SlYxptFru2PITxb0c/X1MW3qxli1EfffAuvQYY4NbHL+HWcNsmgAK1WJgkgWLwH5
MLUh5SyoWFxfbodmI4T1VMdQ5VS5auL/MXi7qRIw3M1TfBSHyTM8uy+zEJqiF+Ey
APG/pnvEHNk4hIpMVeRtQjP/D7taaOSQzkbgTiInX8g5LctMotbuVYlm620rbuXG
mk4v7lUslidH2GMIn28CTtmzhtNIW88GDcQTZWVVn2H7fk5pMkfPnJWM+BnpsvG5
1Ve895G+TmXSq2HRTPIM
=vbuC
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============0019557698022208964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0019557698022208964==--
