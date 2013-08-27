From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 27 Aug 2013 08:06:47 +0200
Message-ID: <521C41F7.8060305@gaisler.com>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de> <201308261256.00870.poeschel@lemonage.de> <521B3C03.8080508@gaisler.com> <201308261604.55827.poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <201308261604.55827.poeschel@lemonage.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Lars Poeschel <larsi@wh2.tu-dresden.de>, grant.likely@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, ian.campbell@citrix.com, galak@codeaurora.org, pawel.moll@arm.com, tomasz.figa@gmail.com, swarren@wwwdotorg.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 2013-08-26 16:04, Lars Poeschel wrote:
> On Monday 26 August 2013 at 13:29:07, Andreas Larsson wrote:
>> On 2013-08-26 12:56, Lars Poeschel wrote:
>>>> This call to of_irq_find_parent breaks gpiolib-of for SPARC due to
>>>> the fact that the function is undefined when !defined(CONFIG_OF_IRQ)
>>>> && defined(CONFIG_OF).
>>>>
>>>> Defining the empty of_irq_find_parent in include/linux/of_irq.h when
>>>> !defined(CONFIG_OF_IRQ) instead of the current case when
>>>> !defined(CONFIG_OF) would solve the immediate compilation problem.
>>>
>>> Is this a bug and should be fixed ?
>>
>> Well, at least as soon as anyone tries to use in a context that does not
>> exclude SPARC it creates a bug, so I would say so. There is no reason
>> for SPARC to fall between the chairs. This is the first case I am aware
>> of that triggers this.
>
> I also think this should be fixed.
> Are you able to do a patch that fixes this and submit to the relevant
> people?

Sure!

Cheers,
Andreas

