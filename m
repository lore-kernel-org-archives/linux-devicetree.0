From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 00/11] ARM: vf610m4: Add Vybrid Cortex-M4 support
Date: Tue, 14 Apr 2015 01:27:27 +0200
Message-ID: <201504140127.28066.arnd@arndb.de>
References: <1428609855-27657-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428609855-27657-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 09 April 2015, Stefan Agner wrote:
> In this fifth revision the patchset moves away from the idea
> including ARMv7-M platforms into ARCH_MULTIPLATFORM, but
> instead adds a new top-level config symbol ARM_SINGLE_ARMV7M
> Patch 7 adds this new config symbol while patch 8 alters the
> existing ARMv7-M platform ARCH_EFM32 to use ARM_SINGLE_ARMV7M.
> I chose to move the config symbol of the ARMv7-M specific
> architectures (ARCH_EFM32 at that point) below the multiarch
> includes. I think it is a good idea to keep them together, but
> I'm not sure if this is an appropriate place. The architecture
> which Vybrid is depending on, ARCH_MXC, is not also selectable
> when ARM_SINGLE_ARMV7M is selected.

It's a shame we didn't manage to pull these in in time for 4.1,
but while the patches look ok to me, they came a little late,
and it's not clear to me how we should maintain that platform.

You have lots of people on 'To:' for the emails, which is always
confusing. My preferred way of merging these in 4.2 would be for
you to send the patches to the imx maintainers so they can
pick them up and send them to arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
