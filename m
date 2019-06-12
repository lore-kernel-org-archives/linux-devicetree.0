From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Date: Wed, 12 Jun 2019 08:49:27 +0530
Message-ID: <20190612031927.mgr62xiirjqrzkeu@vireshk-i7>
References: <20190514005033.15593-1-robh@kernel.org>
 <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
 <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
 <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11-06-19, 13:54, Rob Herring wrote:
> On Mon, May 27, 2019 at 12:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > I checked SPEAr and it is missing interrupt-controller at few places and clocks
> > everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.
> 
> Clocks not from DT was supposed to be a transitional thing...

Right, but by the time I left ST in 2012, mainline clock's DT support
wasn't there and the SPEAr core team got fired soon after that. No one
was left in ST to do the porting, but there are still people using the
SPEAr boards and there are products in market, so we can't delete the
platform as well.

So, no one is going to add clock DT support now.

> > And interrupt-controller can be just added, I don't think there would be any
> > platform dependent side-affects ?
> 
> There shouldn't be.

Okay, will send a patch for that then.

-- 
viresh
