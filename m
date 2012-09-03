From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6 v2] ARM: integrator: initial device tree support
Date: Mon, 3 Sep 2012 23:51:48 +0200
Message-ID: <CACRpkdbTRCUnx1JjCQ+WT4PoxtDG38MP=ctUp6TBPd64xQ39jw@mail.gmail.com>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-2-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-3-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-4-git-send-email-linus.walleij@linaro.org>
 <5043E4BE.1060508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5043E4BE.1060508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 3, 2012 at 12:59 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 08/31/2012 10:55 PM, Linus Walleij wrote:

>> +/ {
>> +     model = "ARM Integrator/CP";
>> +     compatible = "arm,integrator-cp";
>> +     ranges;
>> +
>> +     aliases {
>> +             arm,integrator-clocksource = &timer2;
>> +             arm,integrator-clockevent = &timer1;
>
> This is linux specific and a common issue we need a solution for. Grant
> had done something for versatile and we discussed it some, but nothing
> ever got close to finalized. IIRC, Grant's solution was just add a
> "linux,clockevent" or "linux,clocksource" to the nodes that are to be
> used. But he wasn't really happy with it. Perhaps using these names as
> aliases would be better.

Atleast I'm honest about what this is, IMHO this is better than
any of the solutions we already have in boot/dts.

Look at the versatile express
arch/arm/boot/dts/vexpress-v2m.dtsi:

        aliases {
                arm,v2m_timer = &v2m_timer01;
        };

It's quite hard to tell that this "vtm_timer" is actually the block
serving as clock source and clockevent for the Vexpress,
but if you inspect the code you can see that this is what it is.

I can of course skip the aliases and go for the timer nodes
I want directly, but that isn't any helpful for people reading the
device tree, is it?

Maybe primary-timer, secondary-timer is sufficiently
good and neutral aliases?

Yours,
Linus Walleij
