From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Date: Tue, 11 Jun 2019 13:54:57 -0600
Message-ID: <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
References: <20190514005033.15593-1-robh@kernel.org> <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
 <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 12:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 24-05-19, 13:38, Linus Walleij wrote:
> > On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:
> >
> > > Convert the Arm PL061 GPIO controller binding to json-schema format.
> > >
> > > As I'm the author for all but the gpio-ranges line, make the schema dual
> > > GPL/BSD license.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Cc: linux-gpio@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Patch applied. As you know I am already a big fan of this scheme.
> >
> > > This warns on a few platforms missing clocks, interrupt-controller
> > > and/or #interrupt-cells. We could not make those required, but really
> > > they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> > > aren't too active, so I don't know that we want to fix them.
> >
> > What works for you works for me.
> >
> > We could add dummy fixed clocks in the DTS files if
> > we wanted I suppose. The #interrupt-cells and interrupt-controller
> > things we can just fix, but I wonder what the maintainers of these
> > platforms are up to? Isn't Calxeda yours, and could Viresh fix
> > up the SPEAr?

I was hoping to delete Calxeda rather than fix. I'm pretty sure none
of the distros are using the systems anymore and they were the main
users for a while. Otherwise, I would have converted all the bindings
it uses.

> I checked SPEAr and it is missing interrupt-controller at few places and clocks
> everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.

Clocks not from DT was supposed to be a transitional thing...

>
> And interrupt-controller can be just added, I don't think there would be any
> platform dependent side-affects ?

There shouldn't be.

Rob
