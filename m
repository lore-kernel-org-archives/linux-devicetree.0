From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Tue, 7 Feb 2017 12:38:35 +0100
Message-ID: <20170207113835.GF29507@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec>
 <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
 <20170206110847.GH27607@ulmo.ba.sec>
 <20170206155303.2fwihmlh6ln4eskt@phenom.ffwll.local>
 <95beedf6-4414-4ec2-5b5d-c17497c7bbe0@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1083141813=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <95beedf6-4414-4ec2-5b5d-c17497c7bbe0@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1083141813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 11:11:27PM +0100, Noralf Tr=C3=B8nnes wrote:
>=20
> Den 06.02.2017 16.53, skrev Daniel Vetter:
> > On Mon, Feb 06, 2017 at 12:08:47PM +0100, Thierry Reding wrote:
> > > On Mon, Feb 06, 2017 at 11:07:42AM +0100, Daniel Vetter wrote:
> > > > On Mon, Feb 6, 2017 at 10:35 AM, Thierry Reding <thierry.reding@gma=
il.com>
> > > > wrote:
> > > >=20
> > > > > > > > +EXPORT_SYMBOL(tinydrm_disable_backlight);
> > > > > > > > +#endif
> > > > > > > These look like they really should be part of the backlight s=
ubsystem.
> > > > > I
> > > > > > > don't see anything DRM specific about them. Well, except for =
the error
> > > > > > > messages.
> > > > > > So this is a bit an unpopular opinion with some folks, but I do=
n't
> > > > > require
> > > > > > anyone to submit new code to subsystems outside of drm for new =
drivers.
> > > > > > Simply because it takes months to get stuff landed, and in gene=
ral it's
> > > > > > not worth the trouble.
> > > > > "Not worth the trouble" is very subjective. If you look at the Li=
nux
> > > > > kernel in general, one of the reasons why it works so well is bec=
ause
> > > > > the changes we make apply to the kernel as a whole. Yes, sometime=
s that
> > > > > makes things more difficult and time-consuming, but it also means=
 that
> > > > > the end result will be much more widely usable and therefore bene=
fits
> > > > > everyone else in return. In my opinion that's a large part of why=
 the
> > > > > kernel is so successful.
> > > > >=20
> > > > > > We have piles of stuff in drm and drm drivers that should be in=
 core but
> > > > > > isn't.
> > > > > >=20
> > > > > > Imo the only reasonable way is to merge as-is, then follow-up w=
ith a
> > > > > patch
> > > > > > series to move the helper into the right subsystem. Most often
> > > > > > unfortunately that follow-up patch series will just die.
> > > > > Of course follow-up series die. That's because nobody cares to fo=
llow-up
> > > > > once their code has been merged.
> > > > >=20
> > > > > Collecting our own helpers or variants of subsystems is a great w=
ay of
> > > > > isolating ourselves from the rest of the community. I don't think=
 that's
> > > > > a good solution in the long run at all.
> > > > >=20
> > > > We have a bunch of patch series that we resubmit for months and the=
y go
> > > > exactly nowhere. They don't die because we stop caring, they die be=
cause
> > > > they die. Some of them we even need to constantly rebase and carry =
around
> > > > in drm-tip since our CI would Oops or spew WARNIGs all over the pla=
ce.
> > > > There's simply some areas of the kernel which seem overloaded under=
 patches
> > > > and no one is willing or able to fix things, and I can't fix the en=
tire
> > > > kernel. Nor expect contributors (who have much less political weigh=
t to
> > > > throw around than me) to do that and succeed. And we don't end up w=
ith
> > > > worse code in the drm subsystem, since we can still do the refactor=
ing
> > > > within drm helpers and end up with clean drivers.
> > > >=20
> > > > I fully agree that it's not great for the kernel's future, but when=
 I'm
