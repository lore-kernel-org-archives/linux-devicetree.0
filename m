From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Excluding pins from Linux control
Date: Wed, 15 Mar 2017 22:03:53 +0100 (CET)
Message-ID: <453853371.502284.1489611833231@email.1und1.de>
References: <433834766.313467.1488218521360@email.1und1.de>
 <CACRpkdYB+4=hG4YcUTvyg50cP6SfMhUuUMW7XqJAVxswYBsWng@mail.gmail.com>
 <1588667510.505126.1489522194503@email.1und1.de>
 <CACRpkdbr9-hsFzPvOpwiVg=X=avx8fb14HhWWXNda7gGZaM2Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbr9-hsFzPvOpwiVg=X=avx8fb14HhWWXNda7gGZaM2Gg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Linus Walleij <linus.walleij@linaro.org> hat am 15. März 2017 um 09:46 geschrieben:
> 
> 
> On Tue, Mar 14, 2017 at 9:09 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> >> Linus Walleij <linus.walleij@linaro.org> hat am 14. März 2017 um 15:39 geschrieben:
> 
> >> If you want to do it statically, at boot time:
> >> Just add some NOOP function (i.e. a function that result in
> >> zero register writes or anything) named "videocore-reserved" or
> >> something to the driver in  drivers/pinctrl/bcm/pinctrl-bcm2835.c,
> >> make it applicable to the affected pins, making it possible
> >> to create a state that will combine the function "videocore-reserved"
> >> with these pins, resulting in them being exclusively used for
> >> that.
> >
> > If you speak of a NOOP function, do you mean a "dummy" pin function
> > which is configured by the device tree? Like extending the "brcm,function"
> > property from the existing binding?
> 
> No, a function for videocore defined by the driver in
> drivers/pinctrl/bcm/pinctrl-bcm2835.c
> and then used by the device tree.
> 
> Looking at the BCM2835 syntax (hope I get it right), in the end you should
> be able to do this:
> 
>     videocore: videocore {
>         brcm,pins = <12, 13, 14, 15, 16, 17, 18, 19, 20>;
>         brcm,function = <BCM2835_FSEL_VIDEOCORE>;
>     };
> 
> So BCM2835_FSEL_VIDEOCORE need to be defined in the
> DT include and made available as a muxing option inside the driver, with
> the effect that nothing really happens when you select it.
> 
> The point is that the pinctrl core will then regard the pin as taken
> (this can be verified in debugfs) and then no other function can go
> in and use the pin by mistake.
> 
> Something like this:
> 
> From d188c03c1fba7d1223c1dafcb8b977e383298ef4 Mon Sep 17 00:00:00 2001
> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Wed, 15 Mar 2017 09:45:37 +0100
> Subject: [PATCH] Stab at videocore function
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Again, thanks a lot

Stefan

> 
> Yours,
> Linus Walleij
