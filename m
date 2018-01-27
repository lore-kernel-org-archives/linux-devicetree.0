From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Sat, 27 Jan 2018 21:30:11 +0100
Message-ID: <5a943937-3b59-514b-3939-df25daea5470@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <90983180-ae3b-5a31-9dc0-b62b978a0fba@gmail.com>
 <20180125123734.GC2099@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125123734.GC2099@umbus>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/25/2018 01:37 PM, David Gibson wrote:
> On Thu, Jan 25, 2018 at 10:14:38AM +0100, Marek Vasut wrote:
>> On 01/23/2018 10:17 PM, Frank Rowand wrote:
>> [...]
>>> My knowledge of bootloader use of the FDT is nearly non-existent, so
>>> I'm on thin ice here.  But I am guessing that a lot of bootloader
>>> processing of FDT data could be removed if the kernel would unflatten
>>> a chained FDT and overlay FDT(s).
>>>
>>> Comments from the bootloader folks on this topic would be much
>>> appreciated.
>>
>> U-Boot, when using DT as a hardware-description (rather than just
>> passing it to Linux) usually operates on the FDT, unless explicitly
>> configured to unflatten the tree. That later option is not enabled by
>> default.
>>
>> The reason for that is so that the DT can be accessed very early on, at
>> which point there may not be any other memory available than a very
>> limited stack and the FDT blob can still be located in some read-only
>> memory.
> 
> Right, this is exactly the reason that the fdt format is designed so
> you can read thing from it directly.  If you're doing more than very
> minor modifications, however, it does become worth unflattening.

Right

> Note that while unflatenning requires an allocator of sorts, it can be
> a trivial one.  A bump allocator in a fixed buffer of reasonable size
> would do fine.  You don't realy need a free(), since the bootloader
> has limited lifetime you can just leak nodes until you throw the lot
> away.

There's a regular mallocator in later stages of u-boot and a small
allocator for the early stages if needed. It's only the early one that
doesn't implement free() and it's only used for a very short time when
the system is still running from flash.

Thus far, I don't see a usecase for unflattening the tree that early,
but maybe one will come in the future.In the later stages, the design is
that you do unflatten only if you have a system which benefits from it
and has the resources to do that. Modern systems usually do, but there
are systems with weird limitations.

Since you can do a lot more than just booting with u-boot, leaking any
memory is a really bad idea.

> You can also use pointers into the flattened tree blob to avoid
> allocating space for the actual property values (except for ones you
> add later, obviously).  And if you make extensive enough changes that
> leaked pieces really do become a problem, you could do a
> flatten/unflatten pass to recompact everything.

-- 
Best regards,
Marek Vasut