> > > > stuck with the option to get shit done or burning out playing the
> > > > upstreaming game, the choice is easy. And in the end I care about o=
pen
> > > > source gfx much more than the kernel, and I think for open source g=
fx's
> > > > success it's crucial that we're welcoming to new contributors and d=
on't
> > > > throw up massive roadblocks. Open source gfx is tiny and still far =
away
> > > > from world domination, we need _lots_ more people. If that means ro=
uting
> > > > around other subsystems for them, I'm all for it.
> > > I can't say I fully agree with that sentiment. I do see how routing
> > > around subsystems can be useful occasionally. If nobody will merge the
> > > code, or if nobody cares, then by all means, let's make them DRM-
> > > specific helpers.
> > >=20
> > > But I think we need to at least try to do the right thing. If only to
> > > teach people what the right way is. If we start accepting such things
> > > by default, how can we expect contributors to even try?
> > >=20
> > > I also think that contributors will often end up contributing not only
> > > to DRM but to the kernel as a whole. As such it should be part of our
> > > mentoring to teach them about how the process works as a rule, even if
> > > the occasional exception is necessary to get things done.
> > >=20
> > > In this particular case, I know for a fact that both backlight and SPI
> > > maintainers are very responsive, so that's not a good excuse.
> > I definitely don't want that we don't attempt this. But brought from ye=
ars
> > of experience, I recommend to merge first (with pre-refactoring already
> > applied, but helpers only extracted, not yet at the right spot), and th=
en
> > follow up with. Because on average, there's way too many trees with
> > overloaded maintainers who maybe look at your patch once per kernel
> > release cycle.
> >=20
> > If you know that backlight and spi isn't one of these areas (anything t=
hat
> > goes through takashi/sound is a similar good experience for us on the i=
915
> > side), then I guess we can try. But then Noralf has already written a f=
ew
> > months worth of really great refactoring, and I'm seriously starting to
> > feel guilty for volunteering him for all of this. Even though he seems =
to
> > be really good at it, and seems to not mind, it's getting a bit silly.
> > Given that I'd say up to Noralf.
> >=20
> > In short, there's always a balance.
>=20
> Yes, it's a balance between the perfect and not's so perfect,
> the professinal and the amateur, and the drm expert and the newbie.

I may have come across as a bit rough. You've been doing great work,
there's no doubt about that. I was merely raising this issue because I
think it's something that we need to keep an eye out for. We don't want
to end up in a situation where we duplicate code or keep code to DRM
that would be useful outside of DRM.

The link that Rob pointed to is very insightful, and I think it's very
easy to loose touch with other parts of the kernel when you work on one
subsystem (almost) exclusively. It's completely normal, but because of
that I think it's all the more important that we remind ourselves to
look beyond our noses and refactor beyond just DRM where possible.

> If I knew how much time I would have to spend on tinydrm to get it
> merged, then I would never have started it. I wondered, a couple of
> months back, if I should just cut my losses and move to something else.
> dri-devel is a friendly place and I do get help to keep moving, but I
> get the feeling that drm is really a place for professionals that write
> kernel code 50 hours a week. And there's nothing wrong in that, drm is
> complex and maybe that kind of expertice and work-hours are needed to
> do work here.

I don't think that's true in general. If graphics, and especially the
lowlevel parts of it, is something that you're interested in, then
dri-devel is the perfect place for you. It doesn't matter if you work
on it in your spare time or on the day job.

It just so happens that most people end up working on it on the day job
because there's so much work to do that spare time isn't usually enough
to do all you want.

This is probably true for most of the other areas of the kernel, too.
It's not unusual for regular contributors to be offered a job to keep
doing what they do. That's probably why we have a higher degree of
professionalization in the kernel community as a whole. I don't think
that's a bad thing, quite the contrary, it's what we had all been
wishing for for a very long time. I can understand how that might be
frustrating to hobbyists at times, but I hope we're at least not making
things worse by actively discouraging hobbyists.

