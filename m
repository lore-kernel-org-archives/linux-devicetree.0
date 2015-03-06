From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: Add Pistachio SoC pin control binding document
Date: Fri, 6 Mar 2015 10:10:18 -0800
Message-ID: <CAL1qeaFcQFBydV7Gnkyp_w9d7M4yivEmX-1tB0OhbtocYeO=AQ@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-2-git-send-email-abrestic@chromium.org>
	<CACRpkdbCavYLk-Uo8hjTrGcGLJe6NEB9dVPVNm_fyd3eGccnEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbCavYLk-Uo8hjTrGcGLJe6NEB9dVPVNm_fyd3eGccnEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 6, 2015 at 3:37 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
> <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
>> Add a device-tree binding document for the pin controller present
>> on the IMG Pistachio SoC.
>>
>> Signed-off-by: Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> (...)
>> +Note that the GPIO bank sub-nodes *must* be listed in order.
>
> Usually we use aliases to mark the order of things. e.g.:
>
>         aliases {
>                 gpio0 = &gpio0;
>                 gpio1 = &gpio1;
>                 gpio2 = &gpio2;
>                 ethernet0 = &eth0;
>                 ethernet1 = &eth1;
>         };
>
> (arch/arm/boot/dts/armada-375.dtsi)

Ok.

>> +Required properties for pin configuration sub-nodes:
>> +----------------------------------------------------
>> + - pins: List of pins to which the configuration applies. See below for a
>> +   list of possible pins.
>> +
>> +Optional properties for pin configuration sub-nodes:
>> +----------------------------------------------------
>> + - function: Mux function for the specified pins. This is not applicable for
>> +   non-MFIO pins. See below for a list of valid functions for each pin.
>> + - bias-high-impedance: Enable high-impedance mode.
>> + - bias-pull-up: Enable weak pull-up.
>> + - bias-pull-down: Enable weak pull-down.
>> + - bias-bus-hold: Enable bus-keeper mode.
>> + - drive-strength: Drive strength in mA. Supported values: 2, 4, 8, 12.
>> + - input-schmitt-enable: Enable Schmitt trigger.
>> + - input-schmitt-disable: Disable Schmitt trigger.
>> + - slew-rate: Slew rate control. 0 for slow, 1 for fast.
>
> We actually haven't specified that function+pins is a valid pattern,
> a lot of drivers just started doing that :(
>
> function+groups is documented for muxing.
>
> group + config opts is documented for config.
>
> Please consider patching the generic bindings to reflect this
> mux use of pins... We need to discuss it.

Sure, I can update that documentation.

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
