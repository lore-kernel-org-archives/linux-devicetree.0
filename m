From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 02/11] ARM: shmobile: add r8a7793 SoC device tree
Date: Thu, 21 May 2015 14:44:12 +0200
Message-ID: <CAMuHMdU7zudRkDAqOyG_M-4TcwRoT_nxUkvZ2ZML1xVtLx7WYA@mail.gmail.com>
References: <1432205293-9488-1-git-send-email-ulrich.hecht+renesas@gmail.com>
	<1432205293-9488-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1432205293-9488-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>, Ryo Kataoka <ryo.kataoka.wt@renesas.com>, Phil Edworthy <phil.edworthy@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

On Thu, May 21, 2015 at 12:48 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> r8a7793 device tree including clock descriptions.
>
> Signed-off-by: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> [uli: collapsed BSP revisions into a single commit, edited for style]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Cc: devicetree@vger.kernel.org

There are still some differences between the r8a7791 and r8a7793 files.
Why not just cp && s/7791/7793/g?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
