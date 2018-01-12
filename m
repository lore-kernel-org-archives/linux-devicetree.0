From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver
Date: Fri, 12 Jan 2018 10:47:03 +0100
Message-ID: <CAMuHMdWJ=5O4+FyutUdtWY+8yBwBy_fKqJ-vZGUKKUuvpeB8FQ@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This patch series addresses a design mistake that dates back from the initial
> DU support. Support for the LVDS encoders, which are IP cores separate from
> the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
> described through a single DT node.
>
> To fix the, patches 01/10 and 02/10 define new DT bindings for the LVDS
> encoders, and deprecate their description inside the DU bindings. To retain
> backward compatibility with existing DT, patch 03/10 then patches the device
> tree at runtime to convert the legacy bindings to the new ones.

Looks like we will have to postpone the R-Car Gen2 Modern DT flag day
again by a few kernel releases?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
