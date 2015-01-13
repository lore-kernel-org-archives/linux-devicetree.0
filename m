From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH 1/5] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Tue, 13 Jan 2015 09:07:27 -0800
Message-ID: <54B550CF.7050001@broadcom.com>
References: <rjui@broadcom.com>	<1417826408-1600-1-git-send-email-rjui@broadcom.com>	<1417826408-1600-2-git-send-email-rjui@broadcom.com> <CACRpkdaTU_efMOpKoEdBA0rDHyn6wcn7VamUZRiX-K2MYZygBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaTU_efMOpKoEdBA0rDHyn6wcn7VamUZRiX-K2MYZygBQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 1/12/2015 11:57 PM, Linus Walleij wrote:
> On Sat, Dec 6, 2014 at 1:40 AM, Ray Jui <rjui@broadcom.com> wrote:
> 
>> Document the GPIO device tree binding for Broadcom Cygnus SoC
>>
>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> (...)
>> +- #gpio-cells:
>> +    Must be two. The first cell is the GPIO pin number (within the
>> +controller's domain) and the second cell is used for the following:
>> +    bit[0]: polarity (0 for normal and 1 for inverted)
>> +    bit[18:16]: internal pull up/down: 0 - pull up/down disabled
>> +                                       1 - pull up enabled
>> +                                       2 - pull down enabled
>> +    bit[22:20]: drive strength: 0 - 2 mA
>> +                                1 - 4 mA
>> +                                2 - 6 mA
>> +                                3 - 8 mA
>> +                                4 - 10 mA
>> +                                5 - 12 mA
>> +                                6 - 14 mA
>> +                                7 - 16 mA
> 
> No. This pull up/down and drive strength is pin controller
> business, use a pin control backend behind the GPIO driver
> see Documentation/pinctrl.txt.
> 
> Initial states for these configurations can be set up using
> pin control hogs since pin control and GPIO is orthogonal.
> 
Yes, I got it! See my reply in the GPIO driver review. Thanks.

> Yours,
> Linus Walleij
> 
