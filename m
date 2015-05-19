From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v10 1/5] arm64: Enable EDAC on ARM64
Date: Tue, 19 May 2015 19:03:08 +0200
Message-ID: <20150519170308.GL4641@pd.tnic>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431991481-25684-2-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 18, 2015 at 05:24:37PM -0600, Loc Ho wrote:
> Add an stub atomic_scrub function and enable EDAC for arm64.
> 
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  arch/arm64/Kconfig            |    1 +
>  arch/arm64/include/asm/edac.h |   28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm64/include/asm/edac.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 4269dba..577078f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -22,6 +22,7 @@ config ARM64
>  	select BUILDTIME_EXTABLE_SORT
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
> +	select EDAC_SUPPORT
>  	select CPU_PM if (SUSPEND || CPU_IDLE)
>  	select DCACHE_WORD_ACCESS
>  	select GENERIC_ALLOCATOR
> diff --git a/arch/arm64/include/asm/edac.h b/arch/arm64/include/asm/edac.h
> new file mode 100644
> index 0000000..683495b
> --- /dev/null
> +++ b/arch/arm64/include/asm/edac.h
> @@ -0,0 +1,28 @@
> +/*
> + * ARM64 EDAC Header File
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef __ASM_EDAC_H
> +#define __ASM_EDAC_H
> +
> +/*
> + * ECC atomic, DMA, SMP and interrupt safe scrub function.
> + */
> +static inline void atomic_scrub(void *va, u32 size)
> +{
> +	/* Stub function for now until an ARM64 HW has a way to test it. */
> +	WARN_ONCE(1, "not implemented");
> +}

So you're adding this empty function, it issues a warning for which the
user can't really do anything about and on top of that, it is not even
used in this patchset.

So please kill it from this submission.

You can add a full-fledged version later after you test it successfully
on real hw.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
