From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add Starry KR122EA0SRA panel binding
Date: Mon, 13 Jun 2016 13:28:44 +0200
Message-ID: <20160613112844.GB27930@ulmo.ba.sec>
References: <1465578127-30330-1-git-send-email-dianders@chromium.org>
 <CAF6AEGuonEgNvJhfst+3aZPEOaeGwNnozcYwJq3_Z2S0-7ogSA@mail.gmail.com>
 <CAD=FV=XunjDGJYY1+-GPC+hN=kNxLiWbrtZD0_BO1ywerSLhfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0525722575=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD=FV=XunjDGJYY1+-GPC+hN=kNxLiWbrtZD0_BO1ywerSLhfQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============0525722575==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 12:52:41PM -0700, Doug Anderson wrote:
> Rob,
>=20
> On Fri, Jun 10, 2016 at 11:43 AM, Rob Clark <robdclark@gmail.com> wrote:
> > On Fri, Jun 10, 2016 at 1:02 PM, Douglas Anderson <dianders@chromium.or=
g> wrote:
> >> The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connected
> >> using eDP interfaces.
> >
> > so drive-by comment... but shouldn't eDP be probe-able?  Not sure why
> > we need panel drivers or DT bindings?
>=20
> I was wondering about that too.  As far as I can tell:
>=20
> 1. We need a panel driver because that appears to be what owns a
> reference to the backlight / panel power regulator and that part is
> not auto-probable.

Yes, that's one of the reasons why we still need DT nodes for panels,
even on a probe-able bus.

eDP has a mechanism to allow brightness control via DPCD, but I've never
actually seen it implemented. Even if we had that, we'd likely need to
represent supplies and GPIOs for the backlight, and we'd be back to
square one.

DSI also provides a means to control backlight brightness, but in the
same way that eDP doesn't go all the way, we'd require external
resources to be hooked up via DT again.

> 2. As far as I could tell, there is no way to declare a generic
> (unspecified) panel in the device tree.  Everyone seems to include
> "simple-panel" in their compatible string but as far as I can tell
> nothing in the kernel looks at it.

The ones that do are wrong and should eventually be updated. This was
originally done, and the driver used to match on simple-panel as well,
but in retrospect that didn't make any sense at all so it was removed
=66rom the driver again.

One of the reasons why it doesn't make any sense is because even if you
have an EDID that's reachable, the EDID itself doesn't fully specify the
panel. Power sequences are one example of data that's not represented in
EDID.

> 3. In theory, all the info specified here should match the EDID
> exactly and thus (as you said) be probable.  However, it sounds like
> (for power sequencing reasons) there might be reasons why you'd want
> to know exactly what panel was present beforehand.  You might need to
> power the panel and backlight in very specific sequences, for
> instance.  I'm not sure it's always 100% possible in all embedded
> designs to read the EDID before you know how the sequencing should
> work (but, of course, I'm a NOOB).

It doesn't really matter whether you can access EDID or not, because
EDID contains absolutely nothing on the power sequences for the panel.
Even if it did, there'd be no way to relate that information to the
device tree binding phandles.

> 4. Reading the EDID can be slow.  If you happen to know all the info
> on the panel beforehand you can significantly speed up boot speed,
> notably how fast you can get something on the screen.

The motivation for potentially duplicating this information was not that
it's slow to read EDID, but that occasionally you might not be able to
access EDID. There could be a number of reasons why this might happen: a
device might end up with an erased or invalid EDID or the DDC used to
get at the EDID might be broken (I've been told that it's fairly common
for OEMs to not wire through the DDC wires in cables to reduce costs).

Thierry

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXXpjmAAoJEN0jrNd/PrOh+6gP/R8MdHRjGc3EAv6rGJgg8lKK
JHPRF3l/cZikF1rNutTTOFhEBzhwAuQ7HOxukzqHvAP5avO3bcIwKfsv3g7NMWAk
M9vHyTA5W8v2ul6cz81qR7JBxGGVuvGk+5+u/2mI5RgY4+TQPuj6MnUEi00tQO+T
vVko2BpdGqbPNqXu6mwIlXJkPoSio22zs5GqeU1TEMfAfNv/dro/u7QW18dTByzU
qH5ddqUBWygh2Uv4T6iiRzrksiuMKMa6/PWIIprm9ZsirOOn97EN9XYGwJ7wO4nq
aEZ5e9ogpj+5XbpZajc+w2v4qzf49zZ2oOrFiXQ5Fo9HOTkzwKi2x/3jeAwqno8x
FyZ+9eHx73xVkx3kcA8mlusa1nTqyJYNR1souYqMKW5czEnj2P/8eSkU6/Nz3L5d
LRTipNpi6FmCekl9BYZW+fs3HwNcSIE9qmwh28Yv4gqjSavkPsOSBlECI6LzTv4W
cUAPQJFqu5+SRAh71auVdY+reWw1OVsTG97xHXTZK9z0fR2fPHqVIYXFtZp0dlpX
cCih1pySDltkLSfZ6HZuf4x1my6VIj3uJd+ybriN6hBt74/2+FvIOS9Gc0GnDRMn
AncQ0kPlm4GQmvisFvj/qxjuQRWREMWwvGt8PBs2FhYlBeGumbaJEs/iZSafQXxd
tAG6G7cVyn7SOuWFGQ1M
=Bo05
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--

--===============0525722575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0525722575==--
