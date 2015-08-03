From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3] ARM: shmobile: silk: initial device tree
Date: Mon, 3 Aug 2015 17:19:21 +0200
Message-ID: <CAMuHMdVRKjO9iQfhQYJUb9rBKCX3TS+_Vq_SWr0YoY7ov2BCLg@mail.gmail.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
	<2360526.88foRQAOiM@wasted.cogentembedded.com>
	<CAMuHMdWT=nzsFuM-vfe5GoAtDE-AtW4LAZoEnBGGVZm54-mAzg@mail.gmail.com>
	<55BF8522.1010906@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55BF8522.1010906-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Mon, Aug 3, 2015 at 5:13 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 08/03/2015 04:00 PM, Geert Uytterhoeven wrote:
>>> --- /dev/null
>>> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
>>> @@ -0,0 +1,51 @@
>
>>> +/ {
>>> +       model = "SILK";
>>> +       compatible = "renesas,silk", "renesas,r8a7794";
>
>> WARNING: DT compatible string "renesas,silk" appears un-documented --
>> check ./Documentation/devicetree/bindings/
>
>> Do you plan to update Documentation/devicetree/bindings/arm/shmobile.txt?
>
>    No, I had no idea I should record the board names somewhere too...

All "compatible" values should be documented before being used in a
.dts(i) file.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
