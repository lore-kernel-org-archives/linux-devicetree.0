From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: berlin: add the LIBGPIO as a dependency for
 the BG2Q
Date: Tue, 15 Apr 2014 11:16:49 +0200
Message-ID: <534CF901.2080400@gmail.com>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com> <1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397549245-3338-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/15/2014 10:07 AM, Antoine T=C3=A9nart wrote:
> The BG2Q has GPIOs driven by the dwapb GPIO driver. Add the LIBGPIO a=
s a
> dependency to be able to support them.
>
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> ---
>   arch/arm/mach-berlin/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kcon=
fig
> index 291f1cac6c3d..c31968712095 100644
> --- a/arch/arm/mach-berlin/Kconfig
> +++ b/arch/arm/mach-berlin/Kconfig
> @@ -28,6 +28,7 @@ config MACH_BERLIN_BG2Q
>   	select CPU_V7
>   	select HAVE_ARM_TWD if SMP
>   	select HAVE_SMP
> +	select ARCH_REQUIRE_GPIOLIB

Apart from Jisheng's comment, I think we can directly move it
into arch/arm/Kconfig's MACH_BERLIN directly?

Sebastian

>   endmenu
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
