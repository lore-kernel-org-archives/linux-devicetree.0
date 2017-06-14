From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Wed, 14 Jun 2017 22:12:54 +0300
Message-ID: <1497467574.28265.16.camel@hp800z>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
         <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
         <20170614150639.GF2614@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170614150639.GF2614@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, 2017-06-14 at 23:06 +0800, David Gibson wrote:
> On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
> > Dumping files with large properties results in output with
> > arbitrary long lines.
> > 
> > Original (manual line breaks inserted; it's a single long line):
> > 
> > / {
> >     int = <0x00000001 0x00000024 0x00000004 0x00000000 \
> > 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
> > 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
> > 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
> > 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
> > };
> > 
> > After prettification:
> > 
> > / {
> >     int = <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0x000000ab>,
> >           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x00000009>,
> >           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x00000001>,
> >           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x00000001>;
> > };
> > 
> > There are two new options (-w/--width) and (-S/--shift).
> > 
> > Width is the terminal width, shift is the amount of spaces each nest level
> > increases by.
> > 
> > Width by default is set to 80, and shift to 4.
> 
> Nack.
> 
> fdtdump is supposed to be a trivial debug tool.   If you want to
> decompile dtbs "for real" use dtc -I dtb -O dts.
> 

I'm afraid it's not so clear cut.

True, you can use dtc on the host to dump a blob to DTS in a similar
manner to fdtdump (with the prettified output is much better with this
patch).

Although the size of the dtc compiler package is larger than fdtdump by
about 5 times (this is not that important nowdays), the biggest use is
for restricted environment where the full dtc compiler just can't work.

A bootloader or something small can easily incorporate fdtdump for
dumping out blobs, while including dtc is not even be possible.

Anyway, the purpose of this patch is to make an already existing tool
better. If you feel that strongly about it duplicating functionality you
should just remove it and leave it at that.

Regards

-- Pantelis
