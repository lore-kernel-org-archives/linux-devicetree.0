From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 15/39] [media] v4l2: add a frame interval error event
Date: Sat, 11 Mar 2017 00:30:09 +0100
Message-ID: <20170310233008.GC6540@amd>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-16-git-send-email-steve_longerbeam@mentor.com>
 <5b0a0e76-2524-4140-5ccc-380a8f949cfa@xs4all.nl>
 <ec05e6e0-79f2-2db2-bde9-4aed00d76faa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ec05e6e0-79f2-2db2-bde9-4aed00d76faa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-m
List-Id: devicetree@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-03-10 10:37:21, Steve Longerbeam wrote:
> Hi Hans,
>=20
> On 03/10/2017 04:03 AM, Hans Verkuil wrote:
> >On 10/03/17 05:52, Steve Longerbeam wrote:
> >>Add a new FRAME_INTERVAL_ERROR event to signal that a video capture or
> >>output device has measured an interval between the reception or transmit
> >>completion of two consecutive frames of video that is outside the nomin=
al
> >>frame interval by some tolerance value.
> >
> >Reading back what was said on this I agree with Sakari that this doesn't
> >belong here.
> >
> >Userspace can detect this just as easily (if not easier) with a timeout.
> >
>=20
>=20
> Unfortunately measuring frame intervals from userland is not accurate
> enough for i.MX6.
>=20
> The issue here is that the IPUv3, specifically the CSI unit, can
> permanently lose vertical sync if there are truncated frames sent
> on the bt.656 bus. We have seen a single missing line of video cause
> loss of vertical sync. The only way to correct this is to shutdown
> the IPU capture hardware and restart, which can be accomplished
> simply by restarting streaming from userland.
>=20
> There are no other indicators from the sensor about these short
> frame events (believe me, we've exhausted all avenues with the ADV718x).
> And the IPUv3 DMA engine has no status indicators for short frames
> either. So the only way to detect them is by measuring frame intervals.
>=20
> The intervals have to be able to resolve a single line of missing video.
> With a PAL video source that requires better than 58 usec accuracy.
>=20
> There is too much uncertainty to resolve this at user level. The
> driver is able to resolve this by measuring intervals between hardware
> interrupts as long as interrupt latency is reasonably low, and we
> have another method using the i.MX6 hardware input capture support
> that can measure these intervals very accurately with no errors
> introduced by interrupt latency.

Requiring < 58 usec interrupt latency for correct operation is a
little too optimistic, no?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljDNwAACgkQMOfwapXb+vJ7QQCgtEbEXugPMwrRs4Hkus/pkSLt
aEsAn3XDjALlY2x5aNwU5WRVdJrN2cJA
=KKPo
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
