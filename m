From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH repost] ARM: shmobile: r8a7790: Remove MSIOF address from
 device tree
Date: Sun, 5 Apr 2015 10:46:33 +0200
Message-ID: <CAMuHMdW40S4rU-wkrJDHDw_ThFdChEa+HEyXYHJ3AAH1TwUiVw@mail.gmail.com>
References: <1428166471-2897-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1428166471-2897-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 4, 2015 at 6:54 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>
> MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
> MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.
>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
