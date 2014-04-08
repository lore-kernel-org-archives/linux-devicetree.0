From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 2/2] ARM: dts: MSM8974: Add pinctrl node
Date: Tue, 8 Apr 2014 11:39:48 -0700
Message-ID: <CAJAp7OjnUaBE=Ma-B54=z_w5L6zDP4tn52_kwXekbj2sbYrOLA@mail.gmail.com>
References: <1391700529-11816-1-git-send-email-iivanov@mm-sol.com>
	<1391700529-11816-2-git-send-email-iivanov@mm-sol.com>
	<CAOZdJXVE7MSMBaL+bt0kjw5LEidz-aVp+vrWqQWkye6HdE7EeA@mail.gmail.com>
	<1396959284.28420.45.camel@iivanov-dev>
	<5343EC87.700@codeaurora.org>
	<1396964805.28420.53.camel@iivanov-dev>
	<53440544.9040502@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <53440544.9040502@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 8, 2014 at 7:18 AM, Timur Tabi <timur@codeaurora.org> wrote:
> On 04/08/2014 08:46 AM, Ivan T. Ivanov wrote:
>>>
>>> >This patch adds that same exact information into the device tree.  Why
>>> >are we duplicating that information?  Why add it to the device tree when
>>> >it's already in the driver (and already working).
>
>
>> Probably. It was my natural way of thinking. Pin have a functions.
>> It is easier if I measure signals to just look at the device
>> tree file. What are you suggesting?
>
>
> Back in July, Qualcomm submitted a patch that added this information into
> the device tree:
>
> http://marc.info/?t=137185166100003&r=1&w=2
>
> However, this was rejected.  Now it appears that this information is again
> being added to the device tree, but it's being accepted.  What's different
> now?

The difference is that in the first proposal pins, groups and
functions where defined in DT, in the accepted proposal the devicetree
merely selects pins, functions and their configuration.

>
> Another problem is that these device tree changes makes it difficult to
> support ACPI.  It's easy to move information between the drivers and the
> device tree, because they're kept together.  It's not so easy with ACPI.
> I'm trying to add ACPI support to the 8x74 pinctrl driver, but it's a moving
> target.

The DT bindings for 8x74 is all standard pinctrl, so I presume that
what you should be looking at is how pinctrl and acpi is interacting,
not the specific case of 8x74...

Maybe Linus have some input on this?

Regards,
Bjorn
