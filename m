From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: shmobile: lager: correct renesas,gpios to
 renesas,groups in sd[02] pfc
Date: Mon, 7 Apr 2014 22:35:12 +0200
Message-ID: <CAMuHMdW+ZD0r+W2BWw8Uusz_LYPmnrsX+Hk5wkvhiEf0f8u4cg@mail.gmail.com>
References: <1396898212-7078-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1396898212-7078-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, magnus.damm@opensource.se, Simon Horman <horms@verge.net.au>, Rob Taylor <rob.taylor@codethink.co.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 7, 2014 at 9:16 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> From: Rob Taylor <rob.taylor@codethink.co.uk>
>
> Fix probable typo of renesas,groups in the lager dt. The kernel has no
> renesas,gpios but this should match renesas,groups.
>
> Signed-off-by: Rob Taylor <rob.taylor@codethink.co.uk>

Thanks, nice catch!

> [ben.dooks@codethink.co.uk: fixup description]
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
