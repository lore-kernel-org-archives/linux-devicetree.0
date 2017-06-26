From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: omap3isp camera was Re: [PATCH v1 0/6] Add support of OV9655
 camera
Date: Mon, 26 Jun 2017 10:39:27 +0200
Message-ID: <20170626083927.GB9621@amd>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <385A82AC-CC23-41BD-9F57-0232F713FED9@goldelico.com>
 <1E453955-0C1A-414B-BBB2-C64B6D0EF378@goldelico.com>
 <20170625091856.GA22791@amd>
 <EDFD663F-37F9-42C2-92A9-66C2508B361E@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <EDFD663F-37F9-42C2-92A9-66C2508B361E-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Discussions about the Letux Kernel <letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-06-26 08:05:04, H. Nikolaus Schaller wrote:
> Hi Pavel,
>=20
> > Am 25.06.2017 um 11:18 schrieb Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>:
> >=20
> > Hi!
> >=20
> >> * unfortunately we still get no image :(
> >>=20
> >> The latter is likely a setup issue of our camera interface (OMAP3 ISP =
=3D Image Signal Processor) which
> >> we were not yet able to solve. Oscilloscoping signals on the interface=
 indicated that signals and
> >> sync are correct. But we do not know since mplayer only shows a green =
screen.
> >=20
> > What mplayer command line do you use? How did you set up the pipeline
> > with media-ctl?
> >=20
> > On kernel.org, I have tree called camera-fw5-6 , where camera works
> > for me on n900. On gitlab, there's modifed fcam-dev, which can be used
> > for testing.
>=20
> We did have yet another (non-DT) camera driver and media-ctl working in w=
ith 3.12.37,
> but had no success yet to update it to work with modern kernels or driver=
s. It
> is either that the (newer) drivers missing something or the media-ctl has=
 changed.
>=20
> Here is the log of our scripts with Hugues' driver and our latest setup:
>=20
> root@letux:~# ./camera-demo sxga
> DISPLAY=3D:0
> XAUTHORITY=3Dtcp
> Camera: /dev/v4l-subdev8
> Setting mode sxga
> media-ctl -r
> media-ctl -l '"ov965x":0 -> "OMAP3 ISP CCDC":0[1]'
> media-ctl -l '"OMAP3 ISP CCDC":1 -> "OMAP3 ISP CCDC output":0[1]'
> media-ctl -V '"ov965x":0 [UYVY2X8 1280x1024]'
> media-ctl -V '"OMAP3 ISP CCDC":0 [UYVY2X8 1280x1024]'
> media-ctl -V '"OMAP3 ISP CCDC":1 [UYVY 1280x1024]'

Ok, so you are using capture, not preview.

You may want to try this one:

commit 0eae9d2a8f096f703cbc8f9a0ab155cd3cc14cef
Author: Pavel <pavel-+ZI9xUNit7I@public.gmane.org>
Date:   Mon Feb 13 21:26:51 2017 +0100

    omap3isp: fix VP2SDR bit so capture (not preview) works

    This is neccessary for capture (not preview) to work properly on
        N900. Why is unknown.
=09
									Pavel

> ### starting mplayer in sxga mode ###
> mplayer tv:// -vf rotate=3D2 -tv driver=3Dv4l2:device=3D/dev/video2:outfm=
t=3Duyvy:width=3D1280:height=3D1024:fps=3D15 -vo x11
> MPlayer2 2.0-728-g2c378c7-4+b1 (C) 2000-2012 MPlayer Team
>=20
> Playing tv://.
> Detected file format: TV
> Selected driver: v4l2
>  name: Video 4 Linux 2 input
>  author: Martin Olschewski <olschewski-G033eQCYXkkRtNtAH2Wc8g@public.gmane.org>
>  comment: first try, more to come ;-)
> v4l2: ioctl get standard failed: Invalid argument
> Selected device: OMAP3 ISP CCDC output
>  Capabilities:  video capture  video output  streaming
>  supported norms:
>  inputs: 0 =3D camera;
>  Current input: 0
>  Current format: unknown (0x0)
> tv.c: norm_from_string(pal): Bogus norm parameter, setting default.
> v4l2: ioctl enum norm failed: Inappropriate ioctl for device
> Error: Cannot set norm!
> Selected input hasn't got a tuner!
> v4l2: ioctl set mute failed: Inappropriate ioctl for device
> v4l2: ioctl query control failed: Inappropriate ioctl for device
> v4l2: ioctl query control failed: Inappropriate ioctl for device
> v4l2: ioctl query control failed: Inappropriate ioctl for device
> v4l2: ioctl query control failed: Inappropriate ioctl for device
> v4l2: ioctl streamon failed: Broken pipe
> [ass] auto-open
> Opening video filter: [rotate=3D2]
> VIDEO:  1280x1024  15.000 fps    0.0 kbps ( 0.0 kB/s)
> Could not find matching colorspace - retrying with -vf scale...
> Opening video filter: [scale]
> [swscaler @ 0xb5ca9980]using unscaled uyvy422 -> yuv420p special converter
> VO: [x11] 1024x1280 =3D> 1024x1280 Planar YV12
> [swscaler @ 0xb5ca9980]No accelerated colorspace conversion found from yu=
v420p to bgra.
> Colorspace details not fully supported by selected vo.
> Selected video codec: RAW UYVY [raw]
> Audio: no sound
> Starting playback...
> V:   0.0  10/ 10 ??% ??% ??,?% 0 0 $<3>
>=20
>=20
> MPlayer interrupted by signal 2 in module: filter_video
> V:   0.0  11/ 11 ??% ??% ??,?% 0 0 $<3>
> v4l2: ioctl set mute failed: Inappropriate ioctl for device
> v4l2: 0 frames successfully processed, 0 frames dropped.
>=20
> Exiting... (Quit)
> root@letux:~#
>=20
> BR and thanks,
> Nikolaus
>=20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllQyD8ACgkQMOfwapXb+vIqDQCgw7XZNl5xBooJqFPKbhC4+AlF
Ca4AnRgWANHXtkaV0X3Qnccp6YCNCa0F
=5wyz
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
