From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] MIPS: fix build with CONFIG_OF=y for non OF-enabled targets
Date: Sun, 19 Jul 2015 16:06:18 -0500
Message-ID: <CAL_JsqKwQHqUauyOxYg2PF4rBy1DC_UC9s8orWuXUsxMf66bMA@mail.gmail.com>
References: <1437309769-8382-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437309769-8382-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 19, 2015 at 7:42 AM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> Commit 01306aeadd75 ("MIPS: prepare for user enabling of CONFIG_OF")
> changed the guards in asm/prom.h from CONFIG_OF to CONFIG_USE_OF, but
> missed the actual function declarations in kernel/prom.c, which have
> additional dependencies.

Just curious, what machine do you hit this on?

> Fixes the following build error:
>
>   CC      arch/mips/kernel/prom.o
> arch/mips/kernel/prom.c: In function '__dt_setup_arch':
> arch/mips/kernel/prom.c:54:2: error: implicit declaration of function 'early_init_dt_scan' [-Werror=implicit-function-declaration]
>   if (!early_init_dt_scan(bph))
>   ^
>
> Fixes: 01306aeadd75 ("MIPS: prepare for user enabling of CONFIG_OF")
> Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob

> ---
>  arch/mips/kernel/prom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> index b130033..5fcec30 100644
> --- a/arch/mips/kernel/prom.c
> +++ b/arch/mips/kernel/prom.c
> @@ -38,7 +38,7 @@ char *mips_get_machine_name(void)
>         return mips_machine_name;
>  }
>
> -#ifdef CONFIG_OF
> +#ifdef CONFIG_USE_OF
>  void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>  {
>         return add_memory_region(base, size, BOOT_MEM_RAM);
> --
> 2.1.4
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
