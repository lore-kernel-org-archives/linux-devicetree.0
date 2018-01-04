From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Fix #ifdef dependency of early flattree declarations
Date: Thu, 4 Jan 2018 09:33:25 +0100
Message-ID: <CAMuHMdX-xdcHvwD6Ljrn5BapJJ-qcwzsN4Ax1nGVOxdAFZs-kw@mail.gmail.com>
References: <1514888297-10791-1-git-send-email-geert+renesas@glider.be> <201801040759.rKYq0B7R%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201801040759.rKYq0B7R%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fengguang,

On Thu, Jan 4, 2018 at 12:16 AM, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> I love your patch! Yet something to improve:

Thanks, I love your report!

> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/of-fdt-Fix-ifdef-dependency-of-early-flattree-declarations/20180104-062259
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: i386-randconfig-i0-201800 (attached as .config)
> compiler: gcc-7 (Debian 7.2.0-12) 7.2.1 20171025
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    drivers/tty/serial/earlycon.c: In function 'param_setup_earlycon':
>>> drivers/tty/serial/earlycon.c:221:11: error: implicit declaration of function 'early_init_dt_scan_chosen_stdout' [-Werror=implicit-function-declaration]
>        return early_init_dt_scan_chosen_stdout();
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Bummer, of course the dummies should be provided based on complementary
logic... Will fix in v2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
