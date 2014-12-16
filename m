From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/3] gpio: Add APM X-Gene standby GPIO controller driver
Date: Tue, 16 Dec 2014 10:56:16 +0100
Message-ID: <1878846.YCCkHOWfdd@wuerfel>
References: <1412779948-28769-1-git-send-email-yvo@apm.com> <2250730.N6DdkCTXkh@wuerfel> <CAL4ahLfSZjmqqbQ9Xmqae_AVfFZLiUUEN+rABMwiu2_8u4mmPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL4ahLfSZjmqqbQ9Xmqae_AVfFZLiUUEN+rABMwiu2_8u4mmPQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Tin Huynh <tnhuynh@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 16 December 2014 16:43:02 Y Vo wrote:
> >> +static int xgene_gpio_sb_get(struct gpio_chip *gc, u32 gpio)
> >> +{
> >> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> >> +       struct xgene_gpio_sb *chip = to_xgene_gpio_sb(mm_gc);
> >> +       u32 data;
> >> +
> >> +       data = ioread32(mm_gc->regs + MPA_GPIO_IN_ADDR);
> >> +
> >> +       return (data &  GPIO_MASK(gpio)) ? 1 : 0;
> >> +}
> >
> > This would be actually broken, right? Maybe it's better to change the
> > driver so that it refuses to map GPIO lines that are hardwired to
> > the interrupt controller, until we can support that.
> 
> It still works if they are configure as GPIO.
> Do you have any reference to resolve it ?

Ok, I think I just misunderstood how this works, I assumed that you
could not reconfigure the lines. Seems ok then.

	Arnd
