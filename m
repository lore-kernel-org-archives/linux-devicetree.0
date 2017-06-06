From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Tue, 6 Jun 2017 17:05:18 -0500
Message-ID: <CAL_JsqJwzipUt5Rd02jvygS-vJHPZavU2dK5=3nAYhQDjZOvVw@mail.gmail.com>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
 <1496688186.12947.10.camel@hp800z> <1496776664.3821.3.camel@seibold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496776664.3821.3.camel-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Holm Rauchfuss <holm.rauchfuss-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 6, 2017 at 2:17 PM, Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org> wrote:
> Hi Pantelis,
>
> thanks for the suggestion. This feature is not very well documented. I
> tried this on my rasp1 running 4.12.0-rc3 and it doesn't work. My
> source is:
>
> // rapsi example
> /dts-v1/;
> /plugin/;
>
> / {
>     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
>
>     fragment@0 {
>         target-path = "/soc/i2s@7e203000";
>         __overlay__ {
>             #address-cells = <0x00000001>;
>             #size-cells = <0x00000001>;
>             test = "test";
>             timer = <&{/soc/timer@7e0030000}>;
>         };
>     };
> };
>
>
> The resulting overlay is (decompiled with fdtdump):
>
> /dts-v1/;
> // magic:               0xd00dfeed
> // totalsize:           0x19a (410)
> // off_dt_struct:       0x38
> // off_dt_strings:      0x148
> // off_mem_rsvmap:      0x28
> // version:             17
> // last_comp_version:   16
> // boot_cpuid_phys:     0x0
> // size_dt_strings:     0x52
> // size_dt_struct:      0x110
>
> / {
>     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
>     fragment@0 {
>         target-path = "/soc/i2s@7e203000";
>         __overlay__ {
>             #address-cells = <0x00000001>;
>             #size-cells = <0x00000001>;
>             test = "test";
>             timer = <0xdeadbeef>;
>         };
>     };
>     __fixups__ {
>         /soc/timer@7e0030000 = "/fragment@0/__overlay__:timer:0";

Looks like you (Pantelis had the typo) have an extra 0 in 7e0030000
compared to your original example.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
