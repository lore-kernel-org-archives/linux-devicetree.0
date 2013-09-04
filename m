From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Wed, 04 Sep 2013 14:13:13 -0600
Message-ID: <52279459.1010100@wwwdotorg.org>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <CACRpkdYeMGkju345g9d_ifZEOiVXftzSqU=1CfGO=qnt6Vj-Bg@mail.gmail.com> <52261C8B.2030906@wwwdotorg.org> <5584741.67AvVurcHF@lem-wkst-02>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5584741.67AvVurcHF@lem-wkst-02>
Sender: linux-gpio-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/04/2013 02:35 AM, Lars Poeschel wrote:
> On Wednesday 04 September 2013 11:29:47, Stephen Warren wrote:
>> On 09/03/2013 06:35 AM, Linus Walleij wrote:
>>> On Fri, Aug 30, 2013 at 9:53 PM, Stephen Warren <swarren@wwwdotorg.org> 
> wrote:
>>>> I still haven't seen an answer to why we really care about this; how
>>>> many times has code actually allocated the same GPIO/IRQ when it
>>>> shouldn't, in a way that it wasn't detectable by some other mechanism,
>>>> i.e. the feature just not working? Why are we even trying to solve this
>>>> issue? I'm not totally convinced it even makes sense to try and solve it.
>>>
>>> We care about this because a number of OMAP boards are not
>>> working properly when booted from device tree, and they have a hard
>>> time figuring out a solution to the problem. Last try exploded. Now
>>> they are looking to create a patch that will fix the actual problem.
>>
>> Is something missing from /proc/interrupts or /sys/kernel/debug/gpios?
>> If so, let's just add it.
> 
> That would require procfs to be mounted to /proc and even CONFIG_PROC_FS to be 
> compiled in. Drivers have to work without that requirement.
> That would require CONFIG_DEBUG_FS to be set, right? Drivers have to work 
> without that.

Drivers will/could work fine without those options enabled and
filesystems mounted. Nothing in this patch series affects that, nor
would not applying the patch series.

However, you only need this patch series if there's some kind of
problematic resource conflict and you want to debug it. If your system
has a problem and you want to debug it, it seems entirely reasonable to
make use of (require making use of) the debugging tools that are already
part of the kernel.
