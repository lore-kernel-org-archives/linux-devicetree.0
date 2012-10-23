From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] tty: pxa: configure pin
Date: Tue, 23 Oct 2012 11:59:30 +0200
Message-ID: <CACRpkdb+DkZbTDZamGMN+9t07kPktuA_3QtHQJFv+Vu859r7KA@mail.gmail.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-3-git-send-email-haojian.zhuang@gmail.com>
 <508080CB.5010904@wwwdotorg.org>
 <CACRpkdb5Jiw71jBLDXpf2VTJQx7_gABqs03_20CeCLbVT=JkaA@mail.gmail.com>
 <5085AC06.8070508@wwwdotorg.org>
 <CACRpkdY-XyagxGU_ya_FZirzbqStTirOC5nuBBwwFY3f4bBTYA@mail.gmail.com>
 <20121023093711.GS4477@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121023093711.GS4477-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
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
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rickard ANDERSSON <rickard.andersson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2012 at 11:37 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Tue, Oct 23, 2012 at 11:26:40AM +0200, Linus Walleij wrote:
>> I thought about that, but it does not allow us to control the
>> resource activation/deactivation order.
>
>> In some drivers the suspend() path could be:
>
>> - pins to sleep
>> - clk_disable
>> - disable external regulator
>> - release power domain
>
>> In others:
>
>> - clk_disable()
>> - disable external regulator
>> - pins to sleep()
>> - release power domain
>
>> Ulf Hansson ran into this a while back.
>
>> Just like with the notifier approach, this approach assumes that either
>> the ordering above doesn't matter, or that it is the same for all drivers.
>
> Can we handle this with power domains - if different devices require
> different orderings they can be placed in power domains which implement
> the appropriate orderings for them?

clocks, regulators, pins and all in power domains?

Then we should rename them "device resource domains" or
something...

I have a strong sense of system-wide all-or-nothing approaches
to this problem.

- Either we use "power" domains to handle every resource the
 device has.
- Or the device driver manages it's own resources.

I find it pretty hard to build consensus around either idea.

The problem is that the latter approach (devices drivers themselves
take clocks, domain power, etc) is already quite widespread
in the kernel so to get the entire world consistent to the former
approach would be pretty painful I think. Especially in the case
where a device driver is used on more than one SoC.

Yours,
Linus Walleij
