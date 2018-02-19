Return-Path: <SRS0=PLME=FN=opensource.cirrus.com=ckeepax@kernel.org>
Date: Mon, 19 Feb 2018 14:28:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] mfd: arizona: Update reset pin to use GPIOD
Message-ID: <20180219142816.ccrkxthzmtpopnw5@localhost.localdomain>
References: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
 <CAHp75Vc6ok2s0fiQi9ePgmf4BVyO5N125B6iE1jnqWmgWF01Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vc6ok2s0fiQi9ePgmf4BVyO5N125B6iE1jnqWmgWF01Ng@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Mark Rutland  <mark.rutland@arm.com>, Linus Walleij" <linus.walleij@linaro.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 03:36:29PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 19, 2018 at 3:30 PM, Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > Now GPIOD has support for both pdata systems and for non-standard DT
> > bindings the Arizona reset GPIO can be converted to use it.
> 
> >  static inline void arizona_enable_reset(struct arizona *arizona)
> >  {
> > -       if (arizona->pdata.reset)
> > -               gpio_set_value_cansleep(arizona->pdata.reset, 0);
> > +       gpiod_set_value_cansleep(arizona->pdata.reset, 0);
> >  }
> 
> Did you try that code when !GPIOLIB ?
> 
> Or driver depends on it?
> 

Hmm... yeah ok maybe I need to leave that if (reset) in, didn't
realise all those stubs straight up call WARNs. Although seems a bit
of a shame as gpiod_set_value_cansleep will do the NULL check as well.

Looks like attempt 3 it is :-)

Thanks,
Charles
