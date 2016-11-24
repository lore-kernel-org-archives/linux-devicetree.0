From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] gpio: axp209: use correct register for GPIO input status
Date: Thu, 24 Nov 2016 13:52:55 +0800
Message-ID: <CAGb2v67h1kH9=MtvKTnzgTTbO6BK5Qb2sJ8uG5=mb1UWVBVSaQ@mail.gmail.com>
References: <20161123132749.11666-1-quentin.schulz@free-electrons.com>
 <20161123132749.11666-2-quentin.schulz@free-electrons.com> <20161123144532.3089ebfd@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161123144532.3089ebfd@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Quentin Schulz <quentin.schulz@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 23, 2016 at 9:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 23 Nov 2016 14:27:48 +0100, Quentin Schulz wrote:
>> The GPIO input status was read from control register
>> (AXP20X_GPIO[210]_CTRL) instead of status register (AXP20X_GPIO20_SS).
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
>
> This smells like a bug fix, so perhaps Cc: stable?

Presently there are no in-tree boards that use the GPIOs
as input. And the only user I see is the CHIP, for the headphone
jack detection. Again, not supported in mainline yet.

Not sure if there is value in sending it for stable.

ChenYu

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
