From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/6] arm: kconfig: don't select TWD with local timer for
 Armada 370/XP
Date: Mon, 21 Jan 2013 23:37:22 +0100
Message-ID: <50FDC322.2040107@free-electrons.com>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <1358790842-2986-4-git-send-email-gregory.clement@free-electrons.com>
 <201301211831.45947.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301211831.45947.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi@marvell>
List-Id: devicetree@vger.kernel.org

On 01/21/2013 07:31 PM, Arnd Bergmann wrote:
> On Monday 21 January 2013, Gregory CLEMENT wrote:
>> @@ -1624,7 +1624,7 @@ config LOCAL_TIMERS
>>         bool "Use local timer interrupts"
>>         depends on SMP
>>         default y
>> -       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)
>> +       select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT && !ARMADA_370_XP_TIMER)
>>         
> 
> Your change is fine, but I just noticed that this line is asking for trouble
> when we enable multipleform support for MSM and/or EXYNOS.
> 
> Also, I wonder if we should change this somehow in 3.8, because it seems
> that for a multiplatform kernel including armadaxp and e.g. versatile express,
> you have no ARM_TWD support in the kernel, which seems wrong. Is there any
> reason we can't enable the ARM_TWD code to be built-in on platforms that
> don't use it?

I don't see a strong reason to not enable it if we don't use it. My concern
was that I don't need it so I didn't want to include it and generating extra
code for nothing. Then just after having sent this patch set, I received your
patch set about build regression in 3.8 and especially the part about
CONFIG_MULTIPLATFORM made me realized that it could be a problem.

> 
> Maybe it can be written as
> 
> config LOCAL_TIMERS
> 	bool "Use local timer interrupts"
> 	depends on SMP
> 	default y
> 
> config HAVE_ARM_TWD
> 	depends on LOCAL_TIMERS
> 	default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT)

So in this case why not written something like this:
 	default ARCH_MULTIPLATFORM || (!ARCH_MSM_SCORPIONMP && !EXYNOS4_MCT && !ARMADA_370_XP_TIMER)

> 	default y
I am not a kconfig expert, but won't this line set HAVE_ARM_TWD to 'y' whatever
the result of the previous line?

> 
> This will still be slightly wrong (generating extra code) on a multiplatform
> kernel that has no platform other than MSM or EXYNOS, but the other alternative
> would be that each platform with TWD support has to select HAVE_ARM_TWD itself.

Gregory
