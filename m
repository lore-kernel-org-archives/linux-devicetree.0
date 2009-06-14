From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Mon, 15 Jun 2009 01:46:43 +0200
Message-ID: <20090614234643.GA17791@pengutronix.de>
References: <1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
	<20090614183357.GE3639@local>
	<20090614190533.GA7387@pengutronix.de>
	<20090614192359.GG3639@local> <4A355155.4020500@grandegger.com>
	<20090614203444.GH3639@local>
	<20090614220022.GB24323@pengutronix.de>
	<20090614230135.GI3639@local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0151276522=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090614230135.GI3639@local>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0151276522==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> driver. A user _has_ to setup irq, if there is none, he still has to set
> irq=3DUIO_IRQ_NONE. For that matter, 'not specified' and 'not found' is b=
oth
> the same bad thing.

Hmm, what should I do?

A typical interrupts-property in a device-tree is specified as:

	interrupts =3D <&irq_controller_node irq_number irq_sense>;

Something like UIO_IRQ_NONE does not fit into this scheme, even more as it =
is
Linux-specific and device trees need to be OS independant.

I'm pretty sure the correct way to state that you don't need an interrupt in
the device-tree is to simply not specify the above interrupt property.

Well, yes, that means you can't distinguish between 'forgotten' and
'intentionally left out'. I wonder if it is really that bad? If something d=
oes
not work (=3D one is missing interrupts), the first place to look at is the
device tree. If one does not see an interrupt-property, voila, problem solv=
ed.

(Note that with my latest suggestion, a _wrong_ interrupt is handled the sa=
me
way as with platform_data. request_irq() should equally fail if the
return-value from irq_of_parse_and_map() is simply forwarded.)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko1i+MACgkQD27XaX1/VRtmwgCfU35vNsB6pRMg8ZPEwH5uZbGv
yf0AoK9cs8c+cyQpX3TlCqepX2CY7fID
=ZRIy
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============0151276522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0151276522==--
