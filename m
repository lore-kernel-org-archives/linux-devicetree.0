From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v24 9/9] Documentation: dt: chosen properties for arm64 kdump
Date: Tue, 30 Aug 2016 11:34:10 -0500
Message-ID: <CAL_JsqJ5SqesEL5QWX_NJj+gL2jpne4NN_WzADiH+1VB7CkvOA@mail.gmail.com>
References: <20160809015248.28414-2-takahiro.akashi@linaro.org>
 <20160809015747.28591-1-takahiro.akashi@linaro.org> <20160819132641.GA12709@rob-hp-laptop>
 <20160822042832.GJ20080@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160822042832.GJ20080-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 21, 2016 at 11:28 PM, AKASHI Takahiro
<takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Rob,
> [Cc: Mark]
>
> On Fri, Aug 19, 2016 at 08:26:41AM -0500, Rob Herring wrote:
>> On Tue, Aug 09, 2016 at 10:57:47AM +0900, AKASHI Takahiro wrote:
>> > From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
>> >
>> > Add documentation for
>> >     linux,crashkernel-base and crashkernel-size,
>> >     linux,usable-memory-range, and
>> >     linux,elfcorehdr
>> > used by arm64 kexec/kdump to decribe the kdump reserved area, and
>> > the elfcorehdr's location within it.
>> >
>> > Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
>> > [takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org:
>> >     renamed "usable-memory" to "usable-memory-range",
>> >     added "linux,crashkernel-base" and "-size" ]
>> > Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/chosen.txt | 50 ++++++++++++++++++++++++++++
>> >  1 file changed, 50 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
>> > index 6ae9d82..236188a 100644
>> > --- a/Documentation/devicetree/bindings/chosen.txt
>> > +++ b/Documentation/devicetree/bindings/chosen.txt
>> > @@ -52,3 +52,53 @@ This property is set (currently only on PowerPC, and only needed on
>> >  book3e) by some versions of kexec-tools to tell the new kernel that it
>> >  is being booted by kexec, as the booting environment may differ (e.g.
>> >  a different secondary CPU release mechanism)
>> > +
>> > +linux,crashkernel-base
>> > +linux,crashkernel-size
>> > +----------------------
>> > +These properties (currently used on PowerPC and arm64) indicates
>> > +the base address and the size, respectively, of the reserved memory
>> > +range for crash dump kernel.
>> > +e.g.
>> > +
>> > +/ {
>> > +   chosen {
>> > +           linux,crashkernel-base = <0x9 0xf0000000>;
>> > +           linux,crashkernel-size = <0x0 0x10000000>;
>> > +   };
>> > +};
>> > +
>> > +linux,usable-memory-range
>> > +-------------------------
>> > +
>> > +This property (currently used only on arm64) holds the memory range,
>> > +the base address and the size, which can be used as system ram on
>> > +the *current* kernel. Note that, if this property is present, any memory
>> > +regions under "memory" nodes in DT blob or ones marked as "conventional
>> > +memory" in EFI memory map should be ignored.
>> > +e.g.
>> > +
>> > +/ {
>> > +   chosen {
>> > +           linux,usable-memory-range = <0x9 0xf0000000 0x0 0x10000000>;
>> > +   };
>> > +};
>>
>> I've read the discussion on this. I think you should use the existing
>> linux,usable-memory property in the memory nodes. If UEFI systems don't
>> have memory nodes, then you can find an UEFI way to describe this. DT is
>> not the dumping ground for what doesn't fit in UEFI. How do x86 systems
>> work?
>
> Kdump for x86 passes the range of usable memory to crash dump kernel
> either via:
> (a) "memmap=nn@ss" command line parameter, or
> (b) faked BIOS e820 map (a sort of memory map table)
>
> (a) was rejected by Mark [1], and (b) is x86-specific.
>
> I believe that my approach is better because it works in the same way
> either on UEFI systems or DT-based systems.

So we have a new way for both UEFI and DT. If UEFI folks can't come up
with a standard way to do things in the UEFI standard, then we just
dump them into DT? I'd rather see alignment with existing DT systems
(PPC) and in particular the tools.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
