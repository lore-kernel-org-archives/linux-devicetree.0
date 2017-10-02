From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 USB2.0 phy channel 3
Date: Mon, 2 Oct 2017 11:20:00 +0200
Message-ID: <CAMuHMdVJ1Z8mn14Q5j=2iG1w9b267YS_8EV5QuTmBMcog2-8Ww@mail.gmail.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
 <8642690f-a37b-2de3-7f59-9f0be99ef170@ideasonboard.com> <TY1PR06MB09920BDFB00D2BDA4840877AD87D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <TY1PR06MB09920BDFB00D2BDA4840877AD87D0-/PRLmSCtZ16WJvbLRFYGcG0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Mon, Oct 2, 2017 at 11:14 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
>> -----Original Message-----
>> From: Kieran Bingham
>> Sent: Monday, October 2, 2017 5:45 PM
>> On 02/10/17 09:20, Geert Uytterhoeven wrote:
>> > On Mon, Oct 2, 2017 at 8:29 AM, Yoshihiro Shimoda
>> > <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
>> >> This patch enables the USB2.0 phy channel 3. R-Car H3 ES2.0 has
>> >> this channel and we can use it on the Salvator-XS.
>> >>
>> >> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> >
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> >
>> >> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> >> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> >> @@ -99,6 +99,11 @@
>> >>                 groups = "usb2";
>> >>                 function = "usb2";
>> >>         };
>> >> +
>> >> +       usb2_ch3_pins: usb2_ch3 {
>> >> +               groups = "usb2_ch3";
>> >> +               function = "usb2_ch3";
>> >> +       };
>> >>  };
>> >
>> > Using these pins requires changing SW31, disabling the interrupt capabilities
>> > of the ADV7482? Does the ADV7482 still work after that?
>
> Oops, I missed the usb2.0 pins are connected to ADV7482's interruption pins.
> But,
>
>> The ADV7482 is currently working without interrupts at the moment. However, I do
>> have hotplug and interrupt handling on my todo list, and infact I have already
>> started a patch adding interrupt support.
>>
>>
>> The DT currently specifies the following interrupts for the ADV7482,
>>
>> +     video-receiver@70 {
>> +             compatible = "adi,adv7482";
>> +             interrupt-parent = <&gpio6>;
>> +             interrupt-names = "intrq1", "intrq2";
>> +             interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
>> +                          <31 IRQ_TYPE_LEVEL_LOW>;
>
> It seems Kieran-san is using non-conflict pins with usb2.0 ch3 :)
> According to the board datasheet, GP6_30 and GP6_31 are initial setting for ADV7482 and
> it doesn't conflict with USB 2.0 ch3 (USB2.0 ch3 pins are GP6_04 and GP6_21).

Can the USB2.0 driver use GPIOs for PWEN and OVC?

> So, I think we can use both usb 2.0 ch3 and ADV7482 if we don't change the SW31 from initial setting.

OK. But in that case, DT should not configure pinctrl for "usb2_ch3",
but instead
describe that it uses GP6_04 and GP6_21.

> However, to avoid any trouble, should we explain this SW31 setting in the dts file?

Yes, it would be good to document that.

Thanks!

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
