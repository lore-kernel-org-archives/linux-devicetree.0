From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 03 Sep 2013 11:22:23 -0600
Message-ID: <52261ACF.30504@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <521D0964.2080209@wwwdotorg.org> <CACRpkdaWPQTPw8u+97iV8MRB1fdeS40kd242pJd3UE9Ler4kRQ@mail.gmail.com> <5220F849.8030909@wwwdotorg.org> <CAK7N6vrEXVyLHpY-v+SJ668hC0wvHrWOgtviAQ+w5yis7p_E4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAK7N6vrEXVyLHpY-v+SJ668hC0wvHrWOgtviAQ+w5yis7p_E4Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: anish singh <anish198519851985@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 08/31/2013 09:32 AM, anish singh wrote:
> On Sat, Aug 31, 2013 at 1:23 AM, Stephen Warren <swarren@wwwdotorg.org
> <mailto:swarren@wwwdotorg.org>> wrote:

>     I still haven't seen an answer to why we really care about this; how
>     many times has code actually allocated the same GPIO/IRQ when it
>     shouldn't, in a way that it wasn't detectable by some other mechanism,
>     i.e. the feature just not working? Why are we even trying to solve this
>     issue? I'm not totally convinced it even makes sense to try and
>     solve it.
> 
>  
> Probably this issue(same gpio/irq being used by multiple drivers) is
> very rare
> but debugging it is bit difficult.

Really? It's easy to just look in /proc/interrupts and
/sys/kernel/debug/gpio.

> This generally happens when we are working
> on latest revised boards where latest gpio number of some driver
> conflicts with the some other driver.

At least in the DT case, which is all that this patch solves, the DT is
describing the HW GPIO/IRQ numbers, so the Linux GPIO numbers are
irrelevant; everything is expressed as raw HW numbers, which are quite
easy to check.
