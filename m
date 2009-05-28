From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 08:34:45 +0200
Message-ID: <20090528063445.GA12004@pengutronix.de>
References: <87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
	<20090527193927.GD30039@game.jcrosoft.org>
	<fa686aa40905271322x2f62c3dcs355374b30b4db3ca@mail.gmail.com>
	<20090527235704.GQ6805@pengutronix.de>
	<fa686aa40905272021w18a148caqd2b73c4448da2b28@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1916949571=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40905272021w18a148caqd2b73c4448da2b28-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1916949571==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It is inherent in the value "atmel,24c08".  Because the exact device
> model is specified, the kernel can know what the page size and flags
> are for that device.

I am afraid this is not the case. I remember that we once had two revisions=
 of
the same eeprom, and the vendor decided to increase the page size without
changing the naming of the eeprom. (Can't point to any documentation yet, w=
ould
have to dig this up.) Those eeproms can be really weird.

Also, there are _a lot_ of eeprom manufacturers out there, so the match tab=
le
will be enormous....

> OTOH, if it is appropriate for the device, then the binding can be define=
d to
> include things like page size and flags encoded explicitly in additional
> properties.

=2E.., so I think a property like "page-size" could really be argumented fo=
r.
Actually, I am quite optimistic that there could be agreement on it. Maybe =
we
could also reuse the "read-only" property which is used for partitions. Sti=
ll,
this discussion has to be done, and that is additional work for mainlining.

Also, this would be _another_ wrapper to collect data from the device tree =
and
pass it into platform_data. I think it is difficult to maintain. If somebody
extends at24 and forgets about the of-wrapper, it may easily get broken. Pl=
us,
at least for me, coding always very similar stuff, feels like bloating the
kernel. I did it a few times now, and that made me really wonder if we can't
have a more generic solution to that problem. Sadly, I could neither come up
with anything useful :(

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoeMIUACgkQD27XaX1/VRtnZwCfQe5nSJ/mRhg/8mS2Yj842Ifa
BacAoMh6k4ifzgmxTJGAMbfbdATew2kD
=4PH1
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============1916949571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1916949571==--
