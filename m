From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Date: Mon, 27 May 2019 12:11:46 +0530
Message-ID: <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
References: <20190514005033.15593-1-robh@kernel.org>
 <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24-05-19, 13:38, Linus Walleij wrote:
> On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:
> 
> > Convert the Arm PL061 GPIO controller binding to json-schema format.
> >
> > As I'm the author for all but the gpio-ranges line, make the schema dual
> > GPL/BSD license.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Patch applied. As you know I am already a big fan of this scheme.
> 
> > This warns on a few platforms missing clocks, interrupt-controller
> > and/or #interrupt-cells. We could not make those required, but really
> > they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> > aren't too active, so I don't know that we want to fix them.
> 
> What works for you works for me.
> 
> We could add dummy fixed clocks in the DTS files if
> we wanted I suppose. The #interrupt-cells and interrupt-controller
> things we can just fix, but I wonder what the maintainers of these
> platforms are up to? Isn't Calxeda yours, and could Viresh fix
> up the SPEAr?

I checked SPEAr and it is missing interrupt-controller at few places and clocks
everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.

And interrupt-controller can be just added, I don't think there would be any
platform dependent side-affects ?

-- 
viresh
