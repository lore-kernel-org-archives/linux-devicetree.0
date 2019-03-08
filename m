From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Support panel-dpi
Date: Fri, 8 Mar 2019 10:44:57 +0100
Message-ID: <20190308094457.GA22655@ulmo>
References: <20190307101030.3822-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0821003715=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190307101030.3822-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, eben@raspberrypi.org, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--===============0821003715==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 11:10:30AM +0100, Maxime Ripard wrote:
> The kernel has a device tree binding for panel-dpi which allows for the
> panel timings to be described in the device-tree, however it wasn't
> supported so far except in a (small) number of KMS drivers that had an
> ad-hoc solution for this (omapdrm for example).

I'm growing really tired of having to repeat these discussions...

As far as I can tell, this binding was never reviewed by device tree
maintainers, so I'm not sure whether there's concensus that this should
be proliferated. Adding Rob and the device tree mailing list for a wider
audience.

> Just like we've seen with panel-lvds, and even though the current dogma is
> to set the timings within the driver, having them in the device tree
> provides a number of benefits.

I don't think there was concensus on that. But Rob acked it, so I guess
he thought it was acceptable.

Rob, can we use this thread as an opportunity to write down some of the
rules regarding this? We've discussed this numerous times in the past
but there still doesn't seem to be concensus.

I know you're very tired of this as well, but perhaps we can bite the
bullet now and produce clear documentation and guidelines that we can
point people at (or put in an obvious location so that people find it
themselves) in the future, so that we don't have to keep having this
discussion.

Summarizing what our latest discussion on this was:

  * Generic compatible strings should typically be used as a fallback
    only. Exceptions could be made if there's a specific standard that
    is sufficiently strict to not require any quirks, and hence avoid
    the need for panel-specific compatible strings.

  * So in general device tree nodes for panels need to have a specific
    compatible string that uniquely identifies that panel. This is in
    line with existing practice for other devices and a good idea in
    general so that we can implement quirks if necessary.

  * Panel nodes can optionally also list a generic compatible string, in
    addition to the specific compatible string, that drivers could match
    to support devices which are not specifically supported yet but that
    may already work anyway.

    I'm not sure that's really practical. In the past we've seen that a
    panel can work fine on one board but break on another because the
    runtime execution timing is such that necessary delays in the power
    sequence are noticeable on one but not another. I also suspect that
    in some cases shortcuts were taken because things happened to work,
    even if perhaps there was intermittent garbage on the screen because
    the power sequence wasn't respected.

  * Mechanisms that probe information from a panel at runtime (such as
    EDID) are to see preferential treatment. In other words, if a DDC
    channel exists to a panel, the driver should parse video timings
    from the EDID.

One thing that's not clear to me is whether or not we want to allow
video timings to be specified in DT. I used to think that we didn't,
because the video timings are implied by the specific compatible string
(which we already determined is mandatory anyway), but the panel-lvds
bindings suggest that from a device tree perspective this would be fine?
I also notice that the panel-lvds doesn't make any provisions for power
sequences. The same is true for panel-dpi. Are both LVDS and DPI panels
always guaranteed not to need any specific power sequences?

If ultimately we decide that video timings in DT are okay, then how are
we going to reconcile that with existing bindings? By definition the
video timings would have to be optional, otherwise we'd be breaking ABI
for existing device trees. But if they are optional, then we're back to
square one, because we need to rely on the specific compatible string
to get the bindings if they aren't present in DT. And then having them
in DT is really just redundant. Except perhaps in order to support the
cases that Maxime described where you want to do some really fine tuning
to meet EMI requirements or some such.

> The first is that it allows third party users to enable a random panel
> without having to modify and recompile their kernel of choice. This might
> sound like what we're trying to avoid in the first place, but it
> significantly lowers the barrier of entry, both technical and practical.

I think you're exaggerating. Modifying the kernel and rebuilding it is
not significantly more difficult than doing the same for a DTB.

> Indeed, users might not have the knowledge on how to recompile and modify=
 a
> kernel by their own, or might not have any documentation on the panel
> itself which would prevent any inclusion.

