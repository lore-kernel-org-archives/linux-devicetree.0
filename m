Return-Path: <SRS0=IScD=OQ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
 <20181207013513.GV768@umbus.fritz.box>
In-Reply-To: <20181207013513.GV768@umbus.fritz.box>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Dec 2018 09:19:24 +0100
Message-ID: <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
Subject: Re: phandles using absolute paths in DT overlays
Content-Type: text/plain; charset="UTF-8"
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi David,

Thanks for your answer!

On Fri, Dec 7, 2018 at 2:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
> On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
> > Some early revisions of SoCs may have hardware bugs that need to be
> > fixed up in DT.  Currently we are handling this by including DTS files
> > and fixing up nodes and properties, to create different DTB files for
> > different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
> >
> > As an alternative, I'm envisioning the use of DT overlays and the
> > fdtoverlay tool, in the hope of simplifying the generation of DTBs for
> > the various SoC/board combinations.
> >
> > Ideally, such DTBs would not contain symbols, to avoid inflating DTB
> > size.  Hence if fixup overlays would not contain symbolic references,
> > there would be no need for symbols.
> >
> > For anchors, the "&{/path/to/node@address}" syntax is working fine.
> > For phandles, while documented on
> > https://elinux.org/Device_Tree_Mysteries, and while working fine for the
> > non-overlay case, dtc seems to have issues interpreting the DTB:
> >
> >     $ scripts/dtc/dtc -I dtb -O dts my.dtb  | less
> >     <stdout>: ERROR (property_name_chars):
> > /__fixups__:/path/to/node@deadbeef: Bad     character '/' in property
> > name
> >     ERROR: Input tree has errors, aborting (use -f to force output)
> >
> > With -f, the fixup generated seems to contain the expected value, though:
> >
> >     __fixups__ {
> >         /path/to/node@deadbeef = "/fragment@0/__overlay__:power-domains:0";
> >     };
> >
> > When using ftdoverlay, the situation is worse:
> >
> >     Failed to apply my.dtb (-1)
> >
> > Are these known issues?
>
> Unfortunately, this can't work with the current overlay format.  We
> have a specific syntax to allow the target of an overlay fragment to
> specified as a path, but phandle references by path won't work.
>
> The problem is that the encoding of the fixups node has the fixup
> target as a property name, and as the error says '/' is an illegal
> character in property names - for a bunch of good reasons, so we can't
> just go and remove that restriction.

For the uneducated, can you please explain why '/' is an illegal character,
and why it can't be special cased for phandle references by path in overlays?

> So to allow this we'd need to come up with a different encoding for
> path-targeted fixups and add support for it in the various pieces of
> the chain.
>
> One way to do that would be to entirely rework the overlay format to
> something more sensible, which would have a number of other benefits.

IC.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
