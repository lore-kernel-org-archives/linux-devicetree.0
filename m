From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 08/15] MIPS: ingenic: Use common cmdline handling code
Date: Tue, 2 Jan 2018 21:28:31 +0530
Message-ID: <CANc+2y7owub-Nr++MYsoGTDTHxiqeqSFsMEL7b_oWLx-OtosRQ@mail.gmail.com>
References: <20180102150848.11314-1-paul@crapouillou.net> <20180102150848.11314-8-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102150848.11314-8-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 2 January 2018 at 20:38, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> jz4740_init_cmdline appends all arguments from argv (in fw_arg1) to
> arcs_cmdline, up to argc (in fw_arg0). The common code in
> fw_init_cmdline will do the exact same thing when run on a system where
> fw_arg0 isn't a pointer to kseg0 (it'll also set _fw_envp but we don't
> use it). Remove the custom implementation & use the generic code.
>
> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/mips/jz4740/prom.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
>
>  v2: No change
>  v3: No change
>  v4: No change
>  v5: No change
>
> diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
> index 47e857194ce6..a62dd8e6ecf9 100644
> --- a/arch/mips/jz4740/prom.c
> +++ b/arch/mips/jz4740/prom.c
> @@ -20,33 +20,13 @@
>  #include <linux/serial_reg.h>
>
>  #include <asm/bootinfo.h>
> +#include <asm/fw/fw.h>
>  #include <asm/mach-jz4740/base.h>
>
> -static __init void jz4740_init_cmdline(int argc, char *argv[])
> -{
> -       unsigned int count = COMMAND_LINE_SIZE - 1;
> -       int i;
> -       char *dst = &(arcs_cmdline[0]);
> -       char *src;
> -
> -       for (i = 1; i < argc && count; ++i) {
> -               src = argv[i];
> -               while (*src && count) {
> -                       *dst++ = *src++;
> -                       --count;
> -               }
> -               *dst++ = ' ';
> -       }
> -       if (i > 1)
> -               --dst;
> -
> -       *dst = 0;
> -}
> -
>  void __init prom_init(void)
>  {
> -       jz4740_init_cmdline((int)fw_arg0, (char **)fw_arg1);
>         mips_machtype = MACH_INGENIC_JZ4740;
> +       fw_init_cmdline();
>  }
>
>  void __init prom_free_prom_memory(void)
> --
> 2.11.0
>
>

Looks good to me.
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
