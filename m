From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH 02/12] drm: sun4i: Add support for
 enabling DDC I2C bus to dw_hdmi glue
Date: Mon, 8 Apr 2019 14:17:27 +0200
Message-ID: <20190408121727.4vdqdokr6w5thck6@core.my.home>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-3-megous@megous.com>
 <20190408072338.3urcotemju3qi2un@flea>
 <CAGb2v65W_H5HrnY9+DuW-noshXLHgErJhEpHHhzcG15n1u=8iw@mail.gmail.com>
 <20190408084714.b6xdi2pxbjvzwsnu@flea>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBWPXVTSQKGQEV347WTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190408084714.b6xdi2pxbjvzwsnu@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel@l>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 10:47:14AM +0200, Maxime Ripard wrote:
> On Mon, Apr 08, 2019 at 03:28:24PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Apr 8, 2019 at 3:23 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > On Sat, Apr 06, 2019 at 01:45:04AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Orange Pi 3 board requires enabling DDC I2C bus via some GPIO connected
> > > > transistors, before it can be used. Model this as a power supply for DDC
> > > > (via regulator framework).
> > > >
> > > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > >
> > > The DDC bus itself is usually attached to the HDMI connector, so it
> > > would make sense to make the supply also a property of the connector.
> >
> > I believe these are separate things. What this patch covers is power for
> > a voltage shifter between the SoC and HDMI DDC pins. The HDMI connector's
> > 5V supply to power the remote DDC chip is something else. And on the
> > Orange Pi 3 they are indeed separate supplies.
> 
> Then maybe the endpoint link between the two would be the best place
> to put this?

Interestingly &hdmi node configures the DDC bus pins via pinctrl on the SoC
side, so I put this there too, because it's related to those pins. I'm not sure
if that changes anything in the discussion.

regards,
   o.

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
