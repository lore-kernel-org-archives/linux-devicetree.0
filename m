From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC 3/7] ARM: vf610m4: add new machine and SoC for Vybrid on Cortex-M4
Date: Sun, 12 Oct 2014 20:51:37 +0200
Message-ID: <2790232.XFn8jX0Lfm@wuerfel>
References: <cover.1413136383.git.stefan@agner.ch> <d1b3670556c7c7a11092834abf52eedb22c332b7.1413136383.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1b3670556c7c7a11092834abf52eedb22c332b7.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 12 October 2014 20:13:57 Stefan Agner wrote:
> This patch adds a new machine ARCH_MXCM4 which requires !MMU and
> !MULTIARCH and is meant as machine for the hetregenous multi-core
> Vybrid/i.MX SoC's to run Linux on the Cortex-M4.
> 
> The first SoC supported is Vybrid on Cortex-M4 (SOC_VF610M4).
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Not sure whether we really need a new MACH, but since MACH_MXC needs
> MULTIARCH, which in turn conflicts with !MMU, I guess there is no
> easier way to do it... And then, this also needs a new SOC.

I've carried an experimental patch to enable !MMU in combination with
MULTIPLATFORM for a while, it's probably time to do this for real now,
especially since we now have two !MMU platforms that can be built
together. Independent of the question of whether such a combined kernel
could run on real hardware or anybody would want to run such a kernel
if it were possible, I think it's very useful to be able to build
allmodconfig with MMU disabled and get all drivers for the available
platforms for build testing.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
