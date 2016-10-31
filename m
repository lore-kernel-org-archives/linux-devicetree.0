Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF3+TqcFnXENmX4OpG9jzhPhuaq-EqNsRhhjKgFjHA96DLqK5g@mail.gmail.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
 <404315f0-fc9e-93e2-54df-f85e484d9389@st.com> <CAF3+TqdzESUNbkmAVv42pNv13wuyuPgGgksK3pJbORYw2a8ZFQ@mail.gmail.com>
 <65096fbe-3f06-c8db-fbe8-29f0be28cb61@st.com> <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
 <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw@mail.gmail.com> <CAF3+TqcFnXENmX4OpG9jzhPhuaq-EqNsRhhjKgFjHA96DLqK5g@mail.gmail.com>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Mon, 31 Oct 2016 15:14:54 +0100
Message-ID: <CAFvLkMQ6YMg4sf2Ug8x4-YshwnjbLz3aVzm+JpKP6zG9r-WU4Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Content-Type: multipart/alternative; boundary=94eb2c0d90580c4db0054029d557
To: Bruno Herrera <bruherrera@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk, ">" <peter.griffin@linaro.org>, ">" <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c0d90580c4db0054029d557
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is weird because dma ddresses are recalculated using parent's
dma-ranges property and soc already has it so there should be absolutely no
problem.

2016-10-31 11:27 GMT+01:00 Bruno Herrera <bruherrera@gmail.com>:

