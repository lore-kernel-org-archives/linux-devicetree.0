From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Fri, 26 Sep 2014 10:43:06 -0500
Message-ID: <20140926154306.GE26227@saruman>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <20140926003750.GA12770@saruman>
 <20140926003934.GD12770@saruman>
 <3346642.tZaefcZubX@wuerfel>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3346642.tZaefcZubX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 26, 2014 at 09:20:54AM +0200, Arnd Bergmann wrote:
> On Thursday 25 September 2014 19:39:34 Felipe Balbi wrote:
> > >=20
> > > why would a glue layer need to access registers from the core ? That
> > > sounds very odd. I haven't seen that and will, definitely, NACK such a
> > > patch=20
> > >=20
> > > can you further describe why you think a glue layer might need to acc=
ess
> > > core IP's registers ?
> >=20
> > I just realised we're talking about chipidea here... in any case, it's
> > still valid to ask why would glue need to fiddle with core IP's
> > registers.
>=20
> Generally, the glue driver wouldn't access the registers, but I don't
> think it's important to prevent it from doing that. In some cases,=20

sure it is. Have already gone through debugging sessions just because
someone fiddled with registers they shouldn't. Also RMK's L2 rework
patchset is another example of why it's important to prevent other
layers from messing with registers they don't really own.

> a glue driver needs to override a function of the core driver, e.g.
> to work around an errata. We have a lot of those quirks in ATA drivers,

pass a quirk flag and let core driver handle it.

> one example from ahci_mvebu.c is
>=20
> static void ahci_mvebu_regret_option(struct ahci_host_priv *hpriv)
> {
>         /*
>          * Enable the regret bit to allow the SATA unit to regret a
>          * request that didn't receive an acknowlegde and avoid a
>          * deadlock
>          */
>         writel(0x4, hpriv->mmio + AHCI_VENDOR_SPECIFIC_0_ADDR);
>         writel(0x80, hpriv->mmio + AHCI_VENDOR_SPECIFIC_0_DATA);

I would rather see:

	if (this_is_one_of_the_broken_mvebu_versions(hpriv))
		quirks |=3D AHCI_NEEDS_REGRET_BIT;

then let core handle the rest. If other glue has the same bug and needs
the workaround, we don't duplicate code.

--=20
balbi

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJYmKAAoJEIaOsuA1yqREd+QP+gMT9mRfPY+Tc7gb/L9ltPvu
IfVPneXdEdoSDYnMmPYiiIGyn3ilqzcNnrgREdsO27CNqS3nmfnMu3HJXUVralLI
ztR0LzSaqG2bwdAj4PqCv3P6NPMyAvWnFCwrGAcWDdysaQJuT2UQxxJ4yHZFcK88
JT7wghPSTAbHJrwN5BaW5jzhrVnapOGGaaxBDTBC55gFmferWbwiY4QZJjniWi62
apMQo77ZfZad8V47dmYQxp6Qv02YXHgGoKD9GYfbDsvGzMX0EWrYVg7IklmZStNG
II+MiuhmVdDtXwHbQIW28iYd2M+d0b9a6LnvlghLdwAN3ZZqClwIhd9KENs6IoZK
60p58kUBez+NUZrEx7aag/ikFqVUsrVtaj7SaHJrKFJHxu9Aoyu4PaNom/cZFG/X
7IPoJ3gzDonsNkPU4WR1Xk/QXsSVDi1ObgKUug0j+EZYPPRY296kSwpAdJlrsUwu
K0pM3rwMFoEWJBJxXh6uSJ78xGC0oTqKEPRGS1BOMnLUOaisRQZWw4AGRMzmSKmh
ZySjVPStjwzPrhwhEerUus+6KigibQyzJREOyepOJTEXRvZCfr6yKA/1oEwCaHx4
ccV0r6yxTtShdly5o5V/sE15VnKW59rMjxzMEx/vx6wYLCo89oeR1VPpJ4ae8zcu
AM+janwF4xSj3+OWX9lk
=1Ma1
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