> It's not that I plan on backing out now, I'm just putting down a few
> words about the challenge it has been for me as a hobbyist to meet drm.
>=20
>=20
> As for the specifics,
>=20
> Backlight enable/disable helpers, I haven't thought about those as
> backlight subsystem helpers. But I see some drm panel drivers that do
> the same, so it makes sense.
> But what I'm feeling is this:
> If I'm expected to get everything right, then I will "never" get this
> merged.
> This thing by itself isn't much, but adding up every little thing
> amounts to a lot. And it's not just "make this patch", it's probably
> clean up the drivers as well :-)

Been there, done that. I think the problem that triggers the kind of
response that I gave is that it's often a handful of people that end up
doing the refactorings. Usually that handful of people is overloaded as
it is, so refactorings end up taking very long and are very tiring. The
easy way out, of course, is to require new patches to do the right thing
to begin with, because people are often motivated by the fact that they
will finally get their patch in. That's of course also a very good way
of discouraging contributions because it may be more than people set out
for.

Unfortunately I don't think there's a good solution for this. But, as
Daniel and Dave have already said, it shouldn't be a blocker for your
series. It'd be really nice if you somehow found the time to follow up,
though, after TinyDRM was merged.

> tinydrm_spi_transfer() can print the content of the buffer. This is
> important at least until I have seen some real use of the drivers.
> I have emulation code for handling bit widths not supported by the SPI
> controller, so I want to see what goes over the wire. SPI core uses
> trace events to track what's going on, and I don't think I can get
> buffer dumping into that code.

I know Mark is a very reasonable person, so I think it can't hurt to
try. Often people will end up rolling buffer dumping code of their own
and having something in the SPI core to do that, possibly hidden behind
a SPI_DEBUG_BUFFER Kconfig option or something like that, would save a
lot of people a lot of time.

Not sure if it would help, but if you end up writing such a patch and
you Cc me when you post it, I'm going to ACK it.

> Don't get me wrong Thierry, I do appreciate that you take the time to
> look at the code. I'm just frustrated that it takes so long to get this
> right. I thought that all I needed now was a DT maintainer ack :-)

I think that's fine. You've done a great job so far and we can always
fine-tune later on.

Thierry

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZsbgACgkQ3SOs138+
s6FzXRAAte8sgiW0NBQE6t+OVLmrkqJ7JGwX8mrNMy2teIhpU9MxZm/csGJy4jgK
+8qnJzE5onEw2DwJeTz9uF3JmoRjHkAo8WqftVMjm1lrtOQ+jvhobIE0dRgftuos
tFPt+7Mc5HbZY4Xng69pltrPwQBLDL3AH3UeoPrfT0bQTQslDyOzAEPO/ycrWKmn
7TLTJvOE+D1swKj9q4BYHfM8q6hhBZYRWHrAQO5zrZVMZVSI4p6lGR/gVX0A/AOX
BmLFrDTW4vIvqbHNzIYAeJ4ITwyZ4BhsBbda2byVgCarzS1rMjAqkNkg5o1v1Mez
PaWYF+GpncdguMHCN3wQKme4v9YJ5QtZgvA58F4xwhIkmHBG/ZxujAsRfmq0i6+R
mKGBkNHOYIPLRRO2lCFQSsMbqfc5DZLrUM14++9E955NqGAg0qCBWCeiTR6ydgzy
XaQaIusZk6F49ClV7iILlOofXkzzg0dGUcdGBpvDgWZKwHk4xHLPaFNEKpAKIUzr
4XNwuCBc/SwQZgMhwssqgwOGEavreCOokL25brT7vD+BLKct6PHYZCBowPI7BwGn
qOZq/GdFSpQyz32lDX1bGlGemBOerT4PwAVeG8bAUyretFQ/d1nmTkp6vHoQ5W5M
jVIkvoEiijEWJUJ68buCo3p1gCadIJRsQfdWj5sZeqe5xsHHjvs=
=uKwk
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--

--===============1083141813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1083141813==--
