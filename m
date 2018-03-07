From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 7 Mar 2018 14:55:59 +0000
Message-ID: <20180307145559.y4tyyzd2pbqrk4yb@localhost.localdomain>
References: <20180220163540.6704-1-ckeepax@opensource.cirrus.com>
 <CAOMZO5BNYkuz6pH2qZmj+4kBPQB=j-JniiqVbqzdH8nTOXVZQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5BNYkuz6pH2qZmj+4kBPQB=j-JniiqVbqzdH8nTOXVZQQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 11:24:10AM -0300, Fabio Estevam wrote:
> >  static inline void arizona_enable_reset(struct arizona *arizona)
> >  {
> >         if (arizona->pdata.reset)
> > -               gpio_set_value_cansleep(arizona->pdata.reset, 0);
> > +               gpiod_set_value_cansleep(arizona->pdata.reset, 0);
> 
> This should be:
> 
> gpiod_set_value_cansleep(arizona->pdata.reset, 1);
> 
> as here you want to put the reset GPIO into its active state.
> 
> Assuming that in the dts this GPIO is defined as GPIO_ACTIVE_LOW, then
> the command should put it to logic level 0 as done originally.
> 
> >  static void arizona_disable_reset(struct arizona *arizona)
> > @@ -295,7 +295,7 @@ static void arizona_disable_reset(struct arizona *arizona)
> >                         break;
> >                 }
> >
> > -               gpio_set_value_cansleep(arizona->pdata.reset, 1);
> > +               gpiod_set_value_cansleep(arizona->pdata.reset, 1);
> 
> This should be:
> 
> gpiod_set_value_cansleep(arizona->pdata.reset, 0);
> 
> as here you want to put the reset GPIO into its inactive state.

Hmm... this raises a rather good point that I hadn't considered.
This driver is used in a lot of shipping devices and the old
style GPIO calls didn't take the activeness of the GPIO into
account just blindly setting the value you asked for. However the
new style calls do take this into account.

The trouble is I guess we don't know whether most users bothered
to set GPIO_ACTIVE_LOW or not. So it is very hard to say here if
we are about to breaking a lot of existing device trees here.

I guess probably the safest approach is to use
gpiod_set_raw_value_cansleep here?

Thanks,
Charles
