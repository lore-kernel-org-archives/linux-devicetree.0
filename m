From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 15:08:24 +0100
Message-ID: <CAMuHMdWrhgvLv6syjFxfN42ah7pkO9Ye9SJYDTCwRMQCFrJAeg@mail.gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Mon, Jan 29, 2018 at 3:53 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Move duplicating and unflattening of an overlay flattened devicetree
> (FDT) into the overlay application code.  To accomplish this,
> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>
> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
> code, which is thus responsible for freeing the duplicate FDT.  The
> caller of of_overlay_fdt_apply() remains responsible for freeing the
> original FDT.
>
> The unflattened device tree (aka expanded device tree, EDT) now
> belongs to devicetree code, which is thus responsible for freeing
> the EDT.
>
> These ownership changes prevent early freeing of the duplicated FDT
> or the EDT, which could result in use after free errors.
>
> These changes led to migrating some unittest overlay data into
> their own devicetree source files, and then converting most of
> them to use sugar syntax instead of hand coding fragments.

Thanks for your series!

> Frank Rowand (2):
>   of: change overlay apply input data from EDT to FDT
>   of: convert unittest overlay devicetree source to sugar syntax

Do you plan to update Documentation/devicetree/overlay-notes.txt
and Documentation/devicetree/bindings/fpga/fpga-region.txt, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
