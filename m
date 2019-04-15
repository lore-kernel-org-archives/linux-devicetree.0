From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Mon, 15 Apr 2019 22:39:08 +0800
Message-ID: <CAGb2v66dY40zkQcVcyORZ-7RAkC1ATB9fTyRzabf-NyDKAustw@mail.gmail.com>
References: <20190412120730.473-1-megous@megous.com> <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190415142222.cytlvz7z3mjf7slm@core.my.home> <20190415143304.dxpmyh73qxzaybtc@flea>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGVP2LSQKGQE73YJHJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190415143304.dxpmyh73qxzaybtc@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 10:33 PM Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Mon, Apr 15, 2019 at 04:22:22PM +0200, Ond=C5=99ej Jirman wrote:
> > DT would still probably need a re-work in the future, if the PRCM clock
> > modeling the gate would be needed.
>
> Just reacting to that bit.
>
> I know we're pretty bad at this, and the documentation doesn't make it
> any easier, but if you have any idea of how it should be modelled
> next, then do that.

It seems to be just a clock gate, judging by previous (A80/A83T) SoCs.
However since we lack documents for the PRCM, we might need to poke
around to verify that it's actually there.

Or maybe we could ask Allwinner very specific questions, like:

  - Does the PRCM have a gate controlling XO?
  - Is it bit 2 in register 0x44 in the PRCM?

ChenYu

> There's no reason to push it to a later time, it makes everyone's life
> harder.
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
