From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] fdtdump: Prettify output of properties
Date: Thu, 15 Jun 2017 18:17:20 -0700
Message-ID: <594331A0.6050305@gmail.com>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497452030-15588-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170614150639.GF2614@umbus> <20170615235230.GP10782@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615235230.GP10782@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tom,

On 06/15/17 16:52, Tom Rini wrote:
> On Wed, Jun 14, 2017 at 11:06:39PM +0800, David Gibson wrote:
>> On Wed, Jun 14, 2017 at 05:53:49PM +0300, Pantelis Antoniou wrote:
>>> Dumping files with large properties results in output with
>>> arbitrary long lines.
>>>
>>> Original (manual line breaks inserted; it's a single long line):
>>>
>>> / {
>>>     int = <0x00000001 0x00000024 0x00000004 0x00000000 \
>>> 0x000502a4 0x000000df 0x00000003 0x13885783 0x13885783 \
>>> 0x00000002 0x62797465 0x00000000 0x00000000 0x00000000 \
>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000 \
>>> 0x00000000 0x00000000 0x00000000 0x00000000 0x00000000>;
>>> };
>>>
>>> After prettification:
>>>
>>> / {
>>>     int = <0x00000001 0x00000002 0x00000008 0x00000010 0x00000024 0x000000ab>,
>>>           <0x00000001 0x00000017 0x00000004 0x00000038 0x00000007 0x00000009>,
>>>           <0x00000000 0x00000068 0x00000214 0x0000b8d9 0x000502a4 0x00000001>,
>>>           <0x00000004 0x0000002b 0x000000df 0x00000003 0x00000002 0x00000001>;
>>> };
>>>
>>> There are two new options (-w/--width) and (-S/--shift).
>>>
>>> Width is the terminal width, shift is the amount of spaces each nest level
>>> increases by.
>>>
>>> Width by default is set to 80, and shift to 4.
>>
>> Nack.
>>
>> fdtdump is supposed to be a trivial debug tool.   If you want to
>> decompile dtbs "for real" use dtc -I dtb -O dts.
> 
> There's been times, entirely unrelated to what Pantelis is doing, where
> I've used fdtdump in production cases because I needed to whack a few
> things around.  If it's just supposed to be a trivial debug tool, we've
> likely moved well beyond the point where we need to keep trivial tools
> around if they shouldn't be more widely used, IMHO.

Let me paraphrase what I think that said:

   If a trivial debug tool is used by a wide audience then we should get
   rid of the tool.

I suspect I misunderstood.  Can you clarify?

Thanks,

Frank

> Swinging back around to what Pantelis is talking about, it would be kind
> of annoying, but we could probably integrate dtc into U-Boot like the
> kernel has.  Is that where we're at then?  Thanks!
> 
