From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 4/4] arm/arm64: arch_timer: Use archdata to indicate
 vdso suitability
Date: Fri, 23 Sep 2016 15:41:09 +0100
Message-ID: <57E53F05.9060806@arm.com>
References: <1474533318-7796-1-git-send-email-oss@buserror.net>
 <1474533318-7796-4-git-send-email-oss@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474533318-7796-4-git-send-email-oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/09/16 09:35, Scott Wood wrote:
> Instead of comparing the name to a magic string, use archdata to
> explicitly communicate whether the arch timer is suitable for
> direct vdso access.
> 
> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/Kconfig                     |  1 +
>  arch/arm/include/asm/clocksource.h   |  8 ++++++++
>  arch/arm/kernel/vdso.c               |  2 +-
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/clocksource.h |  8 ++++++++
>  arch/arm64/kernel/vdso.c             |  2 +-
>  drivers/clocksource/arm_arch_timer.c | 11 +++--------
>  7 files changed, 23 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/include/asm/clocksource.h
>  create mode 100644 arch/arm64/include/asm/clocksource.h

Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
