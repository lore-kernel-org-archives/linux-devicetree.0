From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Support panel-dpi
Date: Fri, 8 Mar 2019 15:11:37 +0100
Message-ID: <20190308141137.GB2559@ulmo>
References: <20190307101030.3822-1-maxime.ripard@bootlin.com>
 <20190308094457.GA22655@ulmo>
 <20190308111430.GB4802@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0926981939=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190308111430.GB4802@pendragon.ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--===============0926981939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2019 at 01:14:30PM +0200, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> On Fri, Mar 08, 2019 at 10:44:57AM +0100, Thierry Reding wrote:
> > On Thu, Mar 07, 2019 at 11:10:30AM +0100, Maxime Ripard wrote:
> > > The kernel has a device tree binding for panel-dpi which allows for t=
he
> > > panel timings to be described in the device-tree, however it wasn't
> > > supported so far except in a (small) number of KMS drivers that had an
> > > ad-hoc solution for this (omapdrm for example).
> >=20
> > I'm growing really tired of having to repeat these discussions...
> >=20
> > As far as I can tell, this binding was never reviewed by device tree
> > maintainers, so I'm not sure whether there's concensus that this should
> > be proliferated. Adding Rob and the device tree mailing list for a wider
> > audience.
>=20
> The history indeed shows a less than ideal situation. I don't want or
> plan to use omapdrm as a precedent to push for this, but as part of an
> effort to remove the omapdrm-specific panel-dpi driver, I'm trying to
> find a solution. I added support to the panel-simple driver for one
> particular panel used by one particular OMAP board in order to port it
> away from the omapdrm-specific panel code, but that will have a hard
> time scaling. I'm thus interested in the outcome of this discussion.
>=20
> > > Just like we've seen with panel-lvds, and even though the current dog=
ma is
> > > to set the timings within the driver, having them in the device tree
> > > provides a number of benefits.
> >=20
> > I don't think there was concensus on that. But Rob acked it, so I guess
> > he thought it was acceptable.
> >=20
> > Rob, can we use this thread as an opportunity to write down some of the
> > rules regarding this? We've discussed this numerous times in the past
> > but there still doesn't seem to be concensus.
>=20
> That's a good idea, thank you for proposing it. Let's try to reach an
> agreement and document it to avoid repeating the same story in 6 months.
>=20
> > I know you're very tired of this as well, but perhaps we can bite the
> > bullet now and produce clear documentation and guidelines that we can
> > point people at (or put in an obvious location so that people find it
> > themselves) in the future, so that we don't have to keep having this
> > discussion.
> >=20
> > Summarizing what our latest discussion on this was:
> >=20
> >   * Generic compatible strings should typically be used as a fallback
> >     only. Exceptions could be made if there's a specific standard that
> >     is sufficiently strict to not require any quirks, and hence avoid
> >     the need for panel-specific compatible strings.
> >=20
> >   * So in general device tree nodes for panels need to have a specific
> >     compatible string that uniquely identifies that panel. This is in
> >     line with existing practice for other devices and a good idea in
> >     general so that we can implement quirks if necessary.
> >=20
> >   * Panel nodes can optionally also list a generic compatible string, in
> >     addition to the specific compatible string, that drivers could match
> >     to support devices which are not specifically supported yet but that
> >     may already work anyway.
> >=20
> >     I'm not sure that's really practical. In the past we've seen that a
> >     panel can work fine on one board but break on another because the
> >     runtime execution timing is such that necessary delays in the power
> >     sequence are noticeable on one but not another. I also suspect that
> >     in some cases shortcuts were taken because things happened to work,
> >     even if perhaps there was intermittent garbage on the screen because
> >     the power sequence wasn't respected.
>=20
> I'd say most cases instead of some cases :-) We have lots of panels for
> which no public datasheet is available, and the timings added to
> panel-simple were just copied from random device tree sources part of
> obscure BSPs. It's then hard to do better than "if it works, ship it"
> :-(

But that's precisely one of the problems with panels. People think that
they are just really simple things that you connect and that if you feed
them a signal with the right timing that they will just work. But it's
actually much more difficult than that. If you look at the git history
of the simple panel driver, you'll notice that we've had to add a bunch
of information that it didn't have when we started out. These were all
things that we didn't need at first because they had been baked into the
designs and assumptions abounded. Then as panels started to be more
broadly used, additional parameters had to be introduced to account for
the differences between boards.

Imagine what a nightmare that would've been if we had only specified the
data in DT. There'd be all sorts of backwards-compatibility code that we
would have had to maintain forever.

And I'm talking the worst kinds of quirks, like matching on the
top-level compatible string to find out what board we're running on
(because we wouldn't have a more accurate way of identifying the panel)
and then adding quirks for that in SoC specific drivers so that they can
default to the right polarities and whatnot for that specific board.

> >   * Mechanisms that probe information from a panel at runtime (such as
> >     EDID) are to see preferential treatment. In other words, if a DDC
> >     channel exists to a panel, the driver should parse video timings
> >     from the EDID.
> >=20
> > One thing that's not clear to me is whether or not we want to allow
> > video timings to be specified in DT. I used to think that we didn't,
> > because the video timings are implied by the specific compatible string
> > (which we already determined is mandatory anyway), but the panel-lvds
> > bindings suggest that from a device tree perspective this would be fine?
> > I also notice that the panel-lvds doesn't make any provisions for power
> > sequences. The same is true for panel-dpi. Are both LVDS and DPI panels
> > always guaranteed not to need any specific power sequences?
>=20
> They're not, and if a power sequence is needed, we need custom code
> matching a specific compatible string.

I suspected as much. So it's not really different from simple-panel in
the end.

> > If ultimately we decide that video timings in DT are okay, then how are
> > we going to reconcile that with existing bindings? By definition the
> > video timings would have to be optional, otherwise we'd be breaking ABI
> > for existing device trees. But if they are optional, then we're back to
> > square one, because we need to rely on the specific compatible string
> > to get the bindings if they aren't present in DT. And then having them
> > in DT is really just redundant. Except perhaps in order to support the
> > cases that Maxime described where you want to do some really fine tuning
> > to meet EMI requirements or some such.
> >=20
> > > The first is that it allows third party users to enable a random panel
> > > without having to modify and recompile their kernel of choice. This m=
ight
> > > sound like what we're trying to avoid in the first place, but it
> > > significantly lowers the barrier of entry, both technical and practic=
al.
> >=20
> > I think you're exaggerating. Modifying the kernel and rebuilding it is
> > not significantly more difficult than doing the same for a DTB.
> >=20
> > > Indeed, users might not have the knowledge on how to recompile and mo=
dify a
> > > kernel by their own, or might not have any documentation on the panel
> > > itself which would prevent any inclusion.
> >=20
> > If you don't have documentation, how are you going to know what the
> > video timings are? Or how will you know how to wire the board up to your
> > board, or what the power sequence is that you need to follow.
>=20
> As explained above, we often get them from random device tree sources,
> or possibly random forks of panel-simple in BSPs. Those will contain a
> particular timing that happens to work with the system at hand. Adding
> them to panel-simple isn't very difficult, but when a different system
> will try to use the same panel, it may find out that the timings then
> available in panel-simple don't work, because the two systems require
> different timings both within the range of timings suppported by the
> panel. Patching the timings in panel-simple with the values obtained
> from the BSP for the second system will solve the problem, but
> potentially break the first system.

We do have a mechanism of dealing with this. simple-panel can take video
timings instead of a display mode. Video timings are basically a
transcript of the (minimum, typical, maximum) values that you typically
see tabulated in datasheets.

Using these timings a display driver should be free to adjust values in
whatever way it deems necessary to meet its limitations. Don't support a
front porch less than 5? Fix it to 5, or any other convenient value, and
adjust other parameters within their ranges to find a combination that
works.

> The problem really stems from the fact that documentation is missing.
> Moving timings to DT is a way to work around that, but it clearly more a
> workaround than a solution for this specific issue. The question is if
> we can find a better solution, or a better workaround.

We're certainly not going to get a better solution if we simply accept
the status quo. What I want to see is people taking this more seriously
and think about panels the same way they think about other components in
the system. Panels really aren't special.

> > > But moderns systems also tend to move to mechanisms like secure boot =
which
> > > would prevent that kernel, provided that the kernel was able to do th=
at,
> > > from running in the system, unless you would know how (and be able) to
> > > install custom keys into your system.
> > >=20
> > > While the DT itself might have the same constraints, mechanisms like =
the
> > > overlays allows to circumvent it.
> >=20
> > I'm not sure secure boot is a very good argument. You usually see that
> > on closed devices, and those are not typically devices where you can go
> > and swap out the panel with another random one.
> >=20
> > > Another thing that panel-dpi allows to address is EMC, where even tho=
ugh
> > > the timings described in the driver could be functional on the board =
and
> > > for the panel, it would be better to use another arbitrary frequency =
on a
> > > particular board to increase the spread of the EM emissions.
> >=20
> > That's a valid point, and there have been proposals in the past to allow
> > timings to be overridden by DT to allow such fine tuning. I think such a
> > mechanism is generally fine, but it also implies that the video timings
> > in DT would be optional, so it usually doesn't give people what they
> > really want, which is to add support for arbitrary panels to the kernel.
>=20
> I think we need such a mechanism. We may not need a full override
> though, possibly just a restricted range of pixel clock frequencies. I
> can't tell yet what would be needed exactly, but EMC is a valid concern,
> and we had to add explicit pixel clock frequencies for cameras in DTs
> for this reason. Let's keep this in mind in our design.

We already have that with video timings. They allow you to specify a
valid range for the pixel clock frequency and any of the other
parameters. Display drivers can then use this to adjust timings as they
deem necessary to match their restrictions.

> > I want to explain why I'm being so reluctant to merge support for this,
> > so that perhaps people better understand where this is coming from. If
> > we allow arbitrary panels to be supported in this way, we can get into a
> > situation where someone makes a device, upstreams support for it, using
> > video timings specified in DT without a specific compatible string for
> > the panel node and then burn that DTB into a ROM on the device and ship
> > it. Now consider what would happen if some time down the road we get a
> > bug report that the panel on that device no longer works. We've nicely
> > painted ourselves into a corner, because we can't tell people to fix the
> > DTB (it's in a ROM) and we can't add a quirk in the kernel because we
> > don't have a way of identifying the panel. So what do we tell them?
> > Tough luck?
>=20
> Could the panel-simple (or panel-dpi) driver reject panels that have a
> single compatible string, forcing the DT author to add a specific one ?
> Of course that wouldn't prevent someone from writing
>=20
> 	/* Don't remove foo,bar or the driver will not work */
> 	compatible =3D "foo,bar", "panel-dpi";

I think Rob had some ideas of how to enforce this using DTC validation
so that it can be caught before this is merged.

> > The root cause here is that there are no standards and designers just do
> > whatever they want because somebody will somehow make things work. While
> > that may work fine for products where the OEM provides a custom kernel,
> > it's a maintenance nightmare for upstream. So I think we need to be more
> > strict in what we accept and perhaps even help shape some form of
> > standard that will avoid any of the common pitfalls we know about.
>=20
> I agree with you, but I would argue that having timings in C code can
> also becomes a maintenance nightmare when the same panel is used on
> multiple systems, as explained above.

I think that's mostly a matter of perspective. Yes, it's certainly more
complicated to make drivers derive a suitable set of video timings from
the ranges that a panel supports. However, blindly allowing device tree
to specify the timings doesn't give the kernel any way of validating
that the values even remotely make sense.

And I know I keep repeating myself, you need more than just video
timings to describe a panel.

> > I'd be interested to know whether this problem exists on any of the
> > other architectures, because this seems to me to be specific to the ARM
> > ecosystem. There's a myriad of x86 systems out there that use panels, so
> > I wonder how we solve these problems for those, or whether they simply
> > don't exist there because people have put more thought into system
> > designs?
>=20
> Aren't timings stored in ACPI, at least in some cases ?

I vaguely remember working on an Intel Atom based module where the LVDS
connector had DDC lines and the timings were parsed from the EDID, but I
suppose ACPI might be another way to store it. ACPI would also give you
a good way to encapsulate power sequences, which EDID doesn't give you.

I think x86 clearly has an edge here in terms of platform. There are
standard interfaces that allow you to hide these specifics. With device
tree we don't really have that. It's just too low-level. If we had a
standard (and complete) way of describing panels in DT, then we could
maybe achieve something similar, but attempts to do that have failed in
the past, so I don't have high hopes for DT being the solution in this
case.

Thierry

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyCeBYACgkQ3SOs138+
s6HKog//R4/rDe5MUwDGc12v6efiwiE0Mfq2L41Mqt+rHxGZaX1AmhcygiYgn4VH
Vhq+Nv1f+36RV3BYWZ9mcPlmML26uPQAlRqHM7vuITuhN6MgtcesUtyZarSOzsFC
Iwg03GF8xET39K/YiftilhsLOxfoT+bJap9PRufrhWUZBZ3De8/FhIMtSzQ3t2Jk
SolojUEs1DJzic/YV3A5FA72Jg9cYBx30DER6eDfcAgj1t97tdeQUXVFO/acOO79
5/foabEi5JQ4prqiH74QI0ryLD7nVXNbxbqjkuglybX9oKcyKYs5RafFqQ4JcJ8c
v0veLmJqR/Cr9e7RgMOTRMCGf8D0Y0GDIpkf6lKWV4liVLHkAlz8STxmbsVjr5ar
iNOslDiR0XSubmfGUcN/gP9WQlQbtq0rGkFVsvYDZfLALY+U6k2Skmv4pn6YX84k
fY/jeOc4K89FCFEofAVJGG+v1Sor3lgjVQLWJaF5NhDBG6FR+H4wxmzOweELh2bW
7M4fciaxxDisHkTzBquZjEflcSz9BN5fISPFdBEr1B0AjVYcjZuUyXtrwzsaC/g/
uRiBcbGQwSZCDNLlDkKQ+kiVK+x5FuwCPcRmyWxgPsiR+zBIhJSmiJeMSj8EDK54
qb9rXUbahlCKOW/PPTCl11qry5290e7ddzu344sS7ofh2cedh8E=
=quNW
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--

--===============0926981939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0926981939==--
