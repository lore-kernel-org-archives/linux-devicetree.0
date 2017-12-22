From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: remove eb-mp clcd IRQ
Date: Fri, 22 Dec 2017 08:12:24 +0100
Message-ID: <CAK8P3a1e87EKuV9gPO9H-D4rhBxx-GecWowkpLPDJ33HPQk3FQ@mail.gmail.com>
References: <20171221213146.3146805-1-arnd@arndb.de> <CACRpkdbCWZB1ZkrdGe0s0GfNVWEYY+NThy4ce-+SBtU-s=WNbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbCWZB1ZkrdGe0s0GfNVWEYY+NThy4ce-+SBtU-s=WNbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 11:08 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Dec 21, 2017 at 10:31 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
>> We get a dtc warning about the CLCD interrupt being invalid:
>>
>> arch/arm/boot/dts/arm-realview-eb-11mp-ctrevb.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
>>
>> According to the datasheet I found and the old board file, this
>> line is not connected, so I'm removing the respective properties here.
>>
>> Link: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0411d/index.html
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> There is some confusion here. There is CLCD "Color LCD"
> which is just a code name for PrimeCell PL111 and there is the actual
> character LCD which is a hardware thin to talk to a character LCD with
> some characters on.
>
>> diff --git a/arch/arm/boot/dts/arm-realview-eb-mp.dtsi b/arch/arm/boot/dts/arm-realview-eb-mp.dtsi
>
> So this DTS is for the ARM 11 MP core tile which is described in
> DUI0318F. It doesn't even list an IRQ for the character LCD.
>
>>  &charlcd {
>> -       interrupt-parent = <&intc>;
>> -       interrupts = <0  IRQ_TYPE_LEVEL_HIGH>;
>
> This was probably me thinking to go back and fill in the right
> IRQ and forgetting to actually do it. Sorry :(
>
>> +       /* CLCD is not connected here */
>
> Call it character LCD instead to avoid confusion please.
>
>> +       /delete-property/interrupt-parent;
>> +       /delete-property/interrupts;
>
> I don't understand this delete-property business (first time
> I see it, but the top level
> DTSI (arm-realview-eb.dtsi) does not define any interrupt
> so can't you just delete this whole &charlcd?
>
> I do think the reference design has a character LCD, and I
> do think it has an interrupt, it's just undocumented so
> someone with this board would have to test it manually
> to figure out which line it is. Whoever uses this design
> will get to it if ever.

Sounds good, can you prepare a patch for this?

We are getting very close to zero warnings now with the
latest arm-soc/for-next branch:

arch/arm/boot/dts/arm-realview-eb-11mp.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/arm-realview-eb-11mp-ctrevb.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/arm-realview-eb-a9mp.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/arm-realview-eb-a9mp-bbrevd.dtb: Warning
(interrupts_property): interrupts size is (8), expected multiple of 12
in /fpga/charlcd@10008000
arch/arm/boot/dts/s5pv210-smdkv210.dtb: Warning (interrupts_property):
Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-smdkc110.dtb: Warning (interrupts_property):
arch/arm/boot/dts/s5pv210-goni.dtb: Warning (interrupts_property):
Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-aquila.dtb: Warning (interrupts_property):
Missing interrupt-parent for /soc/ohci@ec300000
Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/s5pv210-torbreck.dtb: Warning (interrupts_property):
Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property):
Property 'cs-gpios', cell 6 is not a phandle reference in
/ahb/apb/spi@e0100000
arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Missing
property '#gpio-cells' in node /interrupt-controller@ec801000 or bad
phandle (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Property
'dmas', cell 4 is not a phandle reference in /ahb/apb/serial@b4100000
arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Missing
property '#dma-cells' in node /interrupt-controller@ec801000 or bad
phandle (referred from /ahb/apb/serial@b4100000:dmas[4])
arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpios_property):
hdmi,hpd-gpio property size (8) too small for cell size 2 in
/soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/stih410-b2120.dtb: Warning (gpios_property):
hdmi,hpd-gpio property size (8) too small for cell size 2 in
/soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/stih410-b2260.dtb: Warning (gpios_property):
hdmi,hpd-gpio property size (8) too small for cell size 2 in
/soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property):
power-gpio property size (12) too small for cell size 3 in
/ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property):
reset-gpio property size (12) too small for cell size 3 in
/ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property):
power-gpio property size (12) too small for cell size 3 in
/ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property):
reset-gpio property size (12) too small for cell size 3 in
/ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/ste-nomadik-s8815.dtb: Warning
(interrupts_property): Missing interrupt-parent for
/amba/clcd@10120000
arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning
(interrupts_property): Missing interrupt-parent for
/amba/clcd@10120000
arch/arm/boot/dts/spear600-evb.dtb: Warning (interrupts_property):
Missing interrupt-parent for /ahb/apb/rtc@fc900000

Can you also look at the nomadik warnings and possibly some of the others
if you have time? Unfortunately I'm heading out for my Christmas vacation
and can't do any others of these any more.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
