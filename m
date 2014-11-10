From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH V4 01/14] sh: Eliminate unused irq_reg_{readl,writel} accessors
Date: Mon, 10 Nov 2014 09:13:49 +0100
Message-ID: <CAMuHMdW+L8YbE8Z8jrtnm8xWk63sRGaFdM7TPM6MmrDg9XwHuQ@mail.gmail.com>
References: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
	<1415342669-30640-2-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1415342669-30640-2-git-send-email-cernekee@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux-sh list <linux-sh@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 7, 2014 at 7:44 AM, Kevin Cernekee <cernekee@gmail.com> wrote:
> Defining these macros way down in arch/sh/.../irq.c doesn't cause
> kernel/irq/generic-chip.c to use them.  As far as I can tell this code
> has no effect.
>
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Compared preprocessor and asm output before and after, no difference
except for line numbers, so

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
