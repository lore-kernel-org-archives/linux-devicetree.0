From: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Date: Mon, 31 Oct 2016 08:27:48 -0200
Message-ID: <CAF3+TqcFnXENmX4OpG9jzhPhuaq-EqNsRhhjKgFjHA96DLqK5g@mail.gmail.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
 <404315f0-fc9e-93e2-54df-f85e484d9389@st.com> <CAF3+TqdzESUNbkmAVv42pNv13wuyuPgGgksK3pJbORYw2a8ZFQ@mail.gmail.com>
 <65096fbe-3f06-c8db-fbe8-29f0be28cb61@st.com> <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
 <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ">" <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ">" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 5:09 AM, Rados=C5=82aw Pietrzyk
<radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Have you defined your sdio node within soc node ?

It is in the SOC node of the DSTI file.

>
> 2016-10-27 14:57 GMT+02:00 Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>
>> Hi Alex,
>>
>> On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue
>> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> > Hi Bruno,
>> >
>> >
>> > On 10/27/2016 12:43 PM, Bruno Herrera wrote:
>> >>
>> >> Hi Alex,
>> >>
>> >> On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue
>> >> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> >>>
>> >>> Hi Bruno,
>> >>>
>> >>> On 10/25/2016 11:06 PM, Bruno Herrera wrote:
>> >>>>
>> >>>>
>> >>>> Hi Alexandre,
>> >>>>
>> >>>>>
>> >>>>> stm32f469-disco and stm32f429-eval boards use SDRAM start address
>> >>>>> remapping
>> >>>>> (to @0) to boost performances. A DMA translation through
>> >>>>> "dma-ranges"
>> >>>>> property was needed for other masters than the M4 CPU.
>> >>>>> stm32f429-disco doesn't use remapping so doesn't need this DMA
>> >>>>> translation.
>> >>>>> This patches moves this DMA translation definition from stm32f429
>> >>>>> soc
>> >>>>> file
>> >>>>> to board files.
>> >>>>>
>> >>>>> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>> >>>>>
>> >>>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>>> b/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>>> index 13c7cd2..a763c15 100644
>> >>>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>>> @@ -82,6 +82,10 @@
>> >>>>>                 };
>> >>>>>         };
>> >>>>>
>> >>>>> +       soc {
>> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >>>>> +       };
>> >>>>> +
>> >>>>>         usbotg_hs_phy: usbphy {
>> >>>>>                 #phy-cells =3D <0>;
>> >>>>>                 compatible =3D "usb-nop-xceiv";
>> >>>>
>> >>>>
>> >>>>
>> >>>> Shouldn't also the peripheral dma-ranges property move to board
>> >>>> specific
>> >>>> too?
>> >>>> I  had this patch for while but I didn't had the time to submit:
>> >>>
>> >>>
>> >>>
>> >>> Well spot I forgot it. Actually, discussing with Arnd ysterday on
>> >>> IIRC,
>> >>> empty dma-ranges is not needed. Can you test on your side by removin=
g
>> >>> dma-ranges in usb node please ?
>> >>
>> >> Unfortunately will take a time for me to set up this environment on
>> >> the STM32F4-EVAL board.
>> >> And on the discovery boards we dont have this scenario. That was the
>> >> main reason I did not submit the patch right away.
>> >> My conclusion and I might be wrong but is based on the my tests with
>> >> SDIO device at STM32F469I-DISCO board.
>> >>
>> >> I started this issue as discussion at ST Forum but Maxime gave me the
>> >> hint.
>> >>
>> >>
>> >>
>> >> https://my.st.com/public/STe2ecommunities/mcu/Lists/cortex_mx_stm32/F=
lat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpublic%2fSTe2ecommuniti=
es%2fmcu%2fLists%2fcortex_mx_stm32%2fDMA2%20and%20SYSCFG_MEMRMP%20relations=
hip&FolderCTID=3D0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE=
46A77F0FFD06506F5B&currentviews=3D44
>> >>
>> >>> I will push a v2 by removing empty dma-ranges if tests are ok in you=
r
>> >>> side.
>> >>
>> >>
>> >> From my understating/conclusion is: when empty property(dma-ranges) i=
s
>> >> the device node, the mapping will be taken in consideration when usin=
g
>> >> DMA otherwise the mapping is ignored.
>> >> And in the SDIO case it is needed for DEV->MEM(SDRAM) and
>> >> MEM(SDRAM)->DEV. If it is not the case for the devices in question so
>> >> I suppose it can work without the property.
>> >
>> >
>> > For sure translation has to be done but I'm not sure that an empty
>> > "dma-ranges" is needed in device node to activate it. For Ethernet emp=
ty
>> > "dma-ranges" is not needed. I will try with usb.
>>
>> In the case of SDIO it is needed. As example this is my working SDIO nod=
e:
>>
>> sdio: sdio@40012c00 {
>> compatible =3D "arm,pl18x", "arm,primecell";
>> arm,primecell-periphid =3D <0x00480181>;
>> reg =3D <0x40012c00 0x400>;
>> dmas =3D  <&dma2 6 4 0x10400 0x3>, /* Logical - DevToMem */
>> <&dma2 3 4 0x10400 0x3>; /* Logical - MemToDev */
>> dma-names =3D "rx", "tx";
>> clocks =3D <&rcc 0 171>;
>> clock-names =3D "apb_pclk";
>> interrupts =3D <49>;
>> status =3D "disabled";
>> };
>>
>> &sdio {
>> status =3D "okay";
>> vmmc-supply =3D <&wlan_en>;
>> bus-width =3D <4>;
>> max-frequency =3D <24000000>;
>> pinctrl-names =3D "default";
>> pinctrl-0 =3D <&sdio_pins>;
>> ti,non-removable;
>> ti,needs-special-hs-handling;
>> dma-ranges;
>> cap-power-off-card;
>> keep-power-in-suspend;
>>
>> #address-cells =3D <1>;
>> #size-cells =3D <0>;
>> wlcore: wlcore@0 {
>> compatible =3D "ti,wl1835";
>> reg =3D <2>;
>> interrupt-parent =3D <&gpioa>;
>> interrupts =3D <8 IRQ_TYPE_EDGE_RISING>;
>> };
>> };
>>
>> >
>> > alex
>> >
>> >
>> >>
>> >>>
>> >>> Thanks in advance
>> >>> Alex
>> >>>
>> >>>
>> >>>>
>> >>>> Author: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >>>> Date:   Sun Oct 16 14:50:00 2016 -0200
>> >>>>
>> >>>>     ARM: DT: STM32: Use dma-ranges property per board not at dtsi
>> >>>> file
>> >>>>
>> >>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>> b/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>> index 6bfc595..2a22a82 100644
>> >>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> >>>> @@ -52,6 +52,10 @@
>> >>>>         model =3D "STMicroelectronics STM32429i-EVAL board";
>> >>>>         compatible =3D "st,stm32429i-eval", "st,stm32f429";
>> >>>>
>> >>>> +       soc {
>> >>>> +               dma-ranges =3D <0xC0000000 0x0 0x10000000>;
>> >>>> +       };
>> >>>> +
>> >>>>         chosen {
>> >>>>                 bootargs =3D "root=3D/dev/ram rdinit=3D/linuxrc";
>> >>>>                 stdout-path =3D "serial0:115200n8";
>> >>>> @@ -96,6 +100,7 @@
>> >>>>
>> >>>>  &ethernet0 {
>> >>>>         status =3D "okay";
>> >>>> +       dma-ranges;
>> >>>>         pinctrl-0       =3D <&ethernet0_mii>;
>> >>>>         pinctrl-names   =3D "default";
>> >>>>         phy-mode        =3D "mii-id";
>> >>>> @@ -116,6 +121,7 @@
>> >>>>  };
>> >>>>
>> >>>>  &usbotg_hs {
>> >>>> +       dma-ranges;
>> >>>>         dr_mode =3D "host";
>> >>>>         phys =3D <&usbotg_hs_phy>;
>> >>>>         phy-names =3D "usb2-phy";
>> >>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
>> >>>> b/arch/arm/boot/dts/stm32f429.dtsi
>> >>>> index 7d624a2..697a133 100644
>> >>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> >>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> >>>> @@ -59,7 +59,6 @@
>> >>>>         };
>> >>>>
>> >>>>         soc {
>> >>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >>>>
>> >>>>                 timer2: timer@40000000 {
>> >>>>                         compatible =3D "st,stm32-timer";
>> >>>> @@ -472,13 +471,11 @@
>> >>>>                         st,syscon =3D <&syscfg 0x4>;
>> >>>>                         snps,pbl =3D <8>;
>> >>>>                         snps,mixed-burst;
>> >>>> -                       dma-ranges;
>> >>>>                         status =3D "disabled";
>> >>>>                 };
>> >>>>
>> >>>>                 usbotg_hs: usb@40040000 {
>> >>>>                         compatible =3D "snps,dwc2";
>> >>>> -                       dma-ranges;
>> >>>>                         reg =3D <0x40040000 0x40000>;
>> >>>>                         interrupts =3D <77>;
>> >>>>                         clocks =3D <&rcc 0 29>;
>> >>>>
>> >>>>
>> >>>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
>> >>>>> b/arch/arm/boot/dts/stm32f429.dtsi
>> >>>>> index 0596d60..3a1cfdd 100644
>> >>>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> >>>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> >>>>> @@ -59,8 +59,6 @@
>> >>>>>         };
>> >>>>>
>> >>>>>         soc {
>> >>>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >>>>> -
>> >>>>>                 timer2: timer@40000000 {
>> >>>>>                         compatible =3D "st,stm32-timer";
>> >>>>>                         reg =3D <0x40000000 0x400>;
>> >>>>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
>> >>>>> b/arch/arm/boot/dts/stm32f469-disco.dts
>> >>>>> index 9e73656..c2213c0 100644
>> >>>>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
>> >>>>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
>> >>>>> @@ -64,6 +64,10 @@
>> >>>>>         aliases {
>> >>>>>                 serial0 =3D &usart3;
>> >>>>>         };
>> >>>>> +
>> >>>>> +       soc {
>> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >>>>> +       };
>> >>>>>  };
>> >>>>>
>> >>>>>  &clk_hse {
>> >>>>> --
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> Br.,
>> >>>> Bruno
>> >>>>
>> >>>
>> >
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
