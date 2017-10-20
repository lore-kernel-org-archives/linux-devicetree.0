From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
Date: Fri, 20 Oct 2017 09:43:29 +0200
Message-ID: <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au> <20171020033727.21557-2-andrew@aj.id.au>
 <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 9:17 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>> GPIO state reset tolerance is implemented in gpiolib through the
>> addition of a new pinconf parameter. With that, some renaming of helpers
>> is done to clarify the scope of the already existing
>> gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
>> means on suspend, reset or both.
>
> Isn't it most reasonable to say persistance covers both cases, reset
> and/or sleep? This seems a bit like overdefined.

I should also add: right now persistance is defined in negative terms,
you can supply the flag "may lose value", which means the subsystem
by default, and driver by default, will try to keep values persistent across
sleep.

Then it is possible to opt in for not doing so. (Usually to save power I
think.)

I think that especially for userspace use cases, saving power should
not really be the concern, but correct me if I'm wrong. I am thinking
of a box with a DC plug wired up to a factory line here.

What we have in the Arizona driver is an opt-in where the DT can
say "don't preserve the value  this line during system sleep" i.e. "lay lose
value" and we can extend that flag to mean "don't preserve this line
during reset either" but by default assume that we should.

Yours,
Linus Walleij
