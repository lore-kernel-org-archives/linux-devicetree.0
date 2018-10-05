From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Fri, 5 Oct 2018 15:17:33 -0500
Message-ID: <CAL_Jsq+Dpv1NohnMaLEV3ZMdHYBwMZMaFtftc8z9X1wORCCT3A@mail.gmail.com>
References: <20181004090654.32233-1-linus.walleij@linaro.org>
 <20181004105031.GD6412@sirena.org.uk> <CACRpkdZZHYSRXktPLHKRc4Afsegn4q3rOmcPMhXh5chC1jH-JQ@mail.gmail.com>
 <20181004135427.GE6412@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004135427.GE6412@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 4, 2018 at 8:54 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 04, 2018 at 01:32:13PM +0200, Linus Walleij wrote:
> > On Thu, Oct 4, 2018 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Thu, Oct 04, 2018 at 11:06:54AM +0200, Linus Walleij wrote:
>
> > > >  Optional properties:
> > > > -- gpio: gpio to use for enable control
> > > > +- gpios: gpio to use for enable control
>
> > > Are we supposed to be able to have just plain gpios as a standards
> > > conforming property or would best practice be to call it enable-gpios or
> > > something?
>
> > Oh I didn't think of that really. The gpio-regulator indeed uses
> > enable-gpio for the same thing. But it complicates things codewise,
> > as the GPIO line is also optional. I'm a bit uncertain, I tend
> > to think just "gpios" is fine when the usage is unambigous. but
> > I don't know what the DT maintainers think.
>
> Right, well from my point of view -gpio is perfectly fine also so... :)
> Rob?

Just 'gpios' is fine generally when there's only one (or one group).

Ideally, gpio-regulator would be a superset of fixed-regulator. The
difference would essentially be the voltage control gpios and state
properties. Changing the names though will break forwards
compatibility if dts files are updated and these are widely used. So
probably not worth trying to change unless you want to carry code to
handle both. That applies to gpio -> gpios too if dts files are
updated and older kernels don't handle both cases. But updating just
the documentation should be fine.

BTW, 'enable-active-high' is also a bit strange as that should just be
encoded into 'enable-gpio' flags. We should really deprecate that.

Rob
