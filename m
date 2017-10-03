From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 USB2.0 phy channel 3
Date: Tue, 3 Oct 2017 09:12:59 +0200
Message-ID: <CAMuHMdWJ67rMF5_O4o2EPORQFdWYsW8Mc0eVcnH6a-v8UnaU8Q@mail.gmail.com>
References: <1506925789-19392-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506925789-19392-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUGU-6c=QoekksFfpoP1x15vUmFu272wd5YqqnQe-RwmA@mail.gmail.com>
 <8642690f-a37b-2de3-7f59-9f0be99ef170@ideasonboard.com> <TY1PR06MB09920BDFB00D2BDA4840877AD87D0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdVJ1Z8mn14Q5j=2iG1w9b267YS_8EV5QuTmBMcog2-8Ww@mail.gmail.com> <TY1PR06MB09920874E5560AE204941018D8720@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <TY1PR06MB09920874E5560AE204941018D8720@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi Shimoda-san,

On Tue, Oct 3, 2017 at 5:13 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> -----Original Message-----
>> From: Geert Uytterhoeven
>> Sent: Monday, October 2, 2017 6:20 PM
>> On Mon, Oct 2, 2017 at 11:14 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> >> -----Original Message-----
>> >> From: Kieran Bingham
>> >> Sent: Monday, October 2, 2017 5:45 PM
>> >> On 02/10/17 09:20, Geert Uytterhoeven wrote:
>> >> > On Mon, Oct 2, 2017 at 8:29 AM, Yoshihiro Shimoda
>> >> > <yoshihiro.shimoda.uh@renesas.com> wrote:
>> >> >> This patch enables the USB2.0 phy channel 3. R-Car H3 ES2.0 has
>> >> >> this channel and we can use it on the Salvator-XS.
>> >> >>
>> >> >> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> >> >
>> >> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >> >
>> >> >> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> >> >> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
>> >> >> @@ -99,6 +99,11 @@
>> >> >>                 groups = "usb2";
>> >> >>                 function = "usb2";
>> >> >>         };
>> >> >> +
>> >> >> +       usb2_ch3_pins: usb2_ch3 {
>> >> >> +               groups = "usb2_ch3";
>> >> >> +               function = "usb2_ch3";
>> >> >> +       };
>> >> >>  };
>> >> >
>> >> > Using these pins requires changing SW31, disabling the interrupt capabilities
>> >> > of the ADV7482? Does the ADV7482 still work after that?
>> >
>> > Oops, I missed the usb2.0 pins are connected to ADV7482's interruption pins.
>> > But,
>> >
>> >> The ADV7482 is currently working without interrupts at the moment. However, I do
>> >> have hotplug and interrupt handling on my todo list, and infact I have already
>> >> started a patch adding interrupt support.
>> >>
>> >> The DT currently specifies the following interrupts for the ADV7482,
>> >>
>> >> +     video-receiver@70 {
>> >> +             compatible = "adi,adv7482";
>> >> +             interrupt-parent = <&gpio6>;
>> >> +             interrupt-names = "intrq1", "intrq2";
>> >> +             interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
>> >> +                          <31 IRQ_TYPE_LEVEL_LOW>;
>> >
>> > It seems Kieran-san is using non-conflict pins with usb2.0 ch3 :)
>> > According to the board datasheet, GP6_30 and GP6_31 are initial setting for ADV7482 and
>> > it doesn't conflict with USB 2.0 ch3 (USB2.0 ch3 pins are GP6_04 and GP6_21).
>>
>> Can the USB2.0 driver use GPIOs for PWEN and OVC?
>>
>> > So, I think we can use both usb 2.0 ch3 and ADV7482 if we don't change the SW31 from initial setting.
>>
>> OK. But in that case, DT should not configure pinctrl for "usb2_ch3",
>> but instead
>> describe that it uses GP6_04 and GP6_21.
>
> I'm afraid but I completely misunderstood the pin configurations on the Salvator-XS.
> I wrote right things below:
> - USB2.0 ch3 pins are GP6_30 and GP6_31.

OK.

>  - So, initial setting of the board will be conflict with the adv7482's interrupt pins.

Initial setting of SW31 is ON-ON-OFF-OFF-OFF-OFF, cfr. Section 2.1.22
("SW31 (Selects GPIO/USB Connection) Specifications") of the
Salvator-XS setup manual,
which is meant to accommodate the ADV7482 on both H3 and M3-W, like
was done on Salvator-X.

> - If we change the SW31 as alternative setting for usb, the adv7482's interrupt pins connect
>   to GP6_04 and GP6_21.

OK.

> And, I wrote my opinions below:
> - The adv7482 point of view:
>  - On both Salvator-X and Salvator-XS, adv7482's interrupt pins connected to GP6_30 and GP6_31.
>   - On Salvator-XS, adv7482's interrupt pins can be changed by SW31 and they connected to GP6_04 and GP6_21.

OK.

> - The usb2 ch3 point of view:
>  - It can be used on H3 ES2.0 only. (In other words, M3 cannot use the usb2 ch3.)

OK.

> - Summary
>  - We describe the adv7482's interrupt pins into both salvator-x.dtsi and salvator-xs.dtsi.
>   - In salvator-x.dtsi, adv7482 node uses GP6_30 and GP6_31.
>   - In salvator-xs.dtsi, adv7482 node uses GP6_04 and GP6_21.

While you could do this in salvator-xs.dtsi, doing so would mean users of
Salvator-X with M3-W have to change SW31 from the default configuration to
OFF-OFF-OFF-OFF-ON-ON (Note: we don't have r8a7796-salvator-xs.dts in
mainline yet).

>  - We describe the usb2 ch3 pfc node into r8a7795-salvator-xs.dtsi with "usb2_ch3" groups/function and
>     describe the SW31 configuration.
>
> What do you think?

I would keep the ADV7482 in salvator-common.dtsi using the GP6_3[01]
interrupts, like is done now.

In r8a7795-salvator-xs.dtsi, you can override the interrupts property to
GP6_{04,21}, with a comment saying:
  1. This is done to support the "usb2_ch3" pin group, and,
  2. This requires changing SW31 to OFF-OFF-ON-ON-ON-ON.

Users of Salvator-XS with M3-W don't have to change anything.

Does this sound OK?
Simon?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
