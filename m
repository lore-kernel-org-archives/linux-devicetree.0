From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: porter: add QSPI DT support
Date: Tue, 13 Oct 2015 10:04:47 +0900
Message-ID: <20151013010446.GC4836@verge.net.au>
References: <1738678.v21ITp1gYW@wasted.cogentembedded.com>
 <20151012000453.GC20025@verge.net.au>
 <CAMuHMdWzhasOwUe8dOba_QwpMfwR-3w_obO0aszr0R4XcBa24Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWzhasOwUe8dOba_QwpMfwR-3w_obO0aszr0R4XcBa24Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 12, 2015 at 08:53:26AM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 12, 2015 at 2:04 AM, Simon Horman <horms@verge.net.au> wrote:
> >> +     flash@0 {
> >> +             #address-cells = <1>;
> >> +             #size-cells = <1>;
> >> +             compatible = "spansion,s25fl512s", "jedec,spi-nor";
> >
> > spansion,s25fl512s is used in several dt files but it seems to be
> > undocumented. Do we have a plan to resolve this?
> 
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
> 
> - compatible : May include a device-specific string consisting of the
>                manufacturer and name of the chip. Bear in mind the DT binding
>                is not Linux-only, but in case of Linux, see the "m25p_ids"
>                table in drivers/mtd/devices/m25p80.c for the list of supported
>                chips.
>                Must also include "jedec,spi-nor" for any SPI NOR flash that can
>                be identified by the JEDEC READ ID opcode (0x9F).
> 
> Hence it's OK.

Thanks, I guess checkpatch needs to learn about that rule.
