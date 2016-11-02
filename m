Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF3+TqeiPjtG7Fs1-cpbcHGxxtSS1UOGD=S=sggpaZahFLJhEQ@mail.gmail.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
 <404315f0-fc9e-93e2-54df-f85e484d9389@st.com> <CAF3+TqdzESUNbkmAVv42pNv13wuyuPgGgksK3pJbORYw2a8ZFQ@mail.gmail.com>
 <65096fbe-3f06-c8db-fbe8-29f0be28cb61@st.com> <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
 <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw@mail.gmail.com>
 <CAF3+TqcFnXENmX4OpG9jzhPhuaq-EqNsRhhjKgFjHA96DLqK5g@mail.gmail.com>
 <CAFvLkMQ6YMg4sf2Ug8x4-YshwnjbLz3aVzm+JpKP6zG9r-WU4Q@mail.gmail.com>
 <CAF3+Tqdz+92yxuSwZHdQ01d-G-bBNtzayKyP2-_On2APvFyLNA@mail.gmail.com>
 <CAFvLkMTCkRcwbRc8GVNBoJFAvKWHYDjOPabueQPjTseZrucadA@mail.gmail.com>
 <3e854414-f51d-3e59-6cee-142106cef40f@st.com> <CAF3+TqeiPjtG7Fs1-cpbcHGxxtSS1UOGD=S=sggpaZahFLJhEQ@mail.gmail.com>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Wed, 2 Nov 2016 19:05:39 +0100
Message-ID: <CAFvLkMSViXggGr0Set0qnQan_+bXUNzJx5WtZHP-Jyje=ZzDVw@mail.gmail.com>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Content-Type: multipart/alternative; boundary=001a113f74c8f11ad10540554979
To: Bruno Herrera <bruherrera@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk, ">" <peter.griffin@linaro.org>, ">" <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, andrea.merello@gmail.com
List-ID: <devicetree@vger.kernel.org>

--001a113f74c8f11ad10540554979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Have you tried with

sdio {
...
compatible =3D "arm,primecell";
arm,primecell-periphid =3D <id_to_define>;
...
}

This should register proper amba device and give it an ID you wish.

2016-11-02 17:07 GMT+01:00 Bruno Herrera <bruherrera@gmail.com>:

