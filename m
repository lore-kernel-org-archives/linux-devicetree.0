From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Thu, 08 Jun 2017 08:48:30 +0200
Message-ID: <1496904510.7999.1.camel@seibold.net>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
         <1496688186.12947.10.camel@hp800z> <1496776664.3821.3.camel@seibold.net>
         <1496823091.28265.3.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496823091.28265.3.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Holm Rauchfuss <holm.rauchfuss-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Wed, 2017-06-07 at 11:11 +0300, Pantelis Antoniou wrote:
> Hi Stefani,
> 
> On Tue, 2017-06-06 at 21:17 +0200, Stefani Seibold wrote:
> > Hi Pantelis,
> > 
> > thanks for the suggestion. This feature is not very well
> > documented. I
> > tried this on my rasp1 running 4.12.0-rc3 and it doesn't work. My
> > source is:
> > 
> > // rapsi example
> > /dts-v1/;
> > /plugin/;
> > 
> > / {
> >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> > 
> >     fragment@0 {
> >         target-path = "/soc/i2s@7e203000";
> >         __overlay__ {
> >             #address-cells = <0x00000001>;
> >             #size-cells = <0x00000001>;
> >             test = "test";
> >             timer = <&{/soc/timer@7e0030000}>;
> >         };
> >     };
> > };
> > 
> > 
> > The resulting overlay is (decompiled with fdtdump):
> > 
> > /dts-v1/;
> > // magic:		0xd00dfeed
> > // totalsize:		0x19a (410)
> > // off_dt_struct:	0x38
> > // off_dt_strings:	0x148
> > // off_mem_rsvmap:	0x28
> > // version:		17
> > // last_comp_version:	16
> > // boot_cpuid_phys:	0x0
> > // size_dt_strings:	0x52
> > // size_dt_struct:	0x110
> > 
> > / {
> >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> >     fragment@0 {
> >         target-path = "/soc/i2s@7e203000";
> >         __overlay__ {
> >             #address-cells = <0x00000001>;
> >             #size-cells = <0x00000001>;
> >             test = "test";
> >             timer = <0xdeadbeef>;
> >         };
> >     };
> >     __fixups__ {
> >         /soc/timer@7e0030000 = "/fragment@0/__overlay__:timer:0";
> >     };
> > };
> > 
> > But this will not apply:
> > 
> > OF: resolver: overlay phandle fixup failed: -22
> > create_overlay: Failed to resolve tree
> > 
> > 
> 
> Yes, it will not work as it is; my point is that you don't need the
> magic __*__ node.
> 

The magic __fixups__ node was inserted by the device tree compiler. I
use the dtc from https://github.com/pantoniou/dtc at commit
d990b8013889b816ec054c7e07a77db59c56c400.

> You will need to modify the overlay application code to live insert a
> phandle (if it doesn't exist) when it encounters a /path fixup.
> 

That is part of my patch!

> > Anyway, the reason for my patch is that i can reference to nodes
> > which
> > lacks a phandle. The phandle will be created on the fly and also
> > destroyed when the overlay is unloaded.
> > 
> > I have a real use case for this patch:
> > 
> > I have a BIOS on some ARM64 servers which provides broken device
> > tree.
> > It also lacks some devices in this tree which needs references to
> > other
> > devices which lacks a phandle.
> > 
> > Since the BIOSes are closed source i need a way to work arround
> > this
> > problem without patching all the drivers involved to this devices.
> > 
> > Hope this helps to understand the reason for this patch.
> > 
> 
> FWIW your problem seems like something that would happen on the
> field.
> We can berate the vendor of not providing the correct device tree,
> but
> in the end workarounds for broken vendor things are common in the
> kernel.
> 

Yes, that is the way how linux do the things. Linux has a long history
to bypassing bugs of BIOSes, ACPI or broken devices.

Greetings,
Stefani

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
