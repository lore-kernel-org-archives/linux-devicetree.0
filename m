From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
Date: Tue, 13 Dec 2016 11:18:45 +0100
Message-ID: <CAMpxmJU2Xn8NZnx7S6Eo0Syh-KVKWVNsJ1zATkwYciXPdDfdTw@mail.gmail.com>
References: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
 <1481547942-24775-5-git-send-email-bgolaszewski@baylibre.com> <9d5fa409-bb4f-f62b-2548-0a3b82228e08@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9d5fa409-bb4f-f62b-2548-0a3b82228e08-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-12-13 9:46 GMT+01:00 Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>:
> Hi,
>
> On 12/12/16 15:05, Bartosz Golaszewski wrote:
>
>> +&lcdc {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&lcd_pins>;
>> +
>> +     ports {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             lcdc_out: port@1 {
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +                     reg = <1>;
>> +
>> +                     lcdc_out_vga: endpoint {
>> +                             reg = <0>;
>> +                             remote-endpoint = <&vga_bridge_in>;
>> +                     };
>> +             };
>> +     };
>> +};
>>
>
> This is not correct. LCDC has just one output, so port@1 doesn't make
> sense. It's port@0. But with just one port, you can leave "ports" away.
> And you don't need the port's label for anything, if I'm not mistaken. So:
>
> &lcdc {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&lcd_pins>;
>
>         port {
>                 lcdc_out_vga: endpoint {
>                         remote-endpoint = <&vga_bridge_in>;
>                 };
>         };
> };
>
>  Tomi
>

Right, fixed in v7.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
