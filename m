From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for Allwinner CSI.
Date: Sat, 25 Nov 2017 17:02:33 +0100
Message-ID: <20171125160233.skefdpkjy4peh7et@flea.lan>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
 <1501131697-1359-2-git-send-email-yong.deng@magewell.com>
 <20171121154827.5a35xa6zlqrrvkxx@flea.lan>
 <20171122093306.d30fe641f269d62daa1f66b4@magewell.com>
 <20171122094526.nqxfy2e5jzxw7nl4@flea.lan>
 <20171123091444.4bed66dffeb36ecea8dfa706@magewell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3nh54js2ysxviywq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171123091444.4bed66dffeb36ecea8dfa706-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, lin
List-Id: devicetree@vger.kernel.org


--3nh54js2ysxviywq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2017 at 09:14:44AM +0800, Yong wrote:
> > On Wed, Nov 22, 2017 at 09:33:06AM +0800, Yong wrote:
> > > > On Thu, Jul 27, 2017 at 01:01:35PM +0800, Yong Deng wrote:
> > > > > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI inte=
rface
> > > > > and CSI1 is used for parallel interface. This is not documented in
> > > > > datasheet but by testing and guess.
> > > > >=20
> > > > > This patch implement a v4l2 framework driver for it.
> > > > >=20
> > > > > Currently, the driver only support the parallel interface. MIPI-C=
SI2,
> > > > > ISP's support are not included in this patch.
> > > > >=20
> > > > > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > > >=20
> > > > Thanks again for this driver.
> > > >=20
> > > > It seems like at least this iteration is behaving in a weird way wi=
th
> > > > DMA transfers for at least YU12 and NV12 (and I would assume YV12).
> > > >=20
> > > > Starting a transfer of multiple frames in either of these formats,
> > > > using either ffmpeg (ffmpeg -f v4l2 -video_size 640x480 -framerate =
30
> > > > -i /dev/video0 output.mkv) or yavta (yavta -c80 -p -F --skip 0 -f N=
V12
> > > > -s 640x480 $(media-c tl -e 'sun6i-csi')) will end up in a panic.
> > > >=20
> > > > The panic seems to be generated with random data going into parts of
> > > > the kernel memory, the pattern being in my case something like
> > > > 0x8287868a which is very odd (always around 0x88)
> > > >=20
> > > > It turns out that when you cover the sensor, the values change to
> > > > around 0x28, so it really seems like it's pixels that have been cop=
ied
> > > > there.
> > > >=20
> > > > I've looked quickly at the DMA setup, and it seems reasonable to
> > > > me. Do you have the same issue on your side? Have you been able to
> > > > test those formats using your hardware?
> > >=20
> > > I had tested the following formats with BT1120 input:
> > > V4L2_PIX_FMT_NV12		-> NV12
> > > V4L2_PIX_FMT_NV21		-> NV21
> > > V4L2_PIX_FMT_NV16		-> NV16
> > > V4L2_PIX_FMT_NV61		-> NV61
> > > V4L2_PIX_FMT_YUV420		-> YU12
> > > V4L2_PIX_FMT_YVU420		-> YV12
> > > V4L2_PIX_FMT_YUV422P		-> 422P
> > > And they all work fine.
> >=20
> > Ok, that's good to know.
> >=20
> > > > Given that they all are planar formats and YUYV and the likes work
> > > > just fine, maybe we can leave them aside for now?
> > >=20
> > > V4L2_PIX_FMT_YUV422P and V4L2_PIX_FMT_YUYV is OK, and V4L2_PIX_FMT_NV=
12
> > > is bad? It's really weird.
> > >=20
> > > What's your input bus code format, type and width?
> >=20
> > The sensor is an ov5640, so the MBUS code for the bus is
> > MEDIA_BUS_FMT_YUYV8_2X8.
>=20
> Did you test on V3s?

No, this is on an H3, but that would be the first difference so far.

> I haven't tested it with MEDIA_BUS_FMT_YUYV8_2X8.

Ok, it's good to know that at least it works on your end, it's useful
for us to debug things :)

> The Allwinner CSI's DMA is definitely weird. Ond=C5=99ej Jirman thought
> that CSI has an internal queue (Ond=C5=99ej's commit has explained in det=
ail).
> I think CSI just pick up the buffer address before the frame done=20
> interrupt triggered.=20
> The patch in attachment can deal with this. You can see if it is
> useful to solve your problem.

I'll test that on monday, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3nh54js2ysxviywq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloZlBUACgkQ0rTAlCFN
r3RAaxAAiA3iBILt3eBf5t25Qcr1lhJdI2uh7MsblNlOCI8OY+3SmB9vjkqYWjcU
wtQz11nUJ9a6vpxYGkTATJ6yPzCrKKE3HBuSkjR4p4fJvdgkiVoUu5sGQGIZmr64
5tOaSLp3/ce7LAjPES8nNZNi8LiQkNH93iDOJZSNV8wbSviJe+hU8YxhVw4XV5bJ
E084qP+HE5lkse7qtOW8j/D+nZwcquJHOqO8vnQqNVYsWGL56gnmzQdciY8Yomjh
5BYXdTckdNX6fACx/phQVvXVPFdPaP3GT+Nh0m4Y1es62lhhlxND3celh9rugRvt
t2yEooo9CtRthrafG7QISjGImi/Rj58y9ewbrhcmW7rg1BaOKkmZD5h0Ym+U/jqa
9QCOOfHTsZCPKpwhaWE3QF1OGLpPXWwKrnhXU42nBR1o2+uYsDM6hD6Lbc6Z98C0
wYmRGkEUidsGlnMUX7BMo4xGHikOUaf02UIl6LermHbYBxXliq/MhdrThR2meeVB
79OrPI6/s5HcHniyLk9UblP1Wsaa7ztocFLfL1WMEEoUms4kif3AKvXie3Q11g2L
Q0dgVlCwEuSF+kW8lr3cXvuo94GzMMGEGAVoYl2iZ4vp8nYzLv5sIRHK1JaQ4FvG
v1gknqV9BpTW0zobJex6yAZKE78olyQ5fwBodHgtqnxdBOO1Hxk=
=VXwo
-----END PGP SIGNATURE-----

--3nh54js2ysxviywq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
