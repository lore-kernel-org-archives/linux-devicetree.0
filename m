From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 2/5] drm/bridge: Add RGB to VGA bridge support
Date: Fri, 7 Oct 2016 11:14:44 +0200
Message-ID: <20161007091444.GO4684@lukather>
References: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
 <5319260.UeCnJXKVPe@avalon>
 <CAOw6vbLC=HnnpuaxFf8EzSTmuYoZd-r1aqx-ixja97Ht_U6S6Q@mail.gmail.com>
 <1757833.hOePAQC2sg@avalon>
 <f39e907c-424f-7572-f88e-5dd0b6009631@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342234647=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f39e907c-424f-7572-f88e-5dd0b6009631@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1342234647==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0PSjARDFl/vfYT5"
Content-Disposition: inline


--f0PSjARDFl/vfYT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2016 at 10:27:31AM +0530, Archit Taneja wrote:
>=20
>=20
> On 10/07/2016 02:34 AM, Laurent Pinchart wrote:
> >Hi Sean,
> >
> >On Thursday 06 Oct 2016 15:53:28 Sean Paul wrote:
> >>On Thu, Oct 6, 2016 at 1:27 PM, Laurent Pinchart wrote:
> >>>On Thursday 06 Oct 2016 17:09:57 Archit Taneja wrote:
> >>>>On 10/06/2016 12:51 PM, Maxime Ripard wrote:
> >>>>>On Mon, Oct 03, 2016 at 04:40:57PM +0530, Archit Taneja wrote:
> >>>>>>On 09/30/2016 08:07 PM, Maxime Ripard wrote:
> >>>>>>>Some boards have an entirely passive RGB to VGA bridge, based on
> >>>>>>>either DACs or resistor ladders.
> >>>>>>>
> >>>>>>>Those might or might not have an i2c bus routed to the VGA connect=
or
> >>>>>>>in order to access the screen EDIDs.
> >>>>>>>
> >>>>>>>Add a bridge that doesn't do anything but expose the modes availab=
le
> >>>>>>>on the screen, either based on the EDIDs if available, or based on
> >>>>>>>the XGA standards.
> >>>>>>>
> >>>>>>>Acked-by: Rob Herring <robh@kernel.org>
> >>>>>>>Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>>>>>>---
> >>>>>>>.../bindings/display/bridge/rgb-to-vga-bridge.txt  |  48 +++++
> >>>>>>>drivers/gpu/drm/bridge/Kconfig                     |   7 +
> >>>>>>>drivers/gpu/drm/bridge/Makefile                    |   1 +
> >>>>>>>drivers/gpu/drm/bridge/rgb-to-vga.c                | 229 +++++++++=
++++
> >>>>>>>4 files changed, 285 insertions(+)
> >>>>>>>create mode 100644
> >>>>>>>Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge=
=2Etx
> >>>>>>>t
> >>>>>>>create mode 100644 drivers/gpu/drm/bridge/rgb-to-vga.c
> >>>>>>>
> >>>>>>>diff --git
> >>>>>>>a/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-brid=
ge.
> >>>>>>>txt
> >>>>>>>b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-brid=
ge.
> >>>>>>>txt
> >>>>>>>new file mode 100644
> >>>>>>>index 000000000000..a8375bc1f9cb
> >>>>>>>--- /dev/null
> >>>>>>>+++
> >>>>>>>b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-brid=
ge.
> >>>>>>>tx
> >>>>>>>t @@ -0,0 +1,48 @@
> >>>>>>>+Dumb RGB to VGA bridge
> >>>>>>>+----------------------
> >>>>>>>+
> >>>>>>>+This binding is aimed for dumb RGB to VGA bridges that do not
> >>>>>>>require
> >>>>>>>+any configuration.
> >>>>>>>+
> >>>>>>>+Required properties:
> >>>>>>>+
> >>>>>>>+- compatible: Must be "rgb-to-vga-bridge"
> >>>>>>
> >>>>>>I'd talked to Laurent on IRC if he's okay with this. And I guess you
> >>>>>>to had discussed it during XDC too. He's suggested that it'd be bet=
ter
> >>>>>>to have the compatible string as "simple-vga-dac".
> >>>>>
> >>>>>I just wished this bikeshedding had taken place publicly and be
> >>>>>actually part of that discussion, but yeah, ok.
> >>>>
> >>>>Sorry about that. I'd pinged him for an Ack, the discussion went
> >>>>more than that :)
> >>>>
> >>>>>>Some of the reasons behind having this:
> >>>>>>
> >>>>>>- We don't need to specify "rgb" in the compatible string since most
> >>>>>>simple VGA DACs can only work with an RGB input.
> >>>>>
> >>>>>Ok.
> >>>>>
> >>>>>>- Also, with "dac" specified in the string, we don't need to
> >>>>>>specifically mention "bridge" in the string. Also, bridge is a drm
> >>>>>>specific term.
> >>>>>>
> >>>>>>- "simple" is considered because it's an unconfigurable bridge, and=
 it
