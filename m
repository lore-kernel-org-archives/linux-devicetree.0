From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Tue, 03 Sep 2013 11:29:47 -0600
Message-ID: <52261C8B.2030906@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <521D0964.2080209@wwwdotorg.org> <CACRpkdaWPQTPw8u+97iV8MRB1fdeS40kd242pJd3UE9Ler4kRQ@mail.gmail.com> <5220F849.8030909@wwwdotorg.org> <CACRpkdYeMGkju345g9d_ifZEOiVXftzSqU=1CfGO=qnt6Vj-Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYeMGkju345g9d_ifZEOiVXftzSqU=1CfGO=qnt6Vj-Bg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/03/2013 06:35 AM, Linus Walleij wrote:
> On Fri, Aug 30, 2013 at 9:53 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> I still haven't seen an answer to why we really care about this; how
>> many times has code actually allocated the same GPIO/IRQ when it
>> shouldn't, in a way that it wasn't detectable by some other mechanism,
>> i.e. the feature just not working? Why are we even trying to solve this
>> issue? I'm not totally convinced it even makes sense to try and solve it.
> 
> We care about this because a number of OMAP boards are not
> working properly when booted from device tree, and they have a hard
> time figuring out a solution to the problem. Last try exploded. Now
> they are looking to create a patch that will fix the actual problem.

Is something missing from /proc/interrupts or /sys/kernel/debug/gpios?
If so, let's just add it.

