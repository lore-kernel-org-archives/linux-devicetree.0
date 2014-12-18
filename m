From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 11/12] ARM: dts: add support for Vybrid running on Cortex-M4
Date: Thu, 18 Dec 2014 23:44:22 +0100
Message-ID: <2375016.nxLFC8UMcD@wuerfel>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <2615697.uVqMY8zKot@wuerfel> <44e9d518da24fb0c910de464269b8551@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44e9d518da24fb0c910de464269b8551-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 18 December 2014 21:36:31 Stefan Agner wrote:
> On 2014-12-17 13:31, Arnd Bergmann wrote:
> > On Wednesday 17 December 2014 00:41:33 Stefan Agner wrote:
> >> On 2014-12-03 12:03, Arnd Bergmann wrote:
> >> > Starting with v3.19, you should be able to use the earlycon framework on
> >> > arm32, so it would be better to replace earlyprintk with earlycon here
> >> > and add a stdout-path property in chosen that points to the console
> >> > uart.
> >>
> >> I started to implement earlycon support, but something currently fails
> >> when earlycon tries to map the UART registers:
> >> [    0.000000] earlycon_map: Couldn't map 0x40027000
> >>
> >> I traced the issue a bit further down and found that get_vm_area_caller
> >> returns NULL (in __arm_ioremap_pfn_caller). This happend on Linus master
> >> as of today (2dbfca5a181973558277b28b1f4c36362291f5e0). Do I miss
> >> something here?
> > 
> > Hmm, I fear the arm32 FIX_EARLYCON_MEM support ended up not making it
> > into 3.19 after all. 
> 
> Is it because early_ioremap and fixmap still missing for arm32?
> According to Rob's patchset from spring fixmap is required, there is
> something in this tree:
> https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/log/?h=arm-fixmap

Right, that's the one, thanks for finding that again. There are five
patches on that branch. The first three got merged, and the one we
need is just the last one (ARM: fixmap early permanent mapping support),
but the implementation depends on the previous patch (arm: add
early_ioremap support).

I was hoping we'd see both of them in 3.19, but apparently Rob didn't
submit the latest version. If you don't mind, could you try forward-porting
them to the latest kernel and then submit them for inclusion? You could
also try adapting the last patch to work without the early_ioremap
support that we don't really need that urgently on arm32.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
