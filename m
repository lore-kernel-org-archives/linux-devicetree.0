From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: BCM2836: Add io map initialization for bcm2836.
Date: Wed, 22 Apr 2015 09:22:43 +0200
Message-ID: <2080047.TSLc2kVvn8@wuerfel>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <60195891.q3RtUhgfkn@wuerfel> <87bnihhypw.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bnihhypw.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 21 April 2015 16:02:19 Eric Anholt wrote:
> > Hard to know. Does anything reference BCM2835_PERIPH_VIRT? Does it work
> > if you remove it?
> Well, that's clear enough. It dies early with:
> 
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Booting Linux on physical CPU 0xf00
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 4.0.0-rc1-v7+ (anholt@eliezer) (gcc version 4.9.2 ( 4.9.2-10) ) #487 SMP PREEMPT Tue Apr 21 15:58:29 PDT 2015
> [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] Machine model: Raspberry Pi 2 Model B+
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] cma: Reserved 64 MiB at 0x37000000
> [    0.000000] Memory policy: Data cache writealloc
> 
> (hung)
> 
> The only thing I see using this 0xf0000000 range is DEBUG_BCM2836's
> serial stuff, though.
> 

Ok. Just to be clear: by removing that mapping, I meant removing the
".map_io = bcm2835_map_io" line as well, so the default debug_ll_io_init()
function gets called. If you have a map_io function that does not call
debug_ll_io_init() or something equivalent, you cannot use DEBUG_LL.

It's possible that this mapping was just added for supporting DEBUG_LL,
using the default debug_ll_io_init() is a better way to do that.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
