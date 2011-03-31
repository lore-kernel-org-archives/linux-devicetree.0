From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 15:23:28 +0200
Message-ID: <20110331132328.GB2202@pengutronix.de>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de>
	<AANLkTi=sG6oVNifwLLi8jjKQXjR6kXZx43NxtFfoPumy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8406740173568473408=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=sG6oVNifwLLi8jjKQXjR6kXZx43NxtFfoPumy-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8406740173568473408==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>    Maybe I misunderstand you, in my view it is the responsibility of <ven=
dor>
>    to create their DTS files to indicate they want <special-card1> to bin=
d to
>    generic-uio.

Device tree is a OS-neutral hardware description language. "generic-uio"
is neither OS-neutral nor a hardware description. devicetree.org has
more information about this.

>    Our use-case is pretty clear, in FPGA-based systems it is common to cr=
eate
>    arbitrary devices that developers just want to control from userspace,
>    with simple IRQ and IO capabilities (DMA can come later :). =EF=BF=BDT=
hey don't
>    need to bind to other kernel APIs or subsystems, and don't want to inv=
est
>    in one-off kernel drivers that simply will never go upstream.

For that, the new_compatible-file would be suitable, I think.

>    UIO is perfect, and simply tagging the device as generic-uio in the DT=
S is
>    so simple, clean, and elegant.

Simple, yes (I do understand I wrote the first approach ;)) . Elegant,
not really, because it breaks core conventions of the device tree. For
your case it is a very conveniant hack, but it is still a hack.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk2UgFAACgkQD27XaX1/VRuEugCgjLO3U70anQaSTbTP6iHZhLe0
53AAoMLdNVxGaWW5c/OogxM1oGWLO7Lv
=HpOQ
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--

--===============8406740173568473408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8406740173568473408==--
