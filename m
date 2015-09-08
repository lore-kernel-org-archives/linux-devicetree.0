From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] Qualcomm Shared Memory State Machines
Date: Tue, 8 Sep 2015 14:20:14 +0200
Message-ID: <CACRpkdb-624MauE4sS0mqxarXRRaS3sEB2aMzeRNZw945xhMnA@mail.gmail.com>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 7:37 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

Let's discuss this a bit, looping in Mark Brown.

> As some of these states on some platforms are passed as physical signals
> instead, the two drivers are modelled as gpio- and interrupt-controllers -
> providing a nice abstraction both in device tree sense and Linux implementation
> sense.

I have unfortunately repeatedly encountered an argument of the type
"GPIO has nice infrastructure so let's call X 'a kind of GPIO' so
we can use that nice infrastructure".

I'm not pleased with something that is not really general purpose
input/output being called GPIO. It fits badly with the GPIO subsystem
when we support things like open drain and cross-mappings to
the pin control subsystem that will never be applicable to these
new users. It's more like "special purpose input/output" or
something.

This happened with syscon LEDs for example, and was the reason
I implemented syscon-leds. The original proposal was to say the LEDs
register was "a kind of GPIO" on top of regmap and then use gpio-leds
on top of that. Instead I insisted it was a syscon/regmap and the
LEDs go directly to that, bypassing one layer of abstraction.

I also imagine creating syscon-keys.c for input from arbitrary keys
in a syscon register actually. Just didn't get around to that yet.

I also see some of the stuff GPIO does out-of-the-box being useful,
for example in MFD: some of these are interrupt controllers and
basically duplicate the kind of code I have in gpiolib for
GPIOLIB_IRQCHIP.

So we need to figure out what is really needed.

While sparsely documented: what about regmap (maybe in the
form of syscon) and drivers/base/regmap/regmap-irq.c for the
interrupt handling?

I cannot claim to understand regmap-irq.c, but I just intuitively
think it deserves consideration, such that drivers who need one
of these misc registers can read/write their bits with regmap
accessors and also get IRQs by way of regmap-irq.

Yours,
Linus Walleij
