From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Date: Tue, 28 Mar 2017 18:05:08 +0800
Message-ID: <58da355e.0219620a.618f7.6caeSMTPIN_ADDED_MISSING@gmr-mx.google.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXXK5DDAKGQEVRQHSTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=8827=E6=97=A5 =E4=B8=8A=E5=8D=885:11=E4=BA=8E Maxime R=
ipard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Mar 17, 2017 at 11:34:45AM +0800, Chen-Yu Tsai wrote:=20
> > On Thu, Mar 16, 2017 at 1:37 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:=
=20
> > > On Tue, Mar 07, 2017 at 09:56:26AM +0100, Maxime Ripard wrote:=20
> > >> The Allwinner Timings Controller has two, mutually exclusive, channe=
ls.=20
> > >> When the binding has been introduced, it was assumed that there woul=
d be=20
> > >> only a single user per channel in the system.=20
> > >>=20
> > >> While this is likely for the channel 0 which only connects to LCD di=
splays,=20
> > >> it turns out that the channel 1 can be connected to multiple control=
lers in=20
> > >> the SoC (HDMI and TV encoders for example). And while the simultaneo=
us use=20
> > >> of HDMI and TV outputs cannot be achieved, switching from one to the=
 other=20
> > >> at runtime definitely sounds plausible.=20
> > >>=20
> > >> Add an extra property, allwinner,tcon-channel, to specify for a give=
n=20
> > >> endpoint which TCON channel it is connected to, while falling back t=
o the=20
> > >> previous mechanism if that property is missing.=20
> > >=20
> > > I think perhaps TCON channels should have been ports rather than=20
> > > endpoints. The fact that the channels are mutually exclusive can be=
=20
> > > handled in the driver and doesn't really matter in the binding. How=
=20
> > > painful would it be to rework things to move TCON channel 1 from port=
 0,=20
> > > endpoint 1 to port 1?=20
> >=20
> > Having a separate output port for channel 1 was one option we discussed=
.=20
> > However it wouldn't work well with the kernel's of_graph based crtc=20
> > detection (drm_of_find_possible_crtcs / drm_of_find_possible_crtcs),=20
> > which has the crtcs bound via the output port. As the logic is used=20
> > by multiple drivers, I'm not sure it's easy to rework or test.=20
>
> Can't we use a different logic than drm_of_find_possible_crtcs to fill=20
> the same role?=20
>
> > Also, we still have to support old device trees using channel 1 from=20
> > output port 0 endpoint 1. This is the TV encoder on sun5i (A10s/A13/R8)=
.=20

And from A83T on we will face channel-1 only TCONs., which do not
have channel 0 at all in hardware.

>
> We could probably work something out if we go that way to deal with=20
> old DTs though.=20
>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com
>
> _______________________________________________=20
> linux-arm-kernel mailing list=20
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org=20
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
