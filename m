From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] dt-binding: gpio: Add Qualcomm SMSM device tree documentation
Date: Tue, 8 Sep 2015 14:53:45 +0200
Message-ID: <CACRpkdYNWm5d1p=5CWuF5rO87voijmOEucMK=Sy4_SDawiQpdA@mail.gmail.com>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
	<CAL_Jsq+WmENn6zbc-ju7d3De4ewBtOe8Hm7JGXvUxfqwpz=iTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+WmENn6zbc-ju7d3De4ewBtOe8Hm7JGXvUxfqwpz=iTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 5:43 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Thu, Aug 27, 2015 at 12:37 PM, Bjorn Andersson <bjorn.andersson@sonymobile.com> wrote:

>> This documents a device tree binding for exposing the Qualcomm Shared
>> Memory State Machine as a set of gpio- and interrupt-controllers.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

>> +This document defines the binding for a driver that implements and exposes this
>> +a GPIO controller and a set of interrupt controllers.
>
> I imagine Linus will have thoughts about that.

Yeah you bet :D

I wrote a lengthy answer to patch 0.

Point being: if we insist on this being modeled as "a kind of GPIO", then
*BSD and Windows also has to think of it as "a kind of GPIO" meaning
we put Linux implementation details into the DT bindings.

At least the idea Rob had about register-bit-* bindings should be respected
see for example:
Documentation/devicetree/bindings/leds/register-bit-led.txt

That naming is neutral, even if we end up solving it in Linux with a GPIO
abstraction, it doesn't enforce that on $OTHER_OS.

Yours,
Linus Walleij
