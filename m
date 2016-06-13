From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add Starry KR122EA0SRA panel binding
Date: Mon, 13 Jun 2016 13:39:54 +0200
Message-ID: <20160613113954.GC27930@ulmo.ba.sec>
References: <1465578127-30330-1-git-send-email-dianders@chromium.org>
 <CAF6AEGuonEgNvJhfst+3aZPEOaeGwNnozcYwJq3_Z2S0-7ogSA@mail.gmail.com>
 <CAD=FV=XunjDGJYY1+-GPC+hN=kNxLiWbrtZD0_BO1ywerSLhfQ@mail.gmail.com>
 <CAF6AEGsZxZuSVUCqVH=8FUOTMiWBVT52xQ+Qcaqt3yF=pRmf3w@mail.gmail.com>
 <CADMs+9ag_PVeBXsTtFN7bxA50rXmFeVPCsaAQYR2gJxSzANSGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1300111217=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CADMs+9ag_PVeBXsTtFN7bxA50rXmFeVPCsaAQYR2gJxSzANSGQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1300111217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 03:08:50PM -0700, St=C3=A9phane Marchesin wrote:
> On Fri, Jun 10, 2016 at 3:03 PM, Rob Clark <robdclark@gmail.com> wrote:
> > On Fri, Jun 10, 2016 at 3:52 PM, Doug Anderson <dianders@chromium.org> =
wrote:
> >> Rob,
> >>
> >> On Fri, Jun 10, 2016 at 11:43 AM, Rob Clark <robdclark@gmail.com> wrot=
e:
> >>> On Fri, Jun 10, 2016 at 1:02 PM, Douglas Anderson <dianders@chromium.=
org> wrote:
> >>>> The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connected
> >>>> using eDP interfaces.
> >>>
> >>> so drive-by comment... but shouldn't eDP be probe-able?  Not sure why
> >>> we need panel drivers or DT bindings?
> >>
> >> I was wondering about that too.  As far as I can tell:
> >>
> >> 1. We need a panel driver because that appears to be what owns a
> >> reference to the backlight / panel power regulator and that part is
> >> not auto-probable.
> >
> > oh, hmm.. sad.. I was hoping that eDP would save us from dsi per-panel
> > driver hell.. I guess being able to use panel-simple is at least an
> > improvement.  But panel specific sequences is sounds like panel-simple
> > won't save us all the time :-(
>=20
> Yes, although you can probably make things mostly work with improper
> sequencing and enough retries, a lot of ARM hw either requires
> interesting sequencing, or has broken/unreliable DDC, which translates
> into the use of panel simple on the sw side.

panel-simple has support for very simple sequencing. You can specify
delays after the prepare and enable stages. This is useful because most
panels have specific requirements when it comes to the amount of time it
takes them to receive video data (after being powered up) and the amount
of time it takes them to show the first valid frame after it has been
received.

The former is used to keep drivers from sending video data to make sure
it can be properly received by the panel, and the latter is used to keep
the backlight off until the first valid frame is visible on the display.

This is used to avoid glitches and seems to work well enough for simple
panels. More complex panels have more involved sequences, so separate
drivers are required.

Also note that the simple-panel driver will try to use EDID if available
and only fall back to the hard-coded mode or timings if there is no DDC
to probe or no modes could be parsed from EDID.

> >> 2. As far as I could tell, there is no way to declare a generic
> >> (unspecified) panel in the device tree.  Everyone seems to include
> >> "simple-panel" in their compatible string but as far as I can tell
> >> nothing in the kernel looks at it.
> >>
> >> 3. In theory, all the info specified here should match the EDID
> >> exactly and thus (as you said) be probable.  However, it sounds like
> >> (for power sequencing reasons) there might be reasons why you'd want
> >> to know exactly what panel was present beforehand.  You might need to
> >> power the panel and backlight in very specific sequences, for
> >> instance.  I'm not sure it's always 100% possible in all embedded
> >> designs to read the EDID before you know how the sequencing should
> >> work (but, of course, I'm a NOOB).
> >>
> >> 4. Reading the EDID can be slow.  If you happen to know all the info
> >> on the panel beforehand you can significantly speed up boot speed,
> >> notably how fast you can get something on the screen.
> >
> > The theory is (although I think not true currently for most of the arm
> > drivers) that we should be reading back from hw the current config
> > from bootloader splash screen, to avoid a modeset (and conveniently
> > also the need to read edid) at boot.
>=20
> On some devices the firmware doesn't set any video mode, so there
> isn't anything we can read back. That is our case :)

Reading out hardware state also doesn't give you all the information
that you need. I've never seen hardware that is programmed with the
physical size of the panel, so there's no way to read that back and
you'd still have to either parse EDID or use the value hard-coded in
the simple-panel driver if you want to compute the pixel density.

Thierry

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXXpuIAAoJEN0jrNd/PrOhEmkQAKYE72u9YrTCnpyBgyxXV6Yu
AUhvBRFU1Fr/1fvy52k00b4PHOP3e/nJu5JwLuqc2nak4Qbvop6eP/5/D5Oxmg77
4E+2w/K1OrjaEeDe+AR0MatzpxxCkD+UGpzB2MFjqO1FeLga2krrMsYOw4JgKWSz
tv0HdoUmA8iRqnn9TwtWiJYpwR/BkWFltSRiX9EcLfHtuvo4p4SQNaYxEDoM32TI
Nm3YU3IB89rnnso+wKU6AuM/lXrRkeE0stKoXugwo56dbDHmIXylCviF6ITWt847
zVvI26CL9IsMx3gZqD0E/HOnbtKg8FV5rm1MVWl8pAdR/KnpNkW/6gEl9t9jTz+g
oVZQtBs12l0dkLrSov03k2UIlfAiLp8Z56+oN9QLQ7FzwH3Akg9gUqXggQ1kroR9
FYGYLLwPyQKx7aYQo99u8Ui6N2aPGXXkted7HVuIp5N6zUMX1Y7eaPOdnox1Xk+3
7JyOHjD8TwvgJ+Aoe8pzQje+jQDnj+gNXq8Vc8V/nguZIWLrLCsYCuCtrILGobi9
WyXZsQA19kTQ5TnRck0EbWKSKKATXlw7eyLnjTLIBGRGIn/K+YgVCK2Mb3UXSSVu
SzD7DzIn/Atmj37jBPb4hboP0m2XSL3SgutnAHp68k+fsI1SLExiBwfrh4q7v96o
WDtNJpHCBNPDbmYlLqdp
=ccjl
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--

--===============1300111217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1300111217==--
