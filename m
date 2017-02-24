From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/3] extcon: int3496: Rename GPIO pins in accordance
 with binding
Date: Fri, 24 Feb 2017 14:08:08 +0200
Message-ID: <CAHp75Vf-qJDX8fk1nRbzgUTGRaWK41fwO2y87Da-M+ob=3UjKQ@mail.gmail.com>
References: <20170223103156.109643-1-andriy.shevchenko@linux.intel.com>
 <CGME20170223103203epcas1p1512e927e6f4c85e793d65c2e426ed1d6@epcas1p1.samsung.com>
 <20170223103156.109643-2-andriy.shevchenko@linux.intel.com> <58AF8998.5000601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58AF8998.5000601-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Cohen <david.a.cohen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 24, 2017 at 3:17 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On 2017=EB=85=84 02=EC=9B=94 23=EC=9D=BC 19:31, Andy Shevchenko wrote:
>> First of all, add an optional binding for external muxer which might be
>> used.

>> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>> @@ -10,6 +10,9 @@ Either one of id-gpio or vbus-gpio must be present. Bo=
th can be present as well.
>>  - id-gpio: gpio for USB ID pin. See gpio binding.
>>  - vbus-gpio: gpio for USB VBUS pin.
>>
>> +Optional properties:
>> +- mux-gpios: gpio for USB external muxer
>
> The Documentation/extcon/intel-int3496.txt includes
> already the information for id/vbus/mux pin.

Thanks for pointing this out...

> The extcon-usb-gpio.txt is not related with the extcon-int3496 driver.

...but the bindings is related to ACPI somehow. I dunno why in
extcon-usb-gpio.c we have
        if (!np && !ACPI_HANDLE(dev))

...and thus it means either firmware chooses we better to have
standardized bindings in both cases.

OTOH mux-gpios indeed doesn't make sense for extcon-usb-gpio.c and
would be removed from the bindings.

I'll update patches accordingly.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
