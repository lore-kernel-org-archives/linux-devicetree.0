From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/17] dt-bindings: display: sun4i-drm: Add
 R40 TV TCON description
Date: Mon, 9 Jul 2018 08:16:45 -0600
Message-ID: <CAL_Jsq+2Cv+cS+c8DuHackVfO3beYHx-p-dXpK2z=vQwHKSD-Q@mail.gmail.com>
References: <20180706175113.26698-1-jernej.skrabec@siol.net>
 <20180706175113.26698-7-jernej.skrabec@siol.net> <20180706204052.GA9680@rob-hp-laptop>
 <8232482.X57NU8v1zb@jernej-laptop>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJIP47K7MERBWW4RXNAKGQESACHYZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8232482.X57NU8v1zb@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 6, 2018 at 2:46 PM Jernej =C5=A0krabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org=
> wrote:
>
> Dne petek, 06. julij 2018 ob 22:40:52 CEST je Rob Herring napisal(a):
> > On Fri, Jul 06, 2018 at 07:51:02PM +0200, Jernej Skrabec wrote:
> > > TCON description is expanded with R40 TV TCON compatible. It is a bit
> > > special, because it is connected to TCON TOP instead directly to mixe=
r
> > > and it needs special handling.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > ---
> > >
> > >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 ++=
-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > Please add acks/reviews when posting new versions.
>
> This is not exactly the same version you give ack for, so I didn't includ=
e it.

Then you need to state what changed (in this patch) and why you didn't
add the ack.

> I'm not sure where the line for that is.
>
> In contrast to previous version, it doesn't introduce additional clock.

Sounds trivial enough to keep the ack.

Rob

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