> On Fri, Oct 28, 2016 at 5:09 AM, Rados=C5=82aw Pietrzyk
> <radoslaw.pietrzyk@gmail.com> wrote:
> > Have you defined your sdio node within soc node ?
>
> It is in the SOC node of the DSTI file.
>
> >
> > 2016-10-27 14:57 GMT+02:00 Bruno Herrera <bruherrera@gmail.com>:
> >>
> >> Hi Alex,
> >>
> >> On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue
> >> <alexandre.torgue@st.com> wrote:
> >> > Hi Bruno,
> >> >
> >> >
> >> > On 10/27/2016 12:43 PM, Bruno Herrera wrote:
> >> >>
> >> >> Hi Alex,
> >> >>
> >> >> On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue
> >> >> <alexandre.torgue@st.com> wrote:
> >> >>>
> >> >>> Hi Bruno,
> >> >>>
> >> >>> On 10/25/2016 11:06 PM, Bruno Herrera wrote:
> >> >>>>
> >> >>>>
> >> >>>> Hi Alexandre,
> >> >>>>
> >> >>>>>
> >> >>>>> stm32f469-disco and stm32f429-eval boards use SDRAM start addres=
s
> >> >>>>> remapping
> >> >>>>> (to @0) to boost performances. A DMA translation through
> >> >>>>> "dma-ranges"
> >> >>>>> property was needed for other masters than the M4 CPU.
> >> >>>>> stm32f429-disco doesn't use remapping so doesn't need this DMA
> >> >>>>> translation.
> >> >>>>> This patches moves this DMA translation definition from stm32f42=
9
> >> >>>>> soc
> >> >>>>> file
> >> >>>>> to board files.
> >> >>>>>
> >> >>>>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
> >> >>>>>
> >> >>>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>>> index 13c7cd2..a763c15 100644
> >> >>>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>>> @@ -82,6 +82,10 @@
> >> >>>>>                 };
> >> >>>>>         };
> >> >>>>>
> >> >>>>> +       soc {
> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
> >> >>>>> +       };
> >> >>>>> +
> >> >>>>>         usbotg_hs_phy: usbphy {
> >> >>>>>                 #phy-cells =3D <0>;
> >> >>>>>                 compatible =3D "usb-nop-xceiv";
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>> Shouldn't also the peripheral dma-ranges property move to board
> >> >>>> specific
> >> >>>> too?
> >> >>>> I  had this patch for while but I didn't had the time to submit:
> >> >>>
> >> >>>
> >> >>>
> >> >>> Well spot I forgot it. Actually, discussing with Arnd ysterday on
> >> >>> IIRC,
> >> >>> empty dma-ranges is not needed. Can you test on your side by
> removing
> >> >>> dma-ranges in usb node please ?
> >> >>
> >> >> Unfortunately will take a time for me to set up this environment on
> >> >> the STM32F4-EVAL board.
> >> >> And on the discovery boards we dont have this scenario. That was th=
e
> >> >> main reason I did not submit the patch right away.
> >> >> My conclusion and I might be wrong but is based on the my tests wit=
h
> >> >> SDIO device at STM32F469I-DISCO board.
> >> >>
> >> >> I started this issue as discussion at ST Forum but Maxime gave me t=
he
> >> >> hint.
> >> >>
> >> >>
> >> >>
> >> >> https://my.st.com/public/STe2ecommunities/mcu/Lists/
> cortex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpubl=
ic%
> 2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%
> 2fDMA2%20and%20SYSCFG_MEMRMP%20relationship&FolderCTID=3D
> 0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE46
> A77F0FFD06506F5B&currentviews=3D44
> >> >>
> >> >>> I will push a v2 by removing empty dma-ranges if tests are ok in
> your
> >> >>> side.
> >> >>
> >> >>
> >> >> From my understating/conclusion is: when empty property(dma-ranges)
> is
> >> >> the device node, the mapping will be taken in consideration when
> using
> >> >> DMA otherwise the mapping is ignored.
> >> >> And in the SDIO case it is needed for DEV->MEM(SDRAM) and
> >> >> MEM(SDRAM)->DEV. If it is not the case for the devices in question =
so
> >> >> I suppose it can work without the property.
> >> >
> >> >
> >> > For sure translation has to be done but I'm not sure that an empty
> >> > "dma-ranges" is needed in device node to activate it. For Ethernet
> empty
> >> > "dma-ranges" is not needed. I will try with usb.
> >>
> >> In the case of SDIO it is needed. As example this is my working SDIO
> node:
> >>
> >> sdio: sdio@40012c00 {
> >> compatible =3D "arm,pl18x", "arm,primecell";
> >> arm,primecell-periphid =3D <0x00480181>;
> >> reg =3D <0x40012c00 0x400>;
> >> dmas =3D  <&dma2 6 4 0x10400 0x3>, /* Logical - DevToMem */
> >> <&dma2 3 4 0x10400 0x3>; /* Logical - MemToDev */
> >> dma-names =3D "rx", "tx";
> >> clocks =3D <&rcc 0 171>;
> >> clock-names =3D "apb_pclk";
> >> interrupts =3D <49>;
> >> status =3D "disabled";
> >> };
> >>
> >> &sdio {
> >> status =3D "okay";
> >> vmmc-supply =3D <&wlan_en>;
> >> bus-width =3D <4>;
> >> max-frequency =3D <24000000>;
> >> pinctrl-names =3D "default";
> >> pinctrl-0 =3D <&sdio_pins>;
> >> ti,non-removable;
> >> ti,needs-special-hs-handling;
> >> dma-ranges;
> >> cap-power-off-card;
> >> keep-power-in-suspend;
> >>
> >> #address-cells =3D <1>;
> >> #size-cells =3D <0>;
> >> wlcore: wlcore@0 {
> >> compatible =3D "ti,wl1835";
> >> reg =3D <2>;
> >> interrupt-parent =3D <&gpioa>;
> >> interrupts =3D <8 IRQ_TYPE_EDGE_RISING>;
> >> };
> >> };
> >>
> >> >
> >> > alex
> >> >
> >> >
> >> >>
> >> >>>
> >> >>> Thanks in advance
> >> >>> Alex
> >> >>>
> >> >>>
> >> >>>>
> >> >>>> Author: Bruno Herrera <bruherrera@gmail.com>
> >> >>>> Date:   Sun Oct 16 14:50:00 2016 -0200
> >> >>>>
> >> >>>>     ARM: DT: STM32: Use dma-ranges property per board not at dtsi
> >> >>>> file
> >> >>>>
> >> >>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>> index 6bfc595..2a22a82 100644
> >> >>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >> >>>> @@ -52,6 +52,10 @@
> >> >>>>         model =3D "STMicroelectronics STM32429i-EVAL board";
> >> >>>>         compatible =3D "st,stm32429i-eval", "st,stm32f429";
> >> >>>>
> >> >>>> +       soc {
> >> >>>> +               dma-ranges =3D <0xC0000000 0x0 0x10000000>;
> >> >>>> +       };
> >> >>>> +
> >> >>>>         chosen {
> >> >>>>                 bootargs =3D "root=3D/dev/ram rdinit=3D/linuxrc";
> >> >>>>                 stdout-path =3D "serial0:115200n8";
> >> >>>> @@ -96,6 +100,7 @@
> >> >>>>
> >> >>>>  &ethernet0 {
> >> >>>>         status =3D "okay";
> >> >>>> +       dma-ranges;
> >> >>>>         pinctrl-0       =3D <&ethernet0_mii>;
> >> >>>>         pinctrl-names   =3D "default";
> >> >>>>         phy-mode        =3D "mii-id";
> >> >>>> @@ -116,6 +121,7 @@
> >> >>>>  };
> >> >>>>
> >> >>>>  &usbotg_hs {
> >> >>>> +       dma-ranges;
> >> >>>>         dr_mode =3D "host";
> >> >>>>         phys =3D <&usbotg_hs_phy>;
> >> >>>>         phy-names =3D "usb2-phy";
> >> >>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>> index 7d624a2..697a133 100644
> >> >>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>> @@ -59,7 +59,6 @@
> >> >>>>         };
> >> >>>>
> >> >>>>         soc {
> >> >>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
> >> >>>>
> >> >>>>                 timer2: timer@40000000 {
> >> >>>>                         compatible =3D "st,stm32-timer";
> >> >>>> @@ -472,13 +471,11 @@
> >> >>>>                         st,syscon =3D <&syscfg 0x4>;
> >> >>>>                         snps,pbl =3D <8>;
> >> >>>>                         snps,mixed-burst;
> >> >>>> -                       dma-ranges;
> >> >>>>                         status =3D "disabled";
> >> >>>>                 };
> >> >>>>
> >> >>>>                 usbotg_hs: usb@40040000 {
> >> >>>>                         compatible =3D "snps,dwc2";
> >> >>>> -                       dma-ranges;
> >> >>>>                         reg =3D <0x40040000 0x40000>;
> >> >>>>                         interrupts =3D <77>;
> >> >>>>                         clocks =3D <&rcc 0 29>;
> >> >>>>
> >> >>>>
> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>>> index 0596d60..3a1cfdd 100644
> >> >>>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >> >>>>> @@ -59,8 +59,6 @@
> >> >>>>>         };
> >> >>>>>
> >> >>>>>         soc {
> >> >>>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
> >> >>>>> -
> >> >>>>>                 timer2: timer@40000000 {
> >> >>>>>                         compatible =3D "st,stm32-timer";
> >> >>>>>                         reg =3D <0x40000000 0x400>;
> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
> >> >>>>> b/arch/arm/boot/dts/stm32f469-disco.dts
> >> >>>>> index 9e73656..c2213c0 100644
> >> >>>>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> >> >>>>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> >> >>>>> @@ -64,6 +64,10 @@
> >> >>>>>         aliases {
> >> >>>>>                 serial0 =3D &usart3;
> >> >>>>>         };
> >> >>>>> +
> >> >>>>> +       soc {
> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
> >> >>>>> +       };
> >> >>>>>  };
> >> >>>>>
> >> >>>>>  &clk_hse {
> >> >>>>> --
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>>
> >> >>>> Br.,
> >> >>>> Bruno
> >> >>>>
> >> >>>
> >> >
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> >
>

--94eb2c0d90580c4db0054029d557
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is weird because dma ddresses are recalculated using =
parent&#39;s dma-ranges property and soc already has it so there should be =
absolutely no problem.</div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">2016-10-31 11:27 GMT+01:00 Bruno Herrera <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruherrera@gmail.com" target=3D"_blank">bruherrera@gmail.c=
om</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fr=
i, Oct 28, 2016 at 5:09 AM, Rados=C5=82aw Pietrzyk<br>
&lt;<a href=3D"mailto:radoslaw.pietrzyk@gmail.com">radoslaw.pietrzyk@gmail.=
com</a>&gt; wrote:<br>
&gt; Have you defined your sdio node within soc node ?<br>
<br>
</span>It is in the SOC node of the DSTI file.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; 2016-10-27 14:57 GMT+02:00 Bruno Herrera &lt;<a href=3D"mailto:bruherr=
era@gmail.com">bruherrera@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; Hi Alex,<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue<br>
&gt;&gt; &lt;<a href=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st=
.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi Bruno,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 10/27/2016 12:43 PM, Bruno Herrera wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Alex,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:alexandre.torgue@st.com">alexandre.=
torgue@st.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Hi Bruno,<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On 10/25/2016 11:06 PM, Bruno Herrera wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Hi Alexandre,<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; stm32f469-disco and stm32f429-eval boards use=
 SDRAM start address<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; remapping<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; (to @0) to boost performances. A DMA translat=
ion through<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; &quot;dma-ranges&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; property was needed for other masters than th=
e M4 CPU.<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; stm32f429-disco doesn&#39;t use remapping so =
doesn&#39;t need this DMA<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; translation.<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; This patches moves this DMA translation defin=
ition from stm32f429<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; soc<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; file<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; to board files.<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Alexandre TORGUE &lt;<a href=
=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32429i-<wbr=
>eval.dts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; index 13c7cd2..a763c15 100644<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32429i-<wbr>eval.d=
ts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32429i-<wbr>eval.d=
ts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -82,6 +82,10 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbotg_hs_ph=
y: usbphy {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0#phy-cells =3D &lt;0&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0compatible =3D &quot;usb-nop-xceiv&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Shouldn&#39;t also the peripheral dma-ranges prop=
erty move to board<br>
&gt;&gt; &gt;&gt;&gt;&gt; specific<br>
&gt;&gt; &gt;&gt;&gt;&gt; too?<br>
&gt;&gt; &gt;&gt;&gt;&gt; I=C2=A0 had this patch for while but I didn&#39;t=
 had the time to submit:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Well spot I forgot it. Actually, discussing with Arnd=
 ysterday on<br>
&gt;&gt; &gt;&gt;&gt; IIRC,<br>
&gt;&gt; &gt;&gt;&gt; empty dma-ranges is not needed. Can you test on your =
side by removing<br>
&gt;&gt; &gt;&gt;&gt; dma-ranges in usb node please ?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Unfortunately will take a time for me to set up this envi=
ronment on<br>
&gt;&gt; &gt;&gt; the STM32F4-EVAL board.<br>
&gt;&gt; &gt;&gt; And on the discovery boards we dont have this scenario. T=
hat was the<br>
&gt;&gt; &gt;&gt; main reason I did not submit the patch right away.<br>
&gt;&gt; &gt;&gt; My conclusion and I might be wrong but is based on the my=
 tests with<br>
&gt;&gt; &gt;&gt; SDIO device at STM32F469I-DISCO board.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I started this issue as discussion at ST Forum but Maxime=
 gave me the<br>
&gt;&gt; &gt;&gt; hint.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; <a href=3D"https://my.st.com/public/STe2ecommunities/mcu/=
Lists/cortex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2f=
public%2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%2fDMA2%20and%20SY=
SCFG_MEMRMP%20relationship&amp;FolderCTID=3D0x01200200770978C69A1141439FE55=
9EB459D7580009C4E14902C3CDE46A77F0FFD06506F5B&amp;currentviews=3D44" rel=3D=
"noreferrer" target=3D"_blank">https://my.st.com/public/<wbr>STe2ecommuniti=
es/mcu/Lists/<wbr>cortex_mx_stm32/Flat.aspx?<wbr>RootFolder=3Dhttps%3a%2f%2=
fmy%<wbr>2est%2ecom%2fpublic%<wbr>2fSTe2ecommunities%2fmcu%<wbr>2fLists%2fc=
ortex_mx_stm32%<wbr>2fDMA2%20and%20SYSCFG_MEMRMP%<wbr>20relationship&amp;Fo=
lderCTID=3D<wbr>0x01200200770978C69A1141439FE5<wbr>59EB459D7580009C4E14902C=
3CDE46<wbr>A77F0FFD06506F5B&amp;currentviews=3D<wbr>44</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; I will push a v2 by removing empty dma-ranges if test=
s are ok in your<br>
&gt;&gt; &gt;&gt;&gt; side.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From my understating/conclusion is: when empty property(d=
ma-ranges) is<br>
&gt;&gt; &gt;&gt; the device node, the mapping will be taken in considerati=
on when using<br>
&gt;&gt; &gt;&gt; DMA otherwise the mapping is ignored.<br>
&gt;&gt; &gt;&gt; And in the SDIO case it is needed for DEV-&gt;MEM(SDRAM) =
and<br>
&gt;&gt; &gt;&gt; MEM(SDRAM)-&gt;DEV. If it is not the case for the devices=
 in question so<br>
&gt;&gt; &gt;&gt; I suppose it can work without the property.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; For sure translation has to be done but I&#39;m not sure that=
 an empty<br>
&gt;&gt; &gt; &quot;dma-ranges&quot; is needed in device node to activate i=
t. For Ethernet empty<br>
&gt;&gt; &gt; &quot;dma-ranges&quot; is not needed. I will try with usb.<br=
>
&gt;&gt;<br>
&gt;&gt; In the case of SDIO it is needed. As example this is my working SD=
IO node:<br>
&gt;&gt;<br>
&gt;&gt; sdio: sdio@40012c00 {<br>
&gt;&gt; compatible =3D &quot;arm,pl18x&quot;, &quot;arm,primecell&quot;;<b=
r>
&gt;&gt; arm,primecell-periphid =3D &lt;0x00480181&gt;;<br>
&gt;&gt; reg =3D &lt;0x40012c00 0x400&gt;;<br>
&gt;&gt; dmas =3D=C2=A0 &lt;&amp;dma2 6 4 0x10400 0x3&gt;, /* Logical - Dev=
ToMem */<br>
&gt;&gt; &lt;&amp;dma2 3 4 0x10400 0x3&gt;; /* Logical - MemToDev */<br>
&gt;&gt; dma-names =3D &quot;rx&quot;, &quot;tx&quot;;<br>
&gt;&gt; clocks =3D &lt;&amp;rcc 0 171&gt;;<br>
&gt;&gt; clock-names =3D &quot;apb_pclk&quot;;<br>
&gt;&gt; interrupts =3D &lt;49&gt;;<br>
&gt;&gt; status =3D &quot;disabled&quot;;<br>
&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt; &amp;sdio {<br>
&gt;&gt; status =3D &quot;okay&quot;;<br>
&gt;&gt; vmmc-supply =3D &lt;&amp;wlan_en&gt;;<br>
&gt;&gt; bus-width =3D &lt;4&gt;;<br>
&gt;&gt; max-frequency =3D &lt;24000000&gt;;<br>
&gt;&gt; pinctrl-names =3D &quot;default&quot;;<br>
&gt;&gt; pinctrl-0 =3D &lt;&amp;sdio_pins&gt;;<br>
&gt;&gt; ti,non-removable;<br>
&gt;&gt; ti,needs-special-hs-handling;<br>
&gt;&gt; dma-ranges;<br>
&gt;&gt; cap-power-off-card;<br>
&gt;&gt; keep-power-in-suspend;<br>
&gt;&gt;<br>
&gt;&gt; #address-cells =3D &lt;1&gt;;<br>
&gt;&gt; #size-cells =3D &lt;0&gt;;<br>
&gt;&gt; wlcore: wlcore@0 {<br>
&gt;&gt; compatible =3D &quot;ti,wl1835&quot;;<br>
&gt;&gt; reg =3D &lt;2&gt;;<br>
&gt;&gt; interrupt-parent =3D &lt;&amp;gpioa&gt;;<br>
&gt;&gt; interrupts =3D &lt;8 IRQ_TYPE_EDGE_RISING&gt;;<br>
&gt;&gt; };<br>
&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Thanks in advance<br>
&gt;&gt; &gt;&gt;&gt; Alex<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Author: Bruno Herrera &lt;<a href=3D"mailto:bruhe=
rrera@gmail.com">bruherrera@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Date:=C2=A0 =C2=A0Sun Oct 16 14:50:00 2016 -0200<=
br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ARM: DT: STM32: Use dma-ranges=
 property per board not at dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt; file<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32429i-<wbr>eva=
l.dts<br>
&gt;&gt; &gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt; &gt;&gt;&gt;&gt; index 6bfc595..2a22a82 100644<br>
&gt;&gt; &gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt; @@ -52,6 +52,10 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;=
STMicroelectronics STM32429i-EVAL board&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &=
quot;st,stm32429i-eval&quot;, &quot;st,stm32f429&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dma-ranges =3D &lt;0xC0000000 0x0 0x10000000&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0bootargs =3D &quot;root=3D/dev/ram rdinit=3D/linuxrc&quot;;<br=
>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0stdout-path =3D &quot;serial0:115200n8&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; @@ -96,6 +100,7 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 &amp;ethernet0 {<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot=
;okay&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &lt;&amp;ethernet0_mii&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names=C2=
=A0 =C2=A0=3D &quot;default&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;mii-id&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; @@ -116,6 +121,7 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 &amp;usbotg_hs {<br>
&gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dr_mode =3D &quo=
t;host&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phys =3D &lt;&am=
p;usbotg_hs_phy&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-names =3D &q=
uot;usb2-phy&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f429.<wbr>dts=
i<br>
&gt;&gt; &gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt; index 7d624a2..697a133 100644<br>
&gt;&gt; &gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt; @@ -59,7 +59,6 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0timer2: timer@40000000 {<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32-time=
r&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; @@ -472,13 +471,11 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,syscon =3D &lt;&amp;syscfg 0x4&=
gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snps,pbl =3D &lt;8&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snps,mixed-burst;<br>
&gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usbotg_hs: usb@40040000 {<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;snps,dwc2&quo=
t;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40040000 0x40000&gt;=
;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;77&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;rcc 0 29&gt;;<=
br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f429.<wbr=
>dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; index 0596d60..3a1cfdd 100644<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -59,8 +59,6 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0timer2: timer@40000000 {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32-=
timer&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40000000 0x400&g=
t;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f469-<wbr=
>disco.dts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f469-<wbr>disco.dts<=
br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; index 9e73656..c2213c0 100644<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f469-<wbr>disco.=
dts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f469-<wbr>disco.=
dts<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -64,6 +64,10 @@<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br=
>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0serial0 =3D &amp;usart3;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 &amp;clk_hse {<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Br.,<br>
&gt;&gt; &gt;&gt;&gt;&gt; Bruno<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; linux-arm-kernel mailing list<br>
&gt;&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-=
kernel@lists.<wbr>infradead.org</a><br>
&gt;&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-k=
ernel" rel=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr=
>mailman/listinfo/linux-arm-<wbr>kernel</a><br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--94eb2c0d90580c4db0054029d557--
