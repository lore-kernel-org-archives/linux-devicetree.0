From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v2 5/5] simplefb: add clock handling code
Date: Mon, 6 Oct 2014 11:31:30 +0200
Message-ID: <20141006093130.GG4090@lukather>
References: <1412337125-14388-1-git-send-email-hdegoede@redhat.com>
 <1412337125-14388-6-git-send-email-hdegoede@redhat.com>
 <20141006085536.GD4090@lukather>
 <54325CD0.1000308@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBRWEZGQQKGQEDEHAJ5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54325CD0.1000308-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 11:11:44AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 10/06/2014 10:55 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Oct 03, 2014 at 01:52:05PM +0200, Hans de Goede wrote:
> >> From: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
> >>
> >> This claims and enables clocks listed in the simple framebuffer dt nod=
e.
> >> This is needed so that the display engine, in case the required clocks
> >> are known by the kernel code and are described in the dt, will remain
> >> properly enabled.
> >>
> >> Signed-off-by: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
> >> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: drop dev_err on kzalloc failure]
> >> Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  drivers/video/fbdev/simplefb.c | 100 ++++++++++++++++++++++++++++++++=
++++++++-
> >>  1 file changed, 98 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simp=
lefb.c
> >> index b7d5c08..f329cc1 100644
> >> --- a/drivers/video/fbdev/simplefb.c
> >> +++ b/drivers/video/fbdev/simplefb.c
> >> @@ -26,6 +26,7 @@
> >>  #include <linux/module.h>
> >>  #include <linux/platform_data/simplefb.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/clk-provider.h>
> >> =20
> >>  static struct fb_fix_screeninfo simplefb_fix =3D {
> >>  	.id		=3D "simple",
> >> @@ -165,8 +166,98 @@ static int simplefb_parse_pd(struct platform_devi=
ce *pdev,
> >>  	return 0;
> >>  }
> >> =20
> >> +/*
> >> + * Clock handling code.
> >> + *
> >> + * Here we handle the clocks property of our "simple-framebuffer" dt =
node.
> >> + * This is necessary so that we can make sure that any clocks needed =
by
> >> + * the display engine that the bootloader set up for us (and for whic=
h it
> >> + * provided a simplefb dt node), stay up, for the life of the simplefb
> >> + * driver.
> >> + *
> >> + * When the driver unloads, we cleanly disable, and then release the =
clocks.
> >> + */
> >> +struct simplefb_clock {
> >> +	struct list_head list;
> >> +	struct clk *clock;
> >> +};
> >> +
> >> +/*
> >> + * We only complain about errors here, no action is taken as the most=
 likely
> >> + * error can only happen due to a mismatch between the bootloader whi=
ch set
> >> + * up simplefb, and the clock definitions in the device tree. Chances=
 are
> >> + * that there are no adverse effects, and if there are, a clean teard=
own of
> >> + * the fb probe will not help us much either. So just complain and ca=
rry on,
> >> + * and hope that the user actually gets a working fb at the end of th=
ings.
> >> + */
> >> +static void
> >> +simplefb_clocks_init(struct platform_device *pdev, struct list_head *=
list)
> >> +{
> >> +	struct device_node *np =3D pdev->dev.of_node;
> >> +	int clock_count, i;
> >> +
> >> +	INIT_LIST_HEAD(list);
> >> +
> >> +	if (dev_get_platdata(&pdev->dev) || !np)
> >> +		return;
> >> +
> >> +	clock_count =3D of_clk_get_parent_count(np);
> >=20
> > This looks like it does what you expect, but its name and the fact
> > that it's in the clk-provider.h file makes me wonder if you're not
> > using the wrong side of the abstraction.
>=20
> I'll check to see if there is something better, assuming Luc does not
> beat me to it.
>=20
> >=20
> >> +	for (i =3D 0; i < clock_count; i++) {
> >> +		struct simplefb_clock *entry;
> >> +		struct clk *clock =3D of_clk_get(np, i);
> >=20
> > devm_clk_get?
>=20
> Yes that would be better.
>=20
> >> +		int ret;
> >> +
> >> +		if (IS_ERR(clock)) {
> >> +			dev_err(&pdev->dev, "%s: clock %d not found: %ld\n",
> >> +			       __func__, i, PTR_ERR(clock));
> >> +			continue;
> >> +		}
> >> +
> >> +		ret =3D clk_prepare_enable(clock);
> >> +		if (ret) {
> >> +			dev_err(&pdev->dev,
> >> +				"%s: failed to enable clock %d: %d\n",
> >> +			       __func__, i, ret);
> >> +			clk_put(clock);
> >> +			continue;
> >> +		}
> >> +
> >> +		entry =3D kzalloc(sizeof(struct simplefb_clock), GFP_KERNEL);
> >> +		if (!entry) {
> >> +			clk_disable_unprepare(clock);
> >> +			clk_put(clock);
> >> +			continue;
> >> +		}
> >> +
> >> +		entry->clock =3D clock;
> >> +		/*
> >> +		 * add to the front of the list, so we disable clocks in the
> >> +		 * correct order.
> >> +		 */
> >> +		list_add(&entry->list, list);
> >=20
> > I really don't think this whole list dance is necessary, especially
> > after reading this comment.=20
>=20
> So you're suggesting to just make this an array, with say 5 entries,
> or ... ?

Maybe something smarter, like a kmalloc'd array with the number of
clocks needed?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUMmFyAAoJEBx+YmzsjxAgU00P/RTBhhS5hPn9gDyhlCc0sIoI
jHk4Dl29lNXwbJfhSvbhtu7Z/xGEWkyF1IH1FxZDPwQ5yYSIToU/H7NN0M2HeabS
EmvCmumjI062li52PgsJ98atNFN/XMZhDl2X1hHBXuy1iacjD49x+5WJuVEsO2/h
WOwy62stZFdkox2Oqo61eGqCw08GuSIEab7WHZ4ErNspGdLleg5NADMU2ycwmCMe
pdGHFvnRmj6Uq6QusZdiNDFnT4sx0m/U1LSwJFkN13lSW+VbQu+Lw27yRciIK5dF
DSZEPEhyzy5rj1LvOF4MoFqd23ld//X2GFT5E2c0jhq0ki84vVlCBNdfz3tNzwhu
AyppA4YS3QXW+iTbt7VxTLHayMI0OwO3zCT/mQ/rkkahdu8ZaNUX+JtQgHczr6+4
IdsDwACpE61yQoRWWBLAE8l78UeId/KVrVpShXMZqvhvA6DUD8vJnkjs7Z5hUUZy
uwsN9MohgoKnzOTXld9XtJa6ygcwexv0ZJuVE0f9M2Y579hXaBUWcipmibto2NNf
KbVbkc0jCIvr06m2prcd2o6D/p3oGdO16DZQWGUyXs5mv3P9h+XLhIg5Z/c5DjHo
vpZFJE/Ed/6KnUaQjK/sC39PPuR8hs9ZDFczTNY7k2HoYqN6kSJcYgI43fcrkFYx
xb1++Luj4ujYSUbRfiQv
=rrIz
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
