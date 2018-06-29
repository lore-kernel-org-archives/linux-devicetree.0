From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [PATCH v3 15/24] dt-bindings: display:
 sun4i-drm: Add description of A64 HDMI PHY
Date: Fri, 29 Jun 2018 21:32:59 +0200
Message-ID: <1814959.07NGAI1aoU@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <1669385.k4L9lni8DF@jernej-laptop> <CAGb2v67iRZZTQuTH8inwmPC6S0BRecFgPEpKrxgThQbsYaZgmQ@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBQ4T3LMQKGQER6XWQTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67iRZZTQuTH8inwmPC6S0BRecFgPEpKrxgThQbsYaZgmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 28. junij 2018 ob 09:00:32 CEST je Chen-Yu Tsai napisal(a=
):
> On Thu, Jun 28, 2018 at 12:51 PM, Jernej =C5=A0krabec
>=20
> <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> > Dne =C4=8Detrtek, 28. junij 2018 ob 04:19:55 CEST je Chen-Yu Tsai napis=
al(a):
> >> On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec@siol.n=
et>
> >=20
> > wrote:
> >> > A64 HDMI PHY is similar to H3 HDMI PHY except it has two possible PL=
L
> >> > clock parents. It is compatible to other HDMI PHYs, like that found =
in
> >> > R40.
> >> >=20
> >> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> >> > ---
> >> >=20
> >> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +=
++-
> >> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> >=20
> >> > diff --git
> >> > a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >> > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt inde=
x
> >> > 84fe38dbb900..dc83f21ef188 100644
> >> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >> > @@ -101,6 +101,7 @@ DWC HDMI PHY
> >> >=20
> >> >  Required properties:
> >> >    - compatible: value must be one of:
> >> > +    * allwinner,sun50i-a64-hdmi-phy
> >> >=20
> >> >      * allwinner,sun8i-a83t-hdmi-phy
> >> >      * allwinner,sun8i-h3-hdmi-phy
> >>=20
> >> Nit: the list is sorted by family first, then SoC name, so it should
> >> be the last on the list.
> >=20
> > I went alphabetically, since "5" is before "8"...
>=20
> I see. I think version sort applies here, given that sun50i is newer
> than sun8i.

Should I make a patch for that?

Best regards,
Jernej

>=20
> ChenYu
>=20
> > Best regards,
> > Jernej
> >=20
> >> Otherwise,
> >>=20
> >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >>=20
> >> >    - reg: base address and size of memory-mapped region
> >> >=20
> >> > @@ -111,8 +112,9 @@ Required properties:
> >> >    - resets: phandle to the reset controller driving the PHY
> >> >    - reset-names: must be "phy"
> >> >=20
> >> > -H3 HDMI PHY requires additional clock:
> >> >=20
> >> > +H3 and A64 HDMI PHY require additional clocks:
> >> >    - pll-0: parent of phy clock
> >> >=20
> >> > +  - pll-1: second possible phy clock parent (A64 only)
> >> >=20
> >> >  TV Encoder
> >> >  ----------
> >> >=20
> >> > --
> >> > 2.18.0
> >=20
> > --
> > You received this message because you are subscribed to the Google Grou=
ps
> > "linux-sunxi" group. To unsubscribe from this group and stop receiving
> > emails from it, send an email to
> > linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org For more options, visit
> > https://groups.google.com/d/optout.




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
