From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Date: Fri, 12 Jan 2018 10:49:28 +0100
Message-ID: <CAMuHMdXYJmh8ssSRt8u75fTv5gyrpcoPKAuCT=BaF1Eu27CaiQ@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

FWIW, you're not really deprecating the LVDS part, but removing it completely.
Do you want to keep a reference instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
