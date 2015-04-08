From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 8 Apr 2015 11:43:49 +0200
Message-ID: <20150408094349.GC26727@lukather>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
 <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150408081450.GB5162@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones wrote:
> > > +
> > > +		    This property is not to be abused.  It is only to be used to
> > > +		    protect platforms from being crippled by gated clocks, not
> > > +		    as a convenience function to avoid using the framework
> > > +		    correctly inside device drivers.
> >=20
> > Disregarding what's stated here, I'm pretty sure that this will
> > actually happen. Where do you place the cursor?
>=20
> That's up to Mike.

Except that Mike won't review any of the DT changes, so he won't be
able to refrain users from using it. Let alone out-of-tree DTs using a
mainline kernel.

> > Should we create a new driver for our RAM controller, or do we want to
> > use clock-always-on?
>=20
> I would say that if all the driver did was to enable clocks, then you
> should use this instead.  This binding was designed specifically for
> that purpose.
>=20
> However, if the aforementioned driver clock can be safely gated, then
> it should not be an always-on clock.

Yeah, of course, I understand the original intent of it, but that
argument, which might very well be true at one point in time, might
not be true anymore two or three releases later.

And that driver might actually rely on the fact that the clock is shut
down, which won't be the case.

Introducing a DT interface solely by refering to the current state of
a driver is a bit odd.

> > Do we really want to enforce this if we ever gain a driver that would
> > actually be able to manage its clock (like do we want the CPU clock to
> > never *ever* be gated just because we don't have a cpuidle/hotplug
> > driver yet?)
>=20
> As I've just mentioned, if a clock 'can' be turned off, this binding
> should never be used. Situations where using always-on as a stop-gap
> due to a lack of current functionality is what the paragraph above is
> trying to mitigate.

But it's not really what this property is about. What this property
describes is that these clocks should never be gated. Any point in
time during the life of the system AND with in any kernel version.

> > Have you seen the numerous NAK on such approach Mike did?
>=20
> I haven't, but the folks reviewing previous versions have.  Do you
> have something specific in mind that you'd like to bring to my
> attention?

Unfortunately, I haven't been able to dig out such mails. But it's why
we ended up with clock protection code in various clock drivers
including:

AT91: http://lxr.free-electrons.com/source/drivers/clk/at91/clk-slow.c#L484
iMX28: http://lxr.free-electrons.com/source/drivers/clk/mxs/clk-imx28.c#L154
Rockchip: http://lxr.free-electrons.com/source/drivers/clk/rockchip/clk.c#L=
320
sunXi: http://lxr.free-electrons.com/source/drivers/clk/sunxi/clk-sunxi.c#L=
1183
Zynq: http://lxr.free-electrons.com/source/drivers/clk/zynq/clkc.c#L504

Which is much more flexible, since you won't have to modify the DT to
change which clocks are to be left enabled, as well as way easier to
debug if you ever have to remove that property from the DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJVJPhVAAoJEBx+YmzsjxAg5PQP+IrT2/h7/h49qN/tVsLUTTlj
zxZUw6mizLLC0P16N03j7+R7rkMK4WxQMVZj+e4Te/P+nDG9cCJzYPbMKHyZ920E
8lO7KVwKXMz5+G1Q/Ot+EC/pkhiBSLa9fcypZ/NJIq8d3MnsGakYQS8rgavJpQNf
go43PY0xcfFs00hBg/rV2uZHFXfhLc6THpakKf+qD3MzpTc0BIUIIKe6009+iOJ7
50iri2Ua39v6g/AlgMAhuRj3OYra/b5w8WF86IzjlV1xGmdTZem/4KAE2bUADwxP
jmDVpNkKx85U2K5zEZ/ojzFOgtGVFqYkkzMKHWywC85wCQG9dK70zO4aYuIW5RwB
oj5AFHB9YHCpmzYiSJVA26Sg0hv16ykQ5e4jOOZmDgVGzIY/s/Ltk581TBxyjon/
Q3E+yjhIcX40wEz6ORmM8oJji2BLvfjji8nkgJ+MFHR0cEcUgJJ9QGHu2RHCMFVX
+fnl7m07NVOCzeU23XPVfqYV5x22oew5WZHDr5aP5c7wZkoUopAACLp1gIpaL5MQ
eDObwxpccJUTmLKwTRvbeOnav2KAPcNzOgczgTChWgH3yXWmOw/u7F30P4anqeSl
2amnNECVsYAp1xjlzQLqtt9iJebPpnuy4PlrUCc+9AGrE8MVcI1Qpky/xv5R+QSu
e1ky8zWzZ8BTQpfU3jo=
=rs4F
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