> Hi
>
> On Wed, Nov 2, 2016 at 12:32 PM, Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> > Hi
> >
> > On 10/31/2016 07:58 PM, Rados=C5=82aw Pietrzyk wrote:
> >>
> >> I think wlcore driver searches dma-ranges in its parent that's why sdi=
o
> >> node needs it.
> >
> >
> > Yes I agree. In this case it is needed as you have subnode in sdio node=
.
> > So IMO empty dma-ranges could be removed from ethernet and usb node, bu=
t
> > kept in future sdio subnode.
>
> Now it is clear.
>
> >
> > Bruno,
> > Do you plan to push sdio support ?
>
> Yes I do, but I'm not sure how long it will take. The I had to
> change(and hack) the mmci code because I could not get the ID from
> STM32 SDIO IP.
> My current WIP is at @
> https://github.com/mcoquelin-stm32/afboot-stm32/pull/4#
> issuecomment-247571615
> I know Andrea Merello is also working on that (and he probably has a
> more complete patch).
>
> >
> >
> >
> >>
> >> 2016-10-31 17:41 GMT+01:00 Bruno Herrera <bruherrera@gmail.com
> >> <mailto:bruherrera@gmail.com>>:
> >>
> >>     On Mon, Oct 31, 2016 at 12:14 PM, Rados=C5=82aw Pietrzyk
> >>     <radoslaw.pietrzyk@gmail.com <mailto:radoslaw.pietrzyk@gmail.com>>
> >>     wrote:
> >>     > This is weird because dma ddresses are recalculated using parent=
's
> >>     > dma-ranges property and soc already has it so there should be
> >> absolutely no
> >>     > problem.
> >>
> >>     These are my DTS and DTSI file.
> >>     >
> >>     > 2016-10-31 11:27 GMT+01:00 Bruno Herrera <bruherrera@gmail.com
> >>     <mailto:bruherrera@gmail.com>>:
> >>     >>
> >>     >> On Fri, Oct 28, 2016 at 5:09 AM, Rados=C5=82aw Pietrzyk
> >>     >> <radoslaw.pietrzyk@gmail.com
> >>     <mailto:radoslaw.pietrzyk@gmail.com>> wrote:
> >>     >> > Have you defined your sdio node within soc node ?
> >>     >>
> >>     >> It is in the SOC node of the DSTI file.
> >>     >>
> >>     >> >
> >>     >> > 2016-10-27 14:57 GMT+02:00 Bruno Herrera <bruherrera@gmail.co=
m
> >>     <mailto:bruherrera@gmail.com>>:
> >>     >> >>
> >>     >> >> Hi Alex,
> >>     >> >>
> >>     >> >> On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue
> >>     >> >> <alexandre.torgue@st.com <mailto:alexandre.torgue@st.com>>
> >> wrote:
> >>     >> >> > Hi Bruno,
> >>     >> >> >
> >>     >> >> >
> >>     >> >> > On 10/27/2016 12:43 PM, Bruno Herrera wrote:
> >>     >> >> >>
> >>     >> >> >> Hi Alex,
> >>     >> >> >>
> >>     >> >> >> On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue
> >>     >> >> >> <alexandre.torgue@st.com <mailto:alexandre.torgue@st.com>=
>
> >>     wrote:
> >>     >> >> >>>
> >>     >> >> >>> Hi Bruno,
> >>     >> >> >>>
> >>     >> >> >>> On 10/25/2016 11:06 PM, Bruno Herrera wrote:
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>> Hi Alexandre,
> >>     >> >> >>>>
> >>     >> >> >>>>>
> >>     >> >> >>>>> stm32f469-disco and stm32f429-eval boards use SDRAM
> >>     start address
> >>     >> >> >>>>> remapping
> >>     >> >> >>>>> (to @0) to boost performances. A DMA translation throu=
gh
> >>     >> >> >>>>> "dma-ranges"
> >>     >> >> >>>>> property was needed for other masters than the M4 CPU.
> >>     >> >> >>>>> stm32f429-disco doesn't use remapping so doesn't need
> >>     this DMA
> >>     >> >> >>>>> translation.
> >>     >> >> >>>>> This patches moves this DMA translation definition fro=
m
> >>     stm32f429
> >>     >> >> >>>>> soc
> >>     >> >> >>>>> file
> >>     >> >> >>>>> to board files.
> >>     >> >> >>>>>
> >>     >> >> >>>>> Signed-off-by: Alexandre TORGUE <
> alexandre.torgue@st.com
> >>     <mailto:alexandre.torgue@st.com>>
> >>
> >>     >> >> >>>>>
> >>     >> >> >>>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>>> index 13c7cd2..a763c15 100644
> >>     >> >> >>>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>>> @@ -82,6 +82,10 @@
> >>     >> >> >>>>>                 };
> >>     >> >> >>>>>         };
> >>     >> >> >>>>>
> >>     >> >> >>>>> +       soc {
> >>     >> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0
> 0x10000000>;
> >>     >> >> >>>>> +       };
> >>     >> >> >>>>> +
> >>     >> >> >>>>>         usbotg_hs_phy: usbphy {
> >>     >> >> >>>>>                 #phy-cells =3D <0>;
> >>     >> >> >>>>>                 compatible =3D "usb-nop-xceiv";
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>> Shouldn't also the peripheral dma-ranges property move =
to
> >>     board
> >>     >> >> >>>> specific
> >>     >> >> >>>> too?
> >>     >> >> >>>> I  had this patch for while but I didn't had the time t=
o
> >>     submit:
> >>     >> >> >>>
> >>     >> >> >>>
> >>     >> >> >>>
> >>     >> >> >>> Well spot I forgot it. Actually, discussing with Arnd
> >>     ysterday on
> >>     >> >> >>> IIRC,
> >>     >> >> >>> empty dma-ranges is not needed. Can you test on your sid=
e
> by
> >>     >> >> >>> removing
> >>     >> >> >>> dma-ranges in usb node please ?
> >>     >> >> >>
> >>     >> >> >> Unfortunately will take a time for me to set up this
> >>     environment on
> >>     >> >> >> the STM32F4-EVAL board.
> >>     >> >> >> And on the discovery boards we dont have this scenario.
> >>     That was the
> >>     >> >> >> main reason I did not submit the patch right away.
> >>     >> >> >> My conclusion and I might be wrong but is based on the my
> >>     tests with
> >>     >> >> >> SDIO device at STM32F469I-DISCO board.
> >>     >> >> >>
> >>     >> >> >> I started this issue as discussion at ST Forum but Maxime
> >>     gave me
> >>     >> >> >> the
> >>     >> >> >> hint.
> >>     >> >> >>
> >>     >> >> >>
> >>     >> >> >>
> >>     >> >> >>
> >>     >> >> >>
> >>
> >> https://my.st.com/public/STe2ecommunities/mcu/Lists/
> cortex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpubl=
ic%
> 2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%
> 2fDMA2%20and%20SYSCFG_MEMRMP%20relationship&FolderCTID=3D
> 0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE46
> A77F0FFD06506F5B&currentviews=3D44
> >>
> >> <https://my.st.com/public/STe2ecommunities/mcu/Lists/
> cortex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpubl=
ic%
> 2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%
> 2fDMA2%20and%20SYSCFG_MEMRMP%20relationship&FolderCTID=3D
> 0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE46
> A77F0FFD06506F5B&currentviews=3D44>
> >>     >> >> >>
> >>     >> >> >>> I will push a v2 by removing empty dma-ranges if tests a=
re
> >>     ok in
> >>     >> >> >>> your
> >>     >> >> >>> side.
> >>     >> >> >>
> >>     >> >> >>
> >>     >> >> >> From my understating/conclusion is: when empty
> >>     property(dma-ranges)
> >>     >> >> >> is
> >>     >> >> >> the device node, the mapping will be taken in considerati=
on
> >>     when
> >>     >> >> >> using
> >>     >> >> >> DMA otherwise the mapping is ignored.
> >>     >> >> >> And in the SDIO case it is needed for DEV->MEM(SDRAM) and
> >>     >> >> >> MEM(SDRAM)->DEV. If it is not the case for the devices in
> >>     question
> >>     >> >> >> so
> >>     >> >> >> I suppose it can work without the property.
> >>     >> >> >
> >>     >> >> >
> >>     >> >> > For sure translation has to be done but I'm not sure that =
an
> >>     empty
> >>     >> >> > "dma-ranges" is needed in device node to activate it. For
> >>     Ethernet
> >>     >> >> > empty
> >>     >> >> > "dma-ranges" is not needed. I will try with usb.
> >>     >> >>
> >>     >> >> In the case of SDIO it is needed. As example this is my
> >>     working SDIO
> >>     >> >> node:
> >>     >> >>
> >>     >> >> sdio: sdio@40012c00 {
> >>     >> >> compatible =3D "arm,pl18x", "arm,primecell";
> >>     >> >> arm,primecell-periphid =3D <0x00480181>;
> >>     >> >> reg =3D <0x40012c00 0x400>;
> >>     >> >> dmas =3D  <&dma2 6 4 0x10400 0x3>, /* Logical - DevToMem */
> >>     >> >> <&dma2 3 4 0x10400 0x3>; /* Logical - MemToDev */
> >>     >> >> dma-names =3D "rx", "tx";
> >>     >> >> clocks =3D <&rcc 0 171>;
> >>     >> >> clock-names =3D "apb_pclk";
> >>     >> >> interrupts =3D <49>;
> >>     >> >> status =3D "disabled";
> >>     >> >> };
> >>     >> >>
> >>     >> >> &sdio {
> >>     >> >> status =3D "okay";
> >>     >> >> vmmc-supply =3D <&wlan_en>;
> >>     >> >> bus-width =3D <4>;
> >>     >> >> max-frequency =3D <24000000>;
> >>     >> >> pinctrl-names =3D "default";
> >>     >> >> pinctrl-0 =3D <&sdio_pins>;
> >>     >> >> ti,non-removable;
> >>     >> >> ti,needs-special-hs-handling;
> >>     >> >> dma-ranges;
> >>     >> >> cap-power-off-card;
> >>     >> >> keep-power-in-suspend;
> >>     >> >>
> >>     >> >> #address-cells =3D <1>;
> >>     >> >> #size-cells =3D <0>;
> >>     >> >> wlcore: wlcore@0 {
> >>     >> >> compatible =3D "ti,wl1835";
> >>     >> >> reg =3D <2>;
> >>     >> >> interrupt-parent =3D <&gpioa>;
> >>     >> >> interrupts =3D <8 IRQ_TYPE_EDGE_RISING>;
> >>     >> >> };
> >>     >> >> };
> >>     >> >>
> >>     >> >> >
> >>     >> >> > alex
> >>     >> >> >
> >>     >> >> >
> >>     >> >> >>
> >>     >> >> >>>
> >>     >> >> >>> Thanks in advance
> >>     >> >> >>> Alex
> >>     >> >> >>>
> >>     >> >> >>>
> >>     >> >> >>>>
> >>     >> >> >>>> Author: Bruno Herrera <bruherrera@gmail.com
> >>     <mailto:bruherrera@gmail.com>>
> >>
> >>     >> >> >>>> Date:   Sun Oct 16 14:50:00 2016 -0200
> >>     >> >> >>>>
> >>     >> >> >>>>     ARM: DT: STM32: Use dma-ranges property per board n=
ot
> >>     at dtsi
> >>     >> >> >>>> file
> >>     >> >> >>>>
> >>     >> >> >>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>> index 6bfc595..2a22a82 100644
> >>     >> >> >>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >>     >> >> >>>> @@ -52,6 +52,10 @@
> >>     >> >> >>>>         model =3D "STMicroelectronics STM32429i-EVAL
> board";
> >>     >> >> >>>>         compatible =3D "st,stm32429i-eval", "st,stm32f4=
29";
> >>     >> >> >>>>
> >>     >> >> >>>> +       soc {
> >>     >> >> >>>> +               dma-ranges =3D <0xC0000000 0x0 0x100000=
00>;
> >>     >> >> >>>> +       };
> >>     >> >> >>>> +
> >>     >> >> >>>>         chosen {
> >>     >> >> >>>>                 bootargs =3D "root=3D/dev/ram
> rdinit=3D/linuxrc";
> >>     >> >> >>>>                 stdout-path =3D "serial0:115200n8";
> >>     >> >> >>>> @@ -96,6 +100,7 @@
> >>     >> >> >>>>
> >>     >> >> >>>>  &ethernet0 {
> >>     >> >> >>>>         status =3D "okay";
> >>     >> >> >>>> +       dma-ranges;
> >>     >> >> >>>>         pinctrl-0       =3D <&ethernet0_mii>;
> >>     >> >> >>>>         pinctrl-names   =3D "default";
> >>     >> >> >>>>         phy-mode        =3D "mii-id";
> >>     >> >> >>>> @@ -116,6 +121,7 @@
> >>     >> >> >>>>  };
> >>     >> >> >>>>
> >>     >> >> >>>>  &usbotg_hs {
> >>     >> >> >>>> +       dma-ranges;
> >>     >> >> >>>>         dr_mode =3D "host";
> >>     >> >> >>>>         phys =3D <&usbotg_hs_phy>;
> >>     >> >> >>>>         phy-names =3D "usb2-phy";
> >>     >> >> >>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>> index 7d624a2..697a133 100644
> >>     >> >> >>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>> @@ -59,7 +59,6 @@
> >>     >> >> >>>>         };
> >>     >> >> >>>>
> >>     >> >> >>>>         soc {
> >>     >> >> >>>> -               dma-ranges =3D <0xc0000000 0x0 0x100000=
00>;
> >>     >> >> >>>>
> >>     >> >> >>>>                 timer2: timer@40000000 {
> >>     >> >> >>>>                         compatible =3D "st,stm32-timer"=
;
> >>     >> >> >>>> @@ -472,13 +471,11 @@
> >>     >> >> >>>>                         st,syscon =3D <&syscfg 0x4>;
> >>     >> >> >>>>                         snps,pbl =3D <8>;
> >>     >> >> >>>>                         snps,mixed-burst;
> >>     >> >> >>>> -                       dma-ranges;
> >>     >> >> >>>>                         status =3D "disabled";
> >>     >> >> >>>>                 };
> >>     >> >> >>>>
> >>     >> >> >>>>                 usbotg_hs: usb@40040000 {
> >>     >> >> >>>>                         compatible =3D "snps,dwc2";
> >>     >> >> >>>> -                       dma-ranges;
> >>     >> >> >>>>                         reg =3D <0x40040000 0x40000>;
> >>     >> >> >>>>                         interrupts =3D <77>;
> >>     >> >> >>>>                         clocks =3D <&rcc 0 29>;
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>>> index 0596d60..3a1cfdd 100644
> >>     >> >> >>>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >>     >> >> >>>>> @@ -59,8 +59,6 @@
> >>     >> >> >>>>>         };
> >>     >> >> >>>>>
> >>     >> >> >>>>>         soc {
> >>     >> >> >>>>> -               dma-ranges =3D <0xc0000000 0x0
> 0x10000000>;
> >>     >> >> >>>>> -
> >>     >> >> >>>>>                 timer2: timer@40000000 {
> >>     >> >> >>>>>                         compatible =3D "st,stm32-timer=
";
> >>     >> >> >>>>>                         reg =3D <0x40000000 0x400>;
> >>     >> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
> >>     >> >> >>>>> b/arch/arm/boot/dts/stm32f469-disco.dts
> >>     >> >> >>>>> index 9e73656..c2213c0 100644
> >>     >> >> >>>>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> >>     >> >> >>>>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> >>     >> >> >>>>> @@ -64,6 +64,10 @@
> >>     >> >> >>>>>         aliases {
> >>     >> >> >>>>>                 serial0 =3D &usart3;
> >>     >> >> >>>>>         };
> >>     >> >> >>>>> +
> >>     >> >> >>>>> +       soc {
> >>     >> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0
> 0x10000000>;
> >>     >> >> >>>>> +       };
> >>     >> >> >>>>>  };
> >>     >> >> >>>>>
> >>     >> >> >>>>>  &clk_hse {
> >>     >> >> >>>>> --
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>>
> >>     >> >> >>>> Br.,
> >>     >> >> >>>> Bruno
> >>     >> >> >>>>
> >>     >> >> >>>
> >>     >> >> >
> >>     >> >>
> >>     >> >> _______________________________________________
> >>     >> >> linux-arm-kernel mailing list
> >>     >> >> linux-arm-kernel@lists.infradead.org
> >>     <mailto:linux-arm-kernel@lists.infradead.org>
> >>     >> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>     <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>
> >>     >> >
> >>     >> >
> >>     >
> >>     >
> >>
> >>
> >
>

--001a113f74c8f11ad10540554979
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have you tried with=C2=A0<div><br><div>sdio {</div><div>..=
.</div><div>compatible =3D &quot;arm,primecell&quot;;</div><div>arm,primece=
ll-periphid =3D &lt;id_to_define&gt;;</div><div>...</div><div>}</div><div><=
br></div><div>This should register proper amba device and give it an ID you=
 wish.</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">2016-11-02 17:07 GMT+01:00 Bruno Herrera <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:bruherrera@gmail.com" target=3D"_blank">bruherrera@gmail.com</=
a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<span class=3D""><br>
On Wed, Nov 2, 2016 at 12:32 PM, Alexandre Torgue<br>
&lt;<a href=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st.com</a>&=
gt; wrote:<br>
&gt; Hi<br>
&gt;<br>
&gt; On 10/31/2016 07:58 PM, Rados=C5=82aw Pietrzyk wrote:<br>
&gt;&gt;<br>
&gt;&gt; I think wlcore driver searches dma-ranges in its parent that&#39;s=
 why sdio<br>
&gt;&gt; node needs it.<br>
&gt;<br>
&gt;<br>
&gt; Yes I agree. In this case it is needed as you have subnode in sdio nod=
e.<br>
&gt; So IMO empty dma-ranges could be removed from ethernet and usb node, b=
ut<br>
&gt; kept in future sdio subnode.<br>
<br>
</span>Now it is clear.<br>
<span class=3D""><br>
&gt;<br>
&gt; Bruno,<br>
&gt; Do you plan to push sdio support ?<br>
<br>
</span>Yes I do, but I&#39;m not sure how long it will take. The I had to<b=
r>
change(and hack) the mmci code because I could not get the ID from<br>
STM32 SDIO IP.<br>
My current WIP is at @<br>
<a href=3D"https://github.com/mcoquelin-stm32/afboot-stm32/pull/4#issuecomm=
ent-247571615" rel=3D"noreferrer" target=3D"_blank">https://github.com/mcoq=
uelin-<wbr>stm32/afboot-stm32/pull/4#<wbr>issuecomment-247571615</a><br>
I know Andrea Merello is also working on that (and he probably has a<br>
more complete patch).<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; 2016-10-31 17:41 GMT+01:00 Bruno Herrera &lt;<a href=3D"mailto:bru=
herrera@gmail.com">bruherrera@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:bruherrera@gmail.com">bruherrera@gmai=
l.com</a>&gt;&gt;<wbr>:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Oct 31, 2016 at 12:14 PM, Rados=C5=82aw=
 Pietrzyk<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:radoslaw.pietrzyk@gmail.c=
om">radoslaw.pietrzyk@gmail.com</a> &lt;mailto:<a href=3D"mailto:radoslaw.p=
ietrzyk@gmail.com">radoslaw.pietrzyk@<wbr>gmail.com</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is weird because dma ddresses are rec=
alculated using parent&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; dma-ranges property and soc already has it=
 so there should be<br>
&gt;&gt; absolutely no<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; problem.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0These are my DTS and DTSI file.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2016-10-31 11:27 GMT+01:00 Bruno Herrera &=
lt;<a href=3D"mailto:bruherrera@gmail.com">bruherrera@gmail.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruherrera@gmail.c=
om">bruherrera@gmail.com</a>&gt;&gt;<wbr>:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On Fri, Oct 28, 2016 at 5:09 AM, Rados=
=C5=82aw Pietrzyk<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &lt;<a href=3D"mailto:radoslaw.pietrzy=
k@gmail.com">radoslaw.pietrzyk@gmail.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:radoslaw.pietrzyk@=
gmail.com">radoslaw.pietrzyk@<wbr>gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; Have you defined your sdio node w=
ithin soc node ?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; It is in the SOC node of the DSTI file=
.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; 2016-10-27 14:57 GMT+02:00 Bruno =
Herrera &lt;<a href=3D"mailto:bruherrera@gmail.com">bruherrera@gmail.com</a=
><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruherrera@gmail.c=
om">bruherrera@gmail.com</a>&gt;&gt;<wbr>:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; Hi Alex,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; On Thu, Oct 27, 2016 at 10:21=
 AM, Alexandre Torgue<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:alexand=
re.torgue@st.com">alexandre.torgue@st.com</a> &lt;mailto:<a href=3D"mailto:=
alexandre.torgue@st.com">alexandre.torgue@st.<wbr>com</a>&gt;&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; Hi Bruno,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; On 10/27/2016 12:43 PM, =
Bruno Herrera wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; Hi Alex,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; On Wed, Oct 26, 2016=
 at 7:09 AM, Alexandre Torgue<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailt=
o:alexandre.torgue@st.com">alexandre.torgue@st.com</a> &lt;mailto:<a href=
=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st.<wbr>com</a>&gt;&gt=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; Hi Bruno,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; On 10/25/2016 11=
:06 PM, Bruno Herrera wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Hi Alexandre=
,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; stm32f46=
9-disco and stm32f429-eval boards use SDRAM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0start address<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; remappin=
g<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; (to @0) =
to boost performances. A DMA translation through<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; &quot;dm=
a-ranges&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; property=
 was needed for other masters than the M4 CPU.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; stm32f42=
9-disco doesn&#39;t use remapping so doesn&#39;t need<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0this DMA<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; translat=
ion.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; This pat=
ches moves this DMA translation definition from<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0stm32f429<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; soc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; file<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; to board=
 files.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; Signed-o=
ff-by: Alexandre TORGUE &lt;<a href=3D"mailto:alexandre.torgue@st.com">alex=
andre.torgue@st.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alexandre.torgue@s=
t.com">alexandre.torgue@st.<wbr>com</a>&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --g=
it a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/a=
rm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; index 13=
c7cd2..a763c15 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/ar=
ch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/ar=
ch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -82,6=
 +82,10 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;0xc00000=
00 0x0 0x10000000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0usbotg_hs_phy: usbphy {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#phy-cells =3D &lt;0=
&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot=
;usb-nop-xceiv&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Shouldn&#39;=
t also the peripheral dma-ranges property move to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0board<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; specific<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; too?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; I=C2=A0 had =
this patch for while but I didn&#39;t had the time to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0submit:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; Well spot I forg=
ot it. Actually, discussing with Arnd<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ysterday on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; IIRC,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; empty dma-ranges=
 is not needed. Can you test on your side by<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; removing<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; dma-ranges in us=
b node please ?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; Unfortunately will t=
ake a time for me to set up this<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0environment on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; the STM32F4-EVAL boa=
rd.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; And on the discovery=
 boards we dont have this scenario.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0That was the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; main reason I did no=
t submit the patch right away.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; My conclusion and I =
might be wrong but is based on the my<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0tests with<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; SDIO device at STM32=
F469I-DISCO board.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; I started this issue=
 as discussion at ST Forum but Maxime<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0gave me<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; hint.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://my.st.com/public/STe2ecommunities/mcu/Lists/cor=
tex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpublic%2f=
STe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%2fDMA2%20and%20SYSCFG_MEMR=
MP%20relationship&amp;FolderCTID=3D0x01200200770978C69A1141439FE559EB459D75=
80009C4E14902C3CDE46A77F0FFD06506F5B&amp;currentviews=3D44" rel=3D"noreferr=
er" target=3D"_blank">https://my.st.com/public/<wbr>STe2ecommunities/mcu/Li=
sts/<wbr>cortex_mx_stm32/Flat.aspx?<wbr>RootFolder=3Dhttps%3a%2f%2fmy%<wbr>=
2est%2ecom%2fpublic%<wbr>2fSTe2ecommunities%2fmcu%<wbr>2fLists%2fcortex_mx_=
stm32%<wbr>2fDMA2%20and%20SYSCFG_MEMRMP%<wbr>20relationship&amp;FolderCTID=
=3D<wbr>0x01200200770978C69A1141439FE5<wbr>59EB459D7580009C4E14902C3CDE46<w=
br>A77F0FFD06506F5B&amp;currentviews=3D<wbr>44</a><br>
&gt;&gt;<br>
&gt;&gt; &lt;<a href=3D"https://my.st.com/public/STe2ecommunities/mcu/Lists=
/cortex_mx_stm32/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpubli=
c%2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%2fDMA2%20and%20SYSCFG_=
MEMRMP%20relationship&amp;FolderCTID=3D0x01200200770978C69A1141439FE559EB45=
9D7580009C4E14902C3CDE46A77F0FFD06506F5B&amp;currentviews=3D44" rel=3D"nore=
ferrer" target=3D"_blank">https://my.st.com/public/<wbr>STe2ecommunities/mc=
u/Lists/<wbr>cortex_mx_stm32/Flat.aspx?<wbr>RootFolder=3Dhttps%3a%2f%2fmy%<=
wbr>2est%2ecom%2fpublic%<wbr>2fSTe2ecommunities%2fmcu%<wbr>2fLists%2fcortex=
_mx_stm32%<wbr>2fDMA2%20and%20SYSCFG_MEMRMP%<wbr>20relationship&amp;FolderC=
TID=3D<wbr>0x01200200770978C69A1141439FE5<wbr>59EB459D7580009C4E14902C3CDE4=
6<wbr>A77F0FFD06506F5B&amp;currentviews=3D<wbr>44</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; I will push a v2=
 by removing empty dma-ranges if tests are<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ok in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; your<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; side.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; From my understating=
/conclusion is: when empty<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0property(dma-ranges)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; the device node, the=
 mapping will be taken in consideration<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0when<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; using<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; DMA otherwise the ma=
pping is ignored.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; And in the SDIO case=
 it is needed for DEV-&gt;MEM(SDRAM) and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; MEM(SDRAM)-&gt;DEV. =
If it is not the case for the devices in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0question<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; so<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt; I suppose it can wor=
k without the property.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; For sure translation has=
 to be done but I&#39;m not sure that an<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0empty<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; &quot;dma-ranges&quot; i=
s needed in device node to activate it. For<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Ethernet<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; empty<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; &quot;dma-ranges&quot; i=
s not needed. I will try with usb.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; In the case of SDIO it is nee=
ded. As example this is my<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0working SDIO<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; node:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; sdio: sdio@40012c00 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; compatible =3D &quot;arm,pl18=
x&quot;, &quot;arm,primecell&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; arm,primecell-periphid =3D &l=
t;0x00480181&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; reg =3D &lt;0x40012c00 0x400&=
gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; dmas =3D=C2=A0 &lt;&amp;dma2 =
6 4 0x10400 0x3&gt;, /* Logical - DevToMem */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &lt;&amp;dma2 3 4 0x10400 0x3=
&gt;; /* Logical - MemToDev */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; dma-names =3D &quot;rx&quot;,=
 &quot;tx&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; clocks =3D &lt;&amp;rcc 0 171=
&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; clock-names =3D &quot;apb_pcl=
k&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; interrupts =3D &lt;49&gt;;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; status =3D &quot;disabled&quo=
t;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &amp;sdio {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; status =3D &quot;okay&quot;;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; vmmc-supply =3D &lt;&amp;wlan=
_en&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; bus-width =3D &lt;4&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; max-frequency =3D &lt;2400000=
0&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; pinctrl-names =3D &quot;defau=
lt&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; pinctrl-0 =3D &lt;&amp;sdio_p=
ins&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; ti,non-removable;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; ti,needs-special-hs-handling;=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; dma-ranges;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; cap-power-off-card;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; keep-power-in-suspend;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; #address-cells =3D &lt;1&gt;;=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; #size-cells =3D &lt;0&gt;;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; wlcore: wlcore@0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; compatible =3D &quot;ti,wl183=
5&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; reg =3D &lt;2&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; interrupt-parent =3D &lt;&amp=
;gpioa&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; interrupts =3D &lt;8 IRQ_TYPE=
_EDGE_RISING&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt; alex<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; Thanks in advanc=
e<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt; Alex<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Author: Brun=
o Herrera &lt;<a href=3D"mailto:bruherrera@gmail.com">bruherrera@gmail.com<=
/a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruherrera@gmail.c=
om">bruherrera@gmail.com</a>&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Date:=C2=A0 =
=C2=A0Sun Oct 16 14:50:00 2016 -0200<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0ARM: DT: STM32: Use dma-ranges property per board not<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0at dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; file<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; diff --git a=
/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; b/arch/arm/b=
oot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; index 6bfc59=
5..2a22a82 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; --- a/arch/a=
rm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +++ b/arch/a=
rm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; @@ -52,6 +52=
,10 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0model =3D &quot;STMicroelectronics STM32429i-EVAL boar=
d&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32429i-eval&quot;, &quot;st=
,stm32f429&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;0xC0000000 =
0x0 0x10000000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;root=3D=
/dev/ram rdinit=3D/linuxrc&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot;seri=
al0:115200n8&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; @@ -96,6 +10=
0,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 &amp;e=
thernet0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0pinctrl-0=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;&amp;ether=
net0_mii&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0pinctrl-names=C2=A0 =C2=A0=3D &quot;default&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0phy-mode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mii-id&q=
uot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; @@ -116,6 +1=
21,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 &amp;u=
sbotg_hs {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dr_mode =3D &quot;host&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0phys =3D &lt;&amp;usbotg_hs_phy&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0phy-names =3D &quot;usb2-phy&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; diff --git a=
/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; b/arch/arm/b=
oot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; index 7d624a=
2..697a133 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; --- a/arch/a=
rm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; +++ b/arch/a=
rm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; @@ -59,7 +59=
,6 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;0xc0000000 =
0x0 0x10000000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer2: timer@40000000 {<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0compatible =3D &quot;st,stm32-timer&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; @@ -472,13 +=
471,11 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0st,syscon =3D &lt;&amp;syscfg 0x4&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0snps,pbl =3D &lt;8&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0snps,mixed-burst;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm=
a-ranges;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0status =3D &quot;disabled&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbotg_hs: usb@40040000 {<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0compatible =3D &quot;snps,dwc2&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; -=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm=
a-ranges;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0reg =3D &lt;0x40040000 0x40000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0interrupts =3D &lt;77&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0clocks =3D &lt;&amp;rcc 0 29&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --g=
it a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/a=
rm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; index 05=
96d60..3a1cfdd 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/ar=
ch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/ar=
ch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -59,8=
 +59,6 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; -=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;0xc00000=
00 0x0 0x10000000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer2: timer@400000=
00 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;st,stm32-timer&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x40000000 0x400&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; diff --g=
it a/arch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; b/arch/a=
rm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; index 9e=
73656..c2213c0 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; --- a/ar=
ch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +++ b/ar=
ch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; @@ -64,6=
 +64,10 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp;usa=
rt3;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges =3D &lt;0xc00000=
00 0x0 0x10000000&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 };=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 &a=
mp;clk_hse {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Br.,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt; Bruno<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; _____________________________=
_<wbr>_________________<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; linux-arm-kernel mailing list=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; <a href=3D"mailto:linux-arm-k=
ernel@lists.infradead.org">linux-arm-kernel@lists.<wbr>infradead.org</a><br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:linux-arm-kernel@l=
ists.infradead.org">linux-arm-kernel@<wbr>lists.infradead.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; <a href=3D"http://lists.infra=
dead.org/mailman/listinfo/linux-arm-kernel" rel=3D"noreferrer" target=3D"_b=
lank">http://lists.infradead.org/<wbr>mailman/listinfo/linux-arm-<wbr>kerne=
l</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.infradead.org/mailm=
an/listinfo/linux-arm-kernel" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.infradead.org/<wbr>mailman/listinfo/linux-arm-<wbr>kernel</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a113f74c8f11ad10540554979--
