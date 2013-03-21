From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/11] ARM: remove extra timer-sp control register clearing
Date: Thu, 21 Mar 2013 13:03:47 -0500
Message-ID: <514B4B83.60809@gmail.com>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
 <1363820051-24428-3-git-send-email-robherring2@gmail.com>
 <CACRpkdZLn=KjJisPTN2eHn64UuaZvpBDDhmeqQXF-TVS8VZ7pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZLn=KjJisPTN2eHn64UuaZvpBDDhmeqQXF-TVS8VZ7pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/21/2013 12:58 PM, Linus Walleij wrote:
> On Wed, Mar 20, 2013 at 11:54 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> The timer-sp initialization code clears the control register before
>> initializing the timers, so every platform doing this is redundant.
>>
>> For unused timers, we should not care what state they are in.
>>
>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> (...)
>> diff --git a/arch/arm/mach-integrator/integrator_ap.c b/arch/arm/mach-integrator/integrator_ap.c
>> index ea96144..4cb322d 100644
>> --- a/arch/arm/mach-integrator/integrator_ap.c
>> +++ b/arch/arm/mach-integrator/integrator_ap.c
>> @@ -643,10 +643,6 @@ static void __init ap_timer_init(void)
>>         clk_prepare_enable(clk);
>>         rate = clk_get_rate(clk);
>>
>> -       writel(0, TIMER0_VA_BASE + TIMER_CTRL);
>> -       writel(0, TIMER1_VA_BASE + TIMER_CTRL);
>> -       writel(0, TIMER2_VA_BASE + TIMER_CTRL);
>> -
> 
> As noted this is not an init function for timer-sp.c so please drop this
> hunk of the patch. Maybe this zeroing is pointless but that would
> be a separate patch that I can test.

Okay. I'll split this out.

> 
>> diff --git a/arch/arm/mach-integrator/integrator_cp.c b/arch/arm/mach-integrator/integrator_cp.c
>> index 2b0db82..c68e7d8 100644
>> --- a/arch/arm/mach-integrator/integrator_cp.c
>> +++ b/arch/arm/mach-integrator/integrator_cp.c
>> @@ -33,7 +33,6 @@
>>  #include <mach/platform.h>
>>  #include <asm/setup.h>
>>  #include <asm/mach-types.h>
>> -#include <asm/hardware/arm_timer.h>
> 
> What doe this change has to do with $SUBJECT?

If I remove TIMER_CTRL use, then I don't need the header that defines it
any more.

Rob