> >>>>>>might be misleading for other VGA DACs to not use "vga-dac".
> >>>>>
> >>>>>All those "simple" bindings are just the biggest lie we ever
> >>>>>told. It's simple when you introduce it, and then grows into somethi=
ng
> >>>>>much more complicated than a non-simple implementation.
> >>>>
> >>>>"simple" here is supposed to mean that it's an unconfigurable RGB to
> >>>>VGA DAC. This isn't supposed to follow the simple-panel model, where
> >>>>you add the "simple-panel" string in the compatible node, along with
> >>>>you chip specific compatible string.
> >>>
> >>>I agree with Maxime, I don't like the word "simple". My preference wou=
ld
> >>>be "vga-dac" for a lack of a better qualifier than "simple" to describe
> >>>the fact that the device requires no configuration. My only concern wi=
th
> >>>"vga-dac" is that we would restrict usage of that compatible string fo=
r a
> >>>subset of VGA DACs, with more complex devices not being compatible with
> >>>"vga-dac" even though they are VGA DACs. That's a problem I can live w=
ith
> >>>though.
> >>
> >>While we're bikeshedding (feel free to ignore my input on this), I
> >>think Maxime's initial "dumb" qualifier was better than "simple".
> >
> >I think I agree.
> >
> >>I think "passive" also gets the point across better than "simple", which
> >>we've already established as something else in drm.
> >
> >To my electrical engineer's ear, passive refers to a component or combin=
ation
> >of components that is not capable of power gain. The resistors ladder VG=
A DAC
> >that Maxime is trying to support is a passive system, but the ADV7123 VG=
A DAC
> >that equally requires no configuration is an active component.
>=20
> If no one has any more objections within the next day, I'll pull in
> Maxime's v5 RGB to VGA bridge driver, and change the compatible to
> "dumb-vga-dac".

That works for me. You'll probably want to update the Kconfig and file
name to match though.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f0PSjARDFl/vfYT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX92eEAAoJEBx+YmzsjxAgJqQP/0A1+f/CXjKS3V2Ajya1rjf4
wSMofL8I/kDl67Qr22eTvk+O4Ppd1ozlrQPK2mWAj4MMDUcR22xb9EzgVyi3wNoP
fRwgSiT0Q1e1+71e+JP3DrvCggsUodN97XE7pG23IyMal6i7HWjZDlbyVDgU+Sta
0IGNFZMzvNcf+MFWX380XHdKGwC1OMqc9ZAwNTHj8sJQ0omo7F3SUwEnKnWN8WkG
3ICmEZEXkdKJywJNTGHqvp/GbIVT35JczbOHpRTTQVzmBMO9TGsa1OwvPeRzRyrs
aZzkivEM2eKva7D1c1TtIYn0glTqe5utdi+RtIKW9xw3PWrgGMCxlWXJj+N3kNn4
vEGaTQ/ObUnmWy/vWdkLxXzD196bPpyoVQCJNwC8k7QD4/edIuWarRHLF1VsnIob
h6A0A46csi997iLg45Mg92GiP6YOC6ucXINhWdNrZw5N2QEg8URAzncTDofirLcz
7vH8Q5rtULu0QiEe0Mv3x54XaA5J2MwXI3QltXglACHBpz7x36gpqjhPDWBIXF0p
WFlm43qnGms/PbfdfAo2kD0LkLq54xCdNCKPExjJsEpH5dDbX0jGuotN7gt4f6nb
SXiu3GsD9FqUt/tr+C28Z27k1hnwzguwcEHQ69Z1YoXWuXVR/axhbN8JHAKpUVoE
+RF9xWdIEgfoRxQU/h+a
=VQvu
-----END PGP SIGNATURE-----

--f0PSjARDFl/vfYT5--

--===============1342234647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1342234647==--
