From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Date: Fri, 15 May 2015 13:02:53 -0700
Message-ID: <20150515200253.GM11598@ld-irv-0074>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <5554DF5E.4020802@wwwdotorg.org>
 <CAMuHMdW6bDjEx+EkqLQmGCZTap-77w2wWiHpra+2pLPexwAWPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6bDjEx+EkqLQmGCZTap-77w2wWiHpra+2pLPexwAWPw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, MTD Maling List <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 10:26:41PM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2015 at 7:46 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > On 05/14/2015 11:32 AM, Brian Norris wrote:
> >> In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add
> >> "nor-jedec"
> >> binding"), we added a generic "nor-jedec" binding to catch all
> >> mostly-compatible SPI NOR flash which can be detected via the READ ID
> >> opcode (0x9F). This was discussed and reviewed at the time, however
> >> objections have come up since then as part of this discussion:
> >>
> >>    http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074
> >>
> >> It seems the parties involved agree that "jedec,spi-nor" does a better
> >> job of capturing the fact that this is SPI-specific, not just any NOR
> >> flash.
> >>
> >> This binding was only merged for v4.1-rc1, so it's still OK to change
> >> the naming.
> >>
> >> At the same time, let's move the documentation to a better name.
> >>
> >> Next up: prune the m25p_ids[] table to the minimal necessary listing, so
> >> we can stop referring to code (drivers/mtd/devices/m25p80.c) from the
> >> documentation.
> >
> > There's no need to change the code to update the documentation. Simply paste
> > the list of valid device IDs into the documentation. The binding
> > documentation needs to be completely standalone anyway. Binding
> > documentation should never refer to Linux driver code as part of their
> > definition.

Of course they shouldn't refer to the driver. That's the main point of
my comment. But just because the ID made its way into the driver doesn't
mean it's always a useful or necessary DT binding. More below.

> > You can never remove the currently-supported device-specific IDs from the
> > driver, since existing DTs need to continue working forever, even with
> > future drivers/kernels.
> >
> > The binding document should also always include a complete list of supported
> > flash devices. Standard practice is that the DT compatible property contains
> > a list of compatible values, starting with the device-specific value, and
> > followed by any generic values. All of those values should be standardized
> > and specified in the DT documentation, even if the DT binding is written in
> > such a way that a compliant driver need only actively match on the generic
> > value. The device-specific values may not be used today, but are present in
> > case some device-specific workaround needs to be retro-actively
> > implemented/enabled, since that needs to happen for existing DTs too.
> 
> Indeed, all supported flash devices should be listed in the DT binding
> documentation, so checkpatch can validate dts changes:
> 
> $ scripts/checkpatch.pl -f arch/arm/boot/dts/r8a7791-koelsch.dts
> 
> [...]
> 
> WARNING: DT compatible string "spansion,s25fl512s" appears
> un-documented -- check ./Documentation/devicetree/bindings/
> #493: FILE: arch/arm/boot/dts/r8a7791-koelsch.dts:493:
> + compatible = "spansion,s25fl512s", "nor-jedec";

But not all entries in m25p80.c are actually used as DT bindings. There
are platform devices that share the same mechanism; there are
devices which are 99.9% (100%?) compatible with others on the list and
don't actually require a separate DT binding at all; and there are
entries that were added just for the SW support, while any user was
still binding against the original "<manufacturer>,m25p80".

Anyway, I'll consider your suggestions, and I'll probably include most
or all all the ID strings in the binding documentation in the end.

> >> I'd *really* like to get an 'ack' from a DT maintainer for this, those
> >> those
> >> are apparently very hard to come by. And I'd really not like to have to
> >> revisit
> >> this again in a few weeks. We have patches getting queued up for 4.2 that
> >> are
> >> using the "nor-jedec" binding, and I'd like to nip those in the bud ASAP.
> >
> >
> > I am not a DT maintainer, but the DT documentation part of this change:
> > Acked-by: Stephen Warren <swarren@nvidia.com>
> 
> Likewise,
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks all. I see that I've gotten an ack from Mark as well (thanks!),
so I'll apply this (plus the fixup I just sent) to linux-mtd.git and
probably pullreq it before the weekend is over. I'll assume Rafal and
Geert will take care of following up on their DTS submissions that added
"nor-jedec", but let me know if you'd rather me take care of it. I'll
try to keep an eye open as we get nearer to the next merge window, to
make sure the wrong entries don't get through.

BTW, in case I misled anyone previously: I believe there are no
"nor-jedec" entries in *.dts for Linus' current tip; there are only
entries queued up in linux-next for 4.2, presumably.

Brian
