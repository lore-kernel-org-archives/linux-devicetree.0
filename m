From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 20/23] ARM: shmobile: rcar-gen2: Stop passing mode pins
 state to clock driver
Date: Wed, 2 Nov 2016 09:09:15 +0100
Message-ID: <CAMuHMdVdY6c3C+zLAhBCVvxmWD-HhTOis7rU-+_iFQkER3t3fg@mail.gmail.com>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
 <1477055857-17936-21-git-send-email-geert+renesas@glider.be> <722d91fe-574a-8613-34ff-d44be19157be@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <722d91fe-574a-8613-34ff-d44be19157be@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 1, 2016 at 2:35 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
>> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
>
> [...]
>>
>> @@ -130,7 +129,7 @@ void __init rcar_gen2_timer_init(void)
>>         iounmap(base);
>>  #endif /* CONFIG_ARM_ARCH_TIMER */
>>
>> -       rcar_gen2_clocks_init(mode);
>> +       of_clk_init(NULL);
>>         clocksource_probe();
>>  }
>>
>
>   This hunk no longer applies to devel.

Indeed, but I can't update it, as we can't have all mach-shmobile changes in
the clock tree. So Simon will have to resolve the conflict later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
