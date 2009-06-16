From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Tue, 16 Jun 2009 11:04:35 +0200
Message-ID: <20090616090435.GA21321@pengutronix.de>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<fa686aa40906140740m43e9dd8am4d242310f681c95c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0255743172=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40906140740m43e9dd8am4d242310f681c95c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0255743172==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > diff --git a/Documentation/powerpc/dts-bindings/uio-generic.txt b/Docum=
entation/powerpc/dts-bindings/uio-generic.txt
> > new file mode 100644
> > index 0000000..8ad9861
> > --- /dev/null
> > +++ b/Documentation/powerpc/dts-bindings/uio-generic.txt
> > @@ -0,0 +1,16 @@
> > +UIO for custom devices
> > +
> > +A device which will be mapped using the UIO subsystem.
> > +
> > +Properties:
> > + - compatible : should contain the specific model used, followed by
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"generic-uio".
> > + - reg : address range(s) of the device (up to MAX_UIO_MAPS)
> > + - interrupts : interrupt of the device
> > +
> > +Example:
> > + =A0 =A0 =A0 =A0c64fpga@0 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "ptx,c64fpga001", "gene=
ric-uio";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x0 0x10000>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <0 0 3>;
> > + =A0 =A0 =A0 =A0};
>=20
> Hmmm, I'm not happy about this.  The device tree describes the
> hardware, not the way Linux uses the hardware.  UIO definitely falls
> into the category of Linux implementation detail.

Yes, I am aware of that. I just started with the mechanisms which are avail=
able
today and hoped we could find some compatible-value which will suit all nee=
ds.

> This should be approached from the other way around.  Either the
> generic-uio of_platform driver should contain an explicit list of
> devices to be handled by UIO,

Well, that could lead to a quite huge match_table over time.

> or the OF infrastructure should be modified to allow things like force
> binding of_devices to of_drivers at runtime.

That is an interesting idea. I could imagine something like a 'new_compatib=
le"
entry in the sysfs-section of the driver similar to 'new_id' for PCI. After
writing a new compatible-string into it, matching will triggered again with=
 the
new entry added. That could (should?) also be placed at the of-core-level. =
Or
did you have something else in mind?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko3YCMACgkQD27XaX1/VRswtwCcDtPiiseb3Z92cZ6a+o9qGHNi
k+wAnAubWxlG7Oi6ZRW2G0NMueA8Gwsh
=0vEj
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============0255743172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0255743172==--
