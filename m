From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: Use proper types for checking memory overflow
Date: Tue, 8 Jul 2014 09:15:27 +0200
Message-ID: <CAMuHMdX0Bab6XZsujiNcCfaPLGn7-hDdcoJFYUB1UO+HNPUFww@mail.gmail.com>
References: <1404780343-32188-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404780343-32188-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@linaro.org>, Nicolas Pitre <nico@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 8, 2014 at 2:45 AM, Laura Abbott <lauraa@codeaurora.org> wrote:
> Commit a67a6ed15513541579d38bcbd127e7be170710e5
> (of: Check for phys_addr_t overflows in early_init_dt_add_memory_arch)
> corrected early_init_dt_add_memory_arch to account for overflows
> but did so in an unclean way using ULONG_MAX. There is no
> guarantee that sizeof(unsigned long) == sizeof(phys_addr_t).
> Check against phys_addr_t instead.

Thanks!

> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
