From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 8 Apr 2015 17:57:05 +0200
Message-ID: <20150408155705.GF26727@lukather>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
 <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150408103832.GG5162@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
List-Id: devicetree@vger.kernel.org


--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 11:38:32AM +0100, Lee Jones wrote:
> On Wed, 08 Apr 2015, Maxime Ripard wrote:
>=20
> > On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones wrote:
> > > > > +
> > > > > +		    This property is not to be abused.  It is only to be used =
to
> > > > > +		    protect platforms from being crippled by gated clocks, not
> > > > > +		    as a convenience function to avoid using the framework
> > > > > +		    correctly inside device drivers.
> > > >=20
> > > > Disregarding what's stated here, I'm pretty sure that this will
> > > > actually happen. Where do you place the cursor?
> > >=20
> > > That's up to Mike.
> >=20
> > Except that Mike won't review any of the DT changes, so he won't be
> > able to refrain users from using it. Let alone out-of-tree DTs using a
> > mainline kernel.
>=20
> Ideally Mike should be Cc'ed on patches using clock bindings, but if
> he isn't the DT guys are smart enough to either make the right
> decisions themselves (Rob has Acked these bindings already, so will be
> on the lookout for misuse, I'm sure), or ask for Mike's help.

Yeah, right, as if this strategy really worked in the past....

Do we really want to look at even the DT bindings that have actually
been reviewed by maintainers that got merged?

They don't have time for that, which is totally fine, but we really
should bury our head in the sand by actually thinking they will review
every single DT-related patch.

Using that as an argument is just plain denial of what really happened
for the past 4 years.

> > > > Should we create a new driver for our RAM controller, or do we want=
 to
> > > > use clock-always-on?
> > >=20
> > > I would say that if all the driver did was to enable clocks, then you
> > > should use this instead.  This binding was designed specifically for
> > > that purpose.
> > >=20
> > > However, if the aforementioned driver clock can be safely gated, then
> > > it should not be an always-on clock.
> >=20
> > Yeah, of course, I understand the original intent of it, but that
> > argument, which might very well be true at one point in time, might
> > not be true anymore two or three releases later.
>=20
> Why?  The H/W isn't going to change in two or three releases.  The
> clocks designated as 'always-on' will have to be on forever, or
> synonymously, 'always'.
>
> > And that driver might actually rely on the fact that the clock is shut
> > down, which won't be the case.
>=20
> I think you are missing the point of this binding.  The driver can
> never rely on that in this use-case.  If the clock is off, there is no
> device driver, period.=20

Ok. So CPU hotplug or cpuidle is not a thing then? I'm pretty sure the
PM guys will be happy to hear that.

And they are not device drivers, are not mandatory in the system, and
it's usually a good thing to keep the CPU running whenever you don't
have such drivers.

> > Introducing a DT interface solely by refering to the current state of
> > a driver is a bit odd.
>=20
> I'm not sure I get your point.  This binding has nothing to do with
> drivers.

It's all about drivers. Or rather all about missing drivers.

> > > > Do we really want to enforce this if we ever gain a driver that wou=
ld
> > > > actually be able to manage its clock (like do we want the CPU clock=
 to
> > > > never *ever* be gated just because we don't have a cpuidle/hotplug
> > > > driver yet?)
> > >=20
> > > As I've just mentioned, if a clock 'can' be turned off, this binding
> > > should never be used. Situations where using always-on as a stop-gap
> > > due to a lack of current functionality is what the paragraph above is
> > > trying to mitigate.
> >=20
> > But it's not really what this property is about. What this property
> > describes is that these clocks should never be gated. Any point in
> > time during the life of the system AND with in any kernel version.
>=20
> You got it, that's correct -- these clocks should never be gated.
>=20
> So why would that ever change?  If that is likely (or even possible)
> to change in the future then this binding should not be used.
>
> To reiterate; this binding should be used on ungatable clocks only.
> Non-negotiable, non-changeable either by the introduction of new
> functionality/support or kernel version.

I'm pretty sure that if that patch gets merged, by the end of the
year, there will be "incorrect" users by your standards.

If you introduce a feature, you should expect people to use
it.  If not, what's the point?

> > > > Have you seen the numerous NAK on such approach Mike did?
> > >=20
> > > I haven't, but the folks reviewing previous versions have.  Do you
> > > have something specific in mind that you'd like to bring to my
> > > attention?
> >=20
> > Unfortunately, I haven't been able to dig out such mails. But it's why
> > we ended up with clock protection code in various clock drivers
> > including:
> >=20
> > AT91: http://lxr.free-electrons.com/source/drivers/clk/at91/clk-slow.c#=
L484
> > iMX28: http://lxr.free-electrons.com/source/drivers/clk/mxs/clk-imx28.c=
#L154
> > Rockchip: http://lxr.free-electrons.com/source/drivers/clk/rockchip/clk=
=2Ec#L320
> > sunXi: http://lxr.free-electrons.com/source/drivers/clk/sunxi/clk-sunxi=
=2Ec#L1183
> > Zynq: http://lxr.free-electrons.com/source/drivers/clk/zynq/clkc.c#L504
> >=20
> > Which is much more flexible, since you won't have to modify the DT to
> > change which clocks are to be left enabled, as well as way easier to
> > debug if you ever have to remove that property from the DT.
>=20
> You're right, you don't have the change the DT in these cases.  You
> have to write new C code, which is _less_ flexible.

I'm sorry to learn that you never heard of that stable-DT thing.

And a bit sorry to see that a maintainer is really seeing C as not
flexible.

> So all these platforms are adding their own hand-rolled version of
> this binding, adding more duplication and cruft to the kernel.
> Instead they can use this 'always-on' and we can consolidate and strip
> it all out.

Except that all these platforms are actually not implementing a
binding, ie not an interface with the DT they are bound to. Each and
every of these platforms can change that list whenever they wish, just
by sending a single one-liner patch (just like the DT, really.).

Which is not something that you can achieve with a DT binding.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVJU/RAAoJEBx+YmzsjxAgzigQAJ7eGpqaHejKulggUIq82pdM
y6efseeW9qN4Z7ZiPOgmm3dZisMVZMDJtPq/iyUU1zqbDbrQkS/OG9jjYft1u5Ji
LixqaOoUZtIHOHVL2Yfvgy5g72htbz6AufKJ8PY4JUzch0+wKijPMLyoQV5tde9y
+OmAPg1tojOV0vM3ojb+/1kdu3kBmqu0yoVbjhqKgWjunVqxKJKvXy6V232joGCr
SRAVWFpbzYz+9yeubZbhInHI7110aRSnsmKnInW39MQlU3j6Ar7NPYy6JIZmnrhJ
BVM1LVFNhv7sAe1Em+DRAW9QkERMvLsLYPnRyFv6PjU9dArUV3ChdzdRbuO1p+2D
oBCZUiCwG67cFEawS+4SQZGdYVtpdYJ2f0s5igJmLSq42GORgEo+OtHWPdYGQY3Q
EWujnyzPFodV6c/8+S8a4CSFs37qpbsvtlb2nDPKb/0gGOpRGwhv+d1kgjx3wirf
YrOND3xIBOvykW7cKuL86GqSN7iUBqP+hDIEktucLlii0gl9SrzZwK+4Ta7rKVvG
JPh2gv24CAnawc+Ujtm3TfWXTLQiAeegc7LwqRpzUJOHi7VqiVdPGlVW/a/rkPAg
VjCU9mIyrwFTPdbcLEN8UMpEYDfGWmcVoDamI2fx0vuSQvd7jrFbBnXffRlAn0kU
BgyxBoJnCjobYbCJ95k2
=NDUo
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
