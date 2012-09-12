From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6 v2] ARM: integrator: initial device tree support
Date: Wed, 12 Sep 2012 18:52:22 +0200
Message-ID: <CACRpkdbH1CqDOYGLHu=GdCuHQN67=ZE7RXUx1o+nzp3YydpKHQ@mail.gmail.com>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <5048A31E.2090704@gmail.com>
 <CACRpkdYy2CZXXA+kkEaOTznaucxXEwiwSn-5ux0ByHjXrsm-2A@mail.gmail.com>
 <201209061419.07325.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201209061419.07325.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 6, 2012 at 4:19 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 06 September 2012, Linus Walleij wrote:
>> On Thu, Sep 6, 2012 at 3:20 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > [Me]
>> >> I can of course skip the aliases and go for the timer nodes
>> >> I want directly, but that isn't any helpful for people reading the
>> >> device tree, is it?
>> >
>> > Well, the dts doesn't really need to describe how Linux is using things.
>>
>> The arm,integrator-clocksource and arm,integrator-clockevent
>> are renamed arm,timer-primary and arm,timer-secondary in the
>> last patch set.
>>
>> Are you OK with this for now, going forward? I'd be happy to
>> take a round refactoring it for the next cycle as outlined
>> below.
>
> If the timers are really free for use by anything and you want to
> encode how Linux uses them, I would suggest naming the aliases
> "linux.clocksource" and "linux,clockevent" to make it clear that
> you are not describing the hardware here but rather picking
> a configuration.

So the renaming of the aliases to arm,timer-primary and
arm-timer-secondary is to be taken as a hint to the OS to use
these two as primary and secondary respectively.

linux.foo seems bad in comparison, but if you insist...

Yours,
Linus Walleij
