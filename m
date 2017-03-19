From: Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sat, 18 Mar 2017 20:41:14 -0400
Message-ID: <1489884074.21659.7.camel@ndufresne.ca>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
         <20170318192258.GL21222@n2100.armlinux.org.uk>
         <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
         <20170318204324.GM21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-xaD73S9VP/RR5tcyQzYG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170318204324.GM21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWNGWvitb5QawA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-xaD73S9VP/RR5tcyQzYG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 mars 2017 =C3=A0 20:43 +0000, Russell King - ARM Linux a
=C3=A9crit=C2=A0:
> On Sat, Mar 18, 2017 at 12:58:27PM -0700, Steve Longerbeam wrote:
> > Can you share your gstreamer pipeline? For now, until
> > VIDIOC_ENUM_FRAMESIZES is implemented, try a pipeline that
> > does not attempt to specify a frame rate. I use the attached
> > script for testing, which works for me.
>=20
> It's nothing more than
>=20
> =C2=A0 gst-launch-1.0 -v v4l2src ! <any needed conversions> ! xvimagesink
>=20
> in my case, the conversions are bayer2rgbneon.=C2=A0 However, this only
> shows
> you the frame rate negotiated on the pads (which is actually good
> enough
> to show the issue.)
>=20
> How I stumbled across though this was when I was trying to encode:
>=20
> =C2=A0gst-launch-1.0 v4l2src device=3D/dev/video9 ! bayer2rgbneon ! \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0videoconvert ! x264enc sp=
eed-preset=3D1 ! avimux ! \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0filesink location=3Dtest.=
avi
>=20
> I noticed that vlc would always say it was playing the resulting AVI
> at 30fps.

In practice, I have the impression there is a fair reason why framerate
enumeration isn't implemented (considering there is only 1 valid rate).
Along with the norm fallback, GStreamer could could also consider the
currently set framerate as returned by=C2=A0VIDIOC_G_PARM. At the same time=
,
implementing that enumeration shall be straightforward, and will make a
large amount of existing userspace work.

regards,
Nicolas
--=-xaD73S9VP/RR5tcyQzYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAljN06oACgkQcVMCLawGqByUagCeI3lU4c6DuhMZIT8TI7IeyLyw
AtgAoKvEUMki8JM51W1VwpEGTKYWTSI9
=pz27
-----END PGP SIGNATURE-----

--=-xaD73S9VP/RR5tcyQzYG--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
