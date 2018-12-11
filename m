From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] reset: Exclusive resets must be dedicated to a single
 hardware block
Date: Tue, 11 Dec 2018 09:42:16 +0100
Message-ID: <CAMuHMdWVFUGPgaChSn2K3schA0uJJVjxs2Z4FB2hb1_UdW3FiA@mail.gmail.com>
References: <20181113133520.20889-1-geert+renesas@glider.be> <CAMuHMdX-X6dTJi6WgRKYVs-w+rxO3cJP8kX5AZwOXNO4qpgcqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX-X6dTJi6WgRKYVs-w+rxO3cJP8kX5AZwOXNO4qpgcqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>
List-Id: devicetree@vger.kernel.org

Hi Mark, Rob, Frank,

On Wed, Nov 28, 2018 at 10:28 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Nov 13, 2018 at 2:35 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > In some SoCs multiple hardware blocks may share a reset control.
> > The reset control API for shared resets will only assert such a reset
> > when the drivers for all hardware blocks agree.
> > The exclusive reset control API still allows to assert such a reset, but
> > that impacts all other hardware blocks sharing the reset.
> >
> > While the kernel doc comments clearly state that the API for shared
> > resets applies to reset controls which are shared between hardware
> > blocks, the exact meaning of exclusive resets is not documented.
> > Fix the semantic ambiguity with respect to exclusive access vs.
> > exclusive reset lines by:
> >   1. Clarifying that exclusive resets really are intended for use with
> >      reset controls which are dedicated to a single hardware block,
> >   2. Ensuring that obtaining an exclusive reset control will fail if the
> >      reset is shared by multiple hardware blocks, for both DT-based and
> >      lookup-based reset controls.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Question from Philipp for the DT maintainers:
> >
> >    "I'd still like to hear the device tree maintainers' opinion on
> >     parsing the whole DT for "resets" phandle properties to find shared
> >     resets like this."
>
> Mark, Rob: Ping?

Do you have any comments about this?
(In case you lost the link to the original patch:
 https://lore.kernel.org/lkml/20181113133520.20889-1-geert+renesas@glider.be/).

This is a safeguard dependency for "[PATCH v5] vfio: platform: Add
generic reset controller support"
(https://lore.kernel.org/lkml/20181113131508.18246-1-geert+renesas@glider.be/).

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
