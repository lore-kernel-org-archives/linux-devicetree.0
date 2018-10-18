From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 9/9] [DO NOT MERGE] drm/sun4i: rgb: Add 5%
 tolerance to dot clock frequency check
Date: Thu, 18 Oct 2018 20:50:15 +0800
Message-ID: <0c8e2417ec79b44d88a3054d0526bfc5abb364d6.camel@aosc.io>
References: <20181018073327.64942-1-icenowy@aosc.io>
	 <CAKMK7uFp2c=wqzPi096MTRB6Cdfacerkp6dM=fEqCAr99PQG9w@mail.gmail.com>
	 <20181018094258.oahlopafvm2udvoe@flea> <1585874.9P5eR8PMbl@avalon>
	 <20181018121819.gmup3jd7ukj52rvx@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBF4DULPAKGQE3RWMYOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181018121819.gmup3jd7ukj52rvx@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-10-18=E5=9B=9B=E7=9A=84 14:18 +0200=EF=BC=8CMaxime Ripard=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, Oct 18, 2018 at 02:31:01PM +0300, Laurent Pinchart wrote:
> > Hello,
> >=20
> > On Thursday, 18 October 2018 12:42:58 EEST Maxime Ripard wrote:
> > > On Thu, Oct 18, 2018 at 11:18:06AM +0200, Daniel Vetter wrote:
> > > > On Thu, Oct 18, 2018 at 10:55 AM Laurent Pinchart wrote:
> > > > > On Thursday, 18 October 2018 10:33:27 EEST Icenowy Zheng
> > > > > wrote:
> > > > > > From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > > > >=20
> > > > > > The panels shipped with Allwinner devices are very
> > > > > > "generic", i.e.
> > > > > > they do not have model numbers or reliable sources of
> > > > > > information
> > > > > > for the timings (that we know of) other than the fex files
> > > > > > shipped
> > > > > > on them. The dot clock frequency provided in the fex files
> > > > > > have all
> > > > > > been rounded to the nearest MHz, as that is the unit used
> > > > > > in them.
> > > > > >=20
> > > > > > We were using the simple panel "urt,umsh-8596md-t" as a
> > > > > > substitute
> > > > > > for the A13 Q8 tablets in the absence of a specific model
> > > > > > for what
> > > > > > may be many different but otherwise timing compatible
> > > > > > panels. This
> > > > > > was usable without any visual artifacts or side effects,
> > > > > > until the
> > > > > > dot clock rate check was added in commit bb43d40d7c83
> > > > > > ("drm/sun4i:
> > > > > > rgb: Validate the clock rate").
> > > > > >=20
> > > > > > The reason this check fails is because the dotclock
> > > > > > frequency for
> > > > > > this model is 33.26 MHz, which is not achievable with our
> > > > > > dot clock
> > > > > > hardware, and the rate returned by clk_round_rate deviates
> > > > > > slightly,
> > > > > > causing the driver to reject the display mode.
> > > > > >=20
> > > > > > The LCD panels have some tolerance on the dot clock
> > > > > > frequency, even
> > > > > > if it's not specified in their datasheets.
> > > > > >=20
> > > > > > This patch adds a 5% tolerence to the dot clock check.
> > > > >=20
> > > > > Why do you think this shouldn't be merged ?
> > > >=20
> > > > It pisses of a lot of people who really insist upon accurate
> > > > timing.
> > >=20
> > > It's not just about accurate timings. That 5% is a made-up limit,
> > > that
> > > never have really been confirmed by looking at the typical
> > > tolerancies
> > > of panels.
> > >=20
> > > And while being to relaxed might make some panels work that are
> > > not
> > > working currently, it might also break some panels that currently
> > > work
> > > and won't now, and ideally, we should really be able to let those
> > > panels work if they can, and filter out resolutions if they
> > > can't.
> > >=20
> > > > I think a better fix would be to have a dotclock range in
> > > > drm_panel,
> > > > and some magic to figure out which one of these we can actually
> > > > do. Then tell userspace that this is the mode is should
> > > > request. That way userspace knows what the actual
> > > > dotclock/refresh
> > > > rate is, and the panel still works.
> > >=20
> > > It's not just about panels, but also bridges with EDID where the
> > > tolerancy is not exposed.
> >=20
> > Given that the tolerance is a property of the panel or bridge, I
> > agree with=20
> > Daniel that it should be implemented there, or at least in
> > cooperation with=20
> > drm_panel and drm_bridge.
>=20
> How are we supposed to deal with panels without any documentation
> then?
>=20
> > Semi-related information, I think the CEA and VESA standards allow
> > a 0.5%=20
> > clock tolerance. What is the maximum clock frequency deviation
> > required for=20
> > this platform ?
>=20
> Looks like it does indeed. That's definetely good to know.

Then maybe we can choose to allow 0.5% error when a bridge is attached?

>=20
> Thanks!
> Maxime
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