If you don't have documentation, how are you going to know what the
video timings are? Or how will you know how to wire the board up to your
board, or what the power sequence is that you need to follow.

> But moderns systems also tend to move to mechanisms like secure boot which
> would prevent that kernel, provided that the kernel was able to do that,
> from running in the system, unless you would know how (and be able) to
> install custom keys into your system.
>=20
> While the DT itself might have the same constraints, mechanisms like the
> overlays allows to circumvent it.

I'm not sure secure boot is a very good argument. You usually see that
on closed devices, and those are not typically devices where you can go
and swap out the panel with another random one.

> Another thing that panel-dpi allows to address is EMC, where even though
> the timings described in the driver could be functional on the board and
> for the panel, it would be better to use another arbitrary frequency on a
> particular board to increase the spread of the EM emissions.

That's a valid point, and there have been proposals in the past to allow
timings to be overridden by DT to allow such fine tuning. I think such a
mechanism is generally fine, but it also implies that the video timings
in DT would be optional, so it usually doesn't give people what they
really want, which is to add support for arbitrary panels to the kernel.

I want to explain why I'm being so reluctant to merge support for this,
so that perhaps people better understand where this is coming from. If
we allow arbitrary panels to be supported in this way, we can get into a
situation where someone makes a device, upstreams support for it, using
video timings specified in DT without a specific compatible string for
the panel node and then burn that DTB into a ROM on the device and ship
it. Now consider what would happen if some time down the road we get a
bug report that the panel on that device no longer works. We've nicely
painted ourselves into a corner, because we can't tell people to fix the
DTB (it's in a ROM) and we can't add a quirk in the kernel because we
don't have a way of identifying the panel. So what do we tell them?
Tough luck?

The root cause here is that there are no standards and designers just do
whatever they want because somebody will somehow make things work. While
that may work fine for products where the OEM provides a custom kernel,
it's a maintenance nightmare for upstream. So I think we need to be more
strict in what we accept and perhaps even help shape some form of
standard that will avoid any of the common pitfalls we know about.

I'd be interested to know whether this problem exists on any of the
other architectures, because this seems to me to be specific to the ARM
ecosystem. There's a myriad of x86 systems out there that use panels, so
I wonder how we solve these problems for those, or whether they simply
don't exist there because people have put more thought into system
designs?

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyCOZYACgkQ3SOs138+
s6E6zA//fESw5mmoxpHoM5sq4prj4I9ezRxBQumwu8vYFPw/ay2Rscgw6obdwcXO
MvWM3W0J/I4fxsJbiMT8Y9on5B8pk1tt8yZZsChptZu4nSyoJnzB4a3wN6cdNzm8
/NX/im/MbCh8dXYs7/VH05hWwSv7UvE5fbXLoW5474k6vULA41Y8n6KJ5wskPhen
yDH+m0P8mYS3zG50IOAC5zFkdRUdrCYKKOyJPbyOh3b1fQTwZyIL8wfXpP+dJmlW
nB8gCNwfScbBrx8uPy3x74wRrovGtmGtiIC6n2QeeqmHy3t6xYSAFtmJfpGn7UIN
lzZUGyIZpvqFCDKqxPpVKXHpUGP+hpYedLFnTLEA7m6xfYWGtGlDi2gP6Azq4sed
28fu7QZzh7c4FQ/XRwhCChn3C7QWF7gAaZf0towgEL3rUL3TFdgve7VkJ5h2TUrq
RFcgjLT6bQSoZDj0npYUq0nifYpwv1BzN6d0PDLbqnitspY2tjUP1jeyggOK/t6J
FtLCQd4uqICn8vyBfNHkIN342/bTfrd94L94WN3g14nFdRGK7vbt3fBkgBSHdPqK
Kgoage48h1S+Sdksb+s54KMSStziVG+3l91oQ8Aliq4qc4myT18orZQIpYd8MK+N
WFX16eIF0VLLaAiUc4Qr/9hCxGIoWqZdl1RvfedYvlnvxws+XBc=
=Idow
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

--===============0821003715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0821003715==--
