From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 2/5] drm/bridge: Add RGB to VGA bridge support
Date: Thu, 6 Oct 2016 09:21:06 +0200
Message-ID: <20161006072106.GA4684@lukather>
References: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
 <20160930143709.1388-3-maxime.ripard@free-electrons.com>
 <8795dc49-26f9-0505-f442-2ca74b51872f@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8795dc49-26f9-0505-f442-2ca74b51872f-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Archit,

On Mon, Oct 03, 2016 at 04:40:57PM +0530, Archit Taneja wrote:
> Hi Maxime,
>=20
> On 09/30/2016 08:07 PM, Maxime Ripard wrote:
> >Some boards have an entirely passive RGB to VGA bridge, based on either
> >DACs or resistor ladders.
> >
> >Those might or might not have an i2c bus routed to the VGA connector in
> >order to access the screen EDIDs.
> >
> >Add a bridge that doesn't do anything but expose the modes available on =
the
> >screen, either based on the EDIDs if available, or based on the XGA
> >standards.
> >
> >Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >---
> > .../bindings/display/bridge/rgb-to-vga-bridge.txt  |  48 +++++
> > drivers/gpu/drm/bridge/Kconfig                     |   7 +
> > drivers/gpu/drm/bridge/Makefile                    |   1 +
> > drivers/gpu/drm/bridge/rgb-to-vga.c                | 229 ++++++++++++++=
+++++++
> > 4 files changed, 285 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/display/bridge/rgb=
-to-vga-bridge.txt
> > create mode 100644 drivers/gpu/drm/bridge/rgb-to-vga.c
> >
> >diff --git a/Documentation/devicetree/bindings/display/bridge/rgb-to-vga=
-bridge.txt b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-b=
ridge.txt
> >new file mode 100644
> >index 000000000000..a8375bc1f9cb
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge=
=2Etxt
> >@@ -0,0 +1,48 @@
> >+Dumb RGB to VGA bridge
> >+----------------------
> >+
> >+This binding is aimed for dumb RGB to VGA bridges that do not require
> >+any configuration.
> >+
> >+Required properties:
> >+
> >+- compatible: Must be "rgb-to-vga-bridge"
>=20
> I'd talked to Laurent on IRC if he's okay with this. And I guess you to
> had discussed it during XDC too. He's suggested that it'd be better to
> have the compatible string as "simple-vga-dac".

I just wished this bikeshedding had taken place publicly and be
actually part of that discussion, but yeah, ok.

> Some of the reasons behind having this:
>=20
> - We don't need to specify "rgb" in the compatible string since most
> simple VGA DACs can only work with an RGB input.

Ok.

> - Also, with "dac" specified in the string, we don't need to
> specifically mention "bridge" in the string. Also, bridge is a drm
> specific term.
>
> - "simple" is considered because it's an unconfigurable bridge, and it
> might be misleading for other VGA DACs to not use "vga-dac".

All those "simple" bindings are just the biggest lie we ever
told. It's simple when you introduce it, and then grows into something
much more complicated than a non-simple implementation.

> What do you think about this? If you think it's good, would it be
> possible for you to change this? I guess it's okay for the rest of
> the patch to stay the same.

I'll update and respin the serie.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX9ftiAAoJEBx+YmzsjxAgsccP/j5G4H47nkizg7HQvLGyKD4j
nWbQtZCasiRgeNbJj03zPhrPcE+cyuu+11vaG+ILr2ldDqF0dxQAOEtF5sdzAqpy
lDLJUF50nAT7doM9SDj7UExUjCU1fMWwbrdpeEx81yOsFDBRJzYkvnojw42+DYCP
pjQHM9lNa+2RL11Cpjfj60CLmT/BWNGHP29LRMFsG8nrIKGOpUg2GbEBrwBP0Qus
JZsJWtSJqF55AmshSw6yvsp4oJYDo52HFWls/rmu8TTw2BThdnbXBne2CZG0lBwf
LX4l7JEYFF+HtSIYTHnO6pozdy9972LxC2if1M14YD3jot6Mn3n9z4TLaiBQG3LW
qc71NkPHFQoTbHHD09kRYu59M38jSphq3YwG3tsywpGIA2XQsIJ56SEClUmEP7d8
Oc9IO+lVrvoQY2bJCXtLtROIzf5YhumXF9tTfkq4NbPzo2hQscVHmO4oJCWC/N5U
PjRTN7VnWsVF4wmxMwpzcr3tQlPwPZOondgYft6jWLR7UN7LgS2lCJDoscE7QcC7
uHV0WZlWuTiW33nufO4M7m5V9gc+bLyPCfqoyF7suGRwd8pyS75Ga2fJPmR0JSrb
LH1Y8GP9TGXhDpa1USYbmyFJ0ppeDRFaHpLy1AF+IzxeoAvziDaM+Gzwhe9YQfLD
uTxS0CQ++BxA96S7+L+D
=HSc7
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
