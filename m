From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] of: convert unittest overlay devicetree source to
 sugar syntax
Date: Mon, 29 Jan 2018 11:37:57 +0100
Message-ID: <CAMuHMdVSDj2MmTzbxgZeBx94EKdcRr6B_3Bh+Mb35XhBRPPGXw@mail.gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com> <1517194414-19932-3-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517194414-19932-3-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Mon, Jan 29, 2018 at 3:53 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> The unittest-data overlays have been pulled into proper overlay
> devicetree source files without changing their format.  The
> next step is to convert them to use sugar syntax instead of
> hand coding overlay fragments structure.

Cool! I had heard about the new syntax, but hadn't realized it was merged in
v4.15-rc1.

Have you used your overlay_convert_old_to_new script to convert them?

> A few of the overlays can not be converted because they test
> absolute target paths in the overlay fragment.  dtc does not
> generate this type of target:
>   overlay_0.dts
>   overlay_1.dts
>   overlay_12.dts
>   overlay_13.dts

And I guess you want to keep at least a few tests using the non-sugar syntax
anyway?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
