From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] regulator: fixed: Use more standard GPIO binding
Date: Thu, 4 Oct 2018 13:32:13 +0200
Message-ID: <CACRpkdZZHYSRXktPLHKRc4Afsegn4q3rOmcPMhXh5chC1jH-JQ@mail.gmail.com>
References: <20181004090654.32233-1-linus.walleij@linaro.org> <20181004105031.GD6412@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004105031.GD6412@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 4, 2018 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, Oct 04, 2018 at 11:06:54AM +0200, Linus Walleij wrote:
>
> >  Optional properties:
> > -- gpio: gpio to use for enable control
> > +- gpios: gpio to use for enable control
>
> Are we supposed to be able to have just plain gpios as a standards
> conforming property or would best practice be to call it enable-gpios or
> something?

Oh I didn't think of that really. The gpio-regulator indeed uses
enable-gpio for the same thing. But it complicates things codewise,
as the GPIO line is also optional. I'm a bit uncertain, I tend
to think just "gpios" is fine when the usage is unambigous. but
I don't know what the DT maintainers think.

Yours,
Linus Walleij
