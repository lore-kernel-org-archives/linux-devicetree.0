From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Thu, 08 Jun 2017 08:51:14 +0200
Message-ID: <1496904674.7999.3.camel@seibold.net>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
         <1496688186.12947.10.camel@hp800z> <1496776664.3821.3.camel@seibold.net>
         <1496823091.28265.3.camel@hp800z>
         <CAL_JsqJcWD_ZYLL0M5K=3Uy4VhArf2iO+ObjtQer6xFPLXTWdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJcWD_ZYLL0M5K=3Uy4VhArf2iO+ObjtQer6xFPLXTWdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Holm Rauchfuss <holm.rauchfuss-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-06-07 at 17:19 -0500, Rob Herring wrote:
> On Wed, Jun 7, 2017 at 3:11 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Stefani,
> > 
> > On Tue, 2017-06-06 at 21:17 +0200, Stefani Seibold wrote:
> > > Hi Pantelis,
> > > 
> > > thanks for the suggestion. This feature is not very well
> > > documented. I
> > > tried this on my rasp1 running 4.12.0-rc3 and it doesn't work. My
> > > source is:
> > > 
> > > // rapsi example
> > > /dts-v1/;
> > > /plugin/;
> > > 
> > > / {
> > >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> > > 
> > >     fragment@0 {
> > >         target-path = "/soc/i2s@7e203000";
> > >         __overlay__ {
> > >             #address-cells = <0x00000001>;
> > >             #size-cells = <0x00000001>;
> > >             test = "test";
> > >             timer = <&{/soc/timer@7e0030000}>;
> > >         };
> > >     };
> > > };
> > > 
> > > 
> > > The resulting overlay is (decompiled with fdtdump):
> > > 
> > > /dts-v1/;
> > > // magic:             0xd00dfeed
> > > // totalsize:         0x19a (410)
> > > // off_dt_struct:     0x38
> > > // off_dt_strings:    0x148
> > > // off_mem_rsvmap:    0x28
> > > // version:           17
> > > // last_comp_version: 16
> > > // boot_cpuid_phys:   0x0
> > > // size_dt_strings:   0x52
> > > // size_dt_struct:    0x110
> > > 
> > > / {
> > >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> > >     fragment@0 {
> > >         target-path = "/soc/i2s@7e203000";
> > >         __overlay__ {
> > >             #address-cells = <0x00000001>;
> > >             #size-cells = <0x00000001>;
> > >             test = "test";
> > >             timer = <0xdeadbeef>;
> > >         };
> > >     };
> > >     __fixups__ {
> > >         /soc/timer@7e0030000 = "/fragment@0/__overlay__:timer:0";
> > >     };
> > > };
> > > 
> > > But this will not apply:
> > > 
> > > OF: resolver: overlay phandle fixup failed: -22
> > > create_overlay: Failed to resolve tree
> > > 
> > > 
> > 
> > Yes, it will not work as it is; my point is that you don't need the
> > magic __*__ node.
> > 
> > You will need to modify the overlay application code to live insert
> > a
> > phandle (if it doesn't exist) when it encounters a /path fixup.
> 
> phandles only exist if something in the base tree refers to that
> node.
> Adding them when they don't exist should definitely be something we
> support for overlays. But don't call that a broken DT. That would be
> a
> separate issue.
> 

Believe me it is broken. Due a NDA i am not able to give you more
details about the vendor. But there forgot do provide an device node
which must refer to the attached network and interrupt controller.

- Stefani

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
