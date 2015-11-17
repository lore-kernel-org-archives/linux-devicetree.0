From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 0/3] Adding support for NI Ettus Research USRP E3XX pinconf
Date: Tue, 17 Nov 2015 11:55:37 +0100
Message-ID: <CACRpkdbWCaEPD5wdJsh8i_efDOY+Kir4xgoxu5-aNndozRC94A@mail.gmail.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 6, 2015 at 12:41 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:

> I'm planning to use this pinctrl driver to set pins to either
> input (do nothing, default), or output with a value of (1 or 0).
>
> Can I use the 'output-low', 'output-high' bindings to achieve this,
> or am I supposed to implement a gpio controller to do this kind of stuff?

I'm pretty sure you should implement a GPIO chip for this.
output-low and output-high are for things like lines going to
a RAM memory that need to be set up as part of a pin control
state.

> I'm not sure if I'm using the pinctrl framework correctly to achieve this,
> any suggestions on how to change a pin from output to input, as the bindings
> documentation explicitly states 'input-enable' does *not* affect output.

Look at pin controllers also implementing GPIO chips.

Yours,
Linus Walleij
