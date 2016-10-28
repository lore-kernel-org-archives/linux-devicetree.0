Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
 <404315f0-fc9e-93e2-54df-f85e484d9389@st.com> <CAF3+TqdzESUNbkmAVv42pNv13wuyuPgGgksK3pJbORYw2a8ZFQ@mail.gmail.com>
 <65096fbe-3f06-c8db-fbe8-29f0be28cb61@st.com> <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Fri, 28 Oct 2016 09:09:47 +0200
Message-ID: <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw@mail.gmail.com>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Content-Type: multipart/alternative; boundary=94eb2c1a1800228824053fe78b9b
To: Bruno Herrera <bruherrera@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk, ">" <peter.griffin@linaro.org>, ">" <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c1a1800228824053fe78b9b
Content-Type: text/plain; charset=UTF-8

Have you defined your sdio node within soc node ?

2016-10-27 14:57 GMT+02:00 Bruno Herrera <bruherrera@gmail.com>:

> Hi Alex,
>
> On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> > Hi Bruno,
> >
> >
> > On 10/27/2016 12:43 PM, Bruno Herrera wrote:
> >>
> >> Hi Alex,
> >>
> >> On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue
> >> <alexandre.torgue@st.com> wrote:
> >>>
> >>> Hi Bruno,
> >>>
> >>> On 10/25/2016 11:06 PM, Bruno Herrera wrote:
> >>>>
> >>>>
> >>>> Hi Alexandre,
> >>>>
> >>>>>
> >>>>> stm32f469-disco and stm32f429-eval boards use SDRAM start address
> >>>>> remapping
> >>>>> (to @0) to boost performances. A DMA translation through "dma-ranges"
> >>>>> property was needed for other masters than the M4 CPU.
> >>>>> stm32f429-disco doesn't use remapping so doesn't need this DMA
> >>>>> translation.
> >>>>> This patches moves this DMA translation definition from stm32f429 soc
> >>>>> file
> >>>>> to board files.
> >>>>>
> >>>>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >>>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >>>>> index 13c7cd2..a763c15 100644
> >>>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >>>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >>>>> @@ -82,6 +82,10 @@
> >>>>>                 };
> >>>>>         };
> >>>>>
> >>>>> +       soc {
> >>>>> +               dma-ranges = <0xc0000000 0x0 0x10000000>;
> >>>>> +       };
> >>>>> +
> >>>>>         usbotg_hs_phy: usbphy {
> >>>>>                 #phy-cells = <0>;
> >>>>>                 compatible = "usb-nop-xceiv";
> >>>>
> >>>>
> >>>>
> >>>> Shouldn't also the peripheral dma-ranges property move to board
> specific
> >>>> too?
> >>>> I  had this patch for while but I didn't had the time to submit:
> >>>
> >>>
> >>>
> >>> Well spot I forgot it. Actually, discussing with Arnd ysterday on IIRC,
> >>> empty dma-ranges is not needed. Can you test on your side by removing
> >>> dma-ranges in usb node please ?
> >>
> >> Unfortunately will take a time for me to set up this environment on
> >> the STM32F4-EVAL board.
> >> And on the discovery boards we dont have this scenario. That was the
> >> main reason I did not submit the patch right away.
> >> My conclusion and I might be wrong but is based on the my tests with
> >> SDIO device at STM32F469I-DISCO board.
> >>
> >> I started this issue as discussion at ST Forum but Maxime gave me the
> >> hint.
> >>
> >>
> >> https://my.st.com/public/STe2ecommunities/mcu/Lists/
> cortex_mx_stm32/Flat.aspx?RootFolder=https%3a%2f%2fmy%2est%2ecom%2fpublic%
> 2fSTe2ecommunities%2fmcu%2fLists%2fcortex_mx_stm32%
> 2fDMA2%20and%20SYSCFG_MEMRMP%20relationship&FolderCTID=
> 0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3CDE46
> A77F0FFD06506F5B&currentviews=44
> >>
> >>> I will push a v2 by removing empty dma-ranges if tests are ok in your
> >>> side.
> >>
> >>
> >> From my understating/conclusion is: when empty property(dma-ranges) is
> >> the device node, the mapping will be taken in consideration when using
> >> DMA otherwise the mapping is ignored.
> >> And in the SDIO case it is needed for DEV->MEM(SDRAM) and
> >> MEM(SDRAM)->DEV. If it is not the case for the devices in question so
> >> I suppose it can work without the property.
> >
> >
> > For sure translation has to be done but I'm not sure that an empty
> > "dma-ranges" is needed in device node to activate it. For Ethernet empty
> > "dma-ranges" is not needed. I will try with usb.
>
> In the case of SDIO it is needed. As example this is my working SDIO node:
>
> sdio: sdio@40012c00 {
> compatible = "arm,pl18x", "arm,primecell";
> arm,primecell-periphid = <0x00480181>;
> reg = <0x40012c00 0x400>;
> dmas =  <&dma2 6 4 0x10400 0x3>, /* Logical - DevToMem */
> <&dma2 3 4 0x10400 0x3>; /* Logical - MemToDev */
> dma-names = "rx", "tx";
> clocks = <&rcc 0 171>;
> clock-names = "apb_pclk";
> interrupts = <49>;
> status = "disabled";
> };
>
> &sdio {
> status = "okay";
> vmmc-supply = <&wlan_en>;
> bus-width = <4>;
> max-frequency = <24000000>;
> pinctrl-names = "default";
> pinctrl-0 = <&sdio_pins>;
> ti,non-removable;
> ti,needs-special-hs-handling;
> dma-ranges;
> cap-power-off-card;
> keep-power-in-suspend;
>
> #address-cells = <1>;
> #size-cells = <0>;
> wlcore: wlcore@0 {
> compatible = "ti,wl1835";
> reg = <2>;
> interrupt-parent = <&gpioa>;
> interrupts = <8 IRQ_TYPE_EDGE_RISING>;
> };
> };
>
> >
> > alex
> >
> >
> >>
> >>>
> >>> Thanks in advance
> >>> Alex
> >>>
> >>>
> >>>>
> >>>> Author: Bruno Herrera <bruherrera@gmail.com>
> >>>> Date:   Sun Oct 16 14:50:00 2016 -0200
> >>>>
> >>>>     ARM: DT: STM32: Use dma-ranges property per board not at dtsi file
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
> >>>> b/arch/arm/boot/dts/stm32429i-eval.dts
> >>>> index 6bfc595..2a22a82 100644
> >>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> >>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> >>>> @@ -52,6 +52,10 @@
> >>>>         model = "STMicroelectronics STM32429i-EVAL board";
> >>>>         compatible = "st,stm32429i-eval", "st,stm32f429";
> >>>>
> >>>> +       soc {
> >>>> +               dma-ranges = <0xC0000000 0x0 0x10000000>;
> >>>> +       };
> >>>> +
> >>>>         chosen {
> >>>>                 bootargs = "root=/dev/ram rdinit=/linuxrc";
> >>>>                 stdout-path = "serial0:115200n8";
> >>>> @@ -96,6 +100,7 @@
> >>>>
> >>>>  &ethernet0 {
> >>>>         status = "okay";
> >>>> +       dma-ranges;
> >>>>         pinctrl-0       = <&ethernet0_mii>;
> >>>>         pinctrl-names   = "default";
> >>>>         phy-mode        = "mii-id";
> >>>> @@ -116,6 +121,7 @@
> >>>>  };
> >>>>
> >>>>  &usbotg_hs {
> >>>> +       dma-ranges;
> >>>>         dr_mode = "host";
> >>>>         phys = <&usbotg_hs_phy>;
> >>>>         phy-names = "usb2-phy";
> >>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >>>> index 7d624a2..697a133 100644
> >>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >>>> @@ -59,7 +59,6 @@
> >>>>         };
> >>>>
> >>>>         soc {
> >>>> -               dma-ranges = <0xc0000000 0x0 0x10000000>;
> >>>>
> >>>>                 timer2: timer@40000000 {
> >>>>                         compatible = "st,stm32-timer";
> >>>> @@ -472,13 +471,11 @@
> >>>>                         st,syscon = <&syscfg 0x4>;
> >>>>                         snps,pbl = <8>;
> >>>>                         snps,mixed-burst;
> >>>> -                       dma-ranges;
> >>>>                         status = "disabled";
> >>>>                 };
> >>>>
> >>>>                 usbotg_hs: usb@40040000 {
> >>>>                         compatible = "snps,dwc2";
> >>>> -                       dma-ranges;
> >>>>                         reg = <0x40040000 0x40000>;
> >>>>                         interrupts = <77>;
> >>>>                         clocks = <&rcc 0 29>;
> >>>>
> >>>>
> >>>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >>>>> b/arch/arm/boot/dts/stm32f429.dtsi
> >>>>> index 0596d60..3a1cfdd 100644
> >>>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
> >>>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >>>>> @@ -59,8 +59,6 @@
> >>>>>         };
> >>>>>
> >>>>>         soc {
> >>>>> -               dma-ranges = <0xc0000000 0x0 0x10000000>;
> >>>>> -
> >>>>>                 timer2: timer@40000000 {
> >>>>>                         compatible = "st,stm32-timer";
> >>>>>                         reg = <0x40000000 0x400>;
> >>>>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
> >>>>> b/arch/arm/boot/dts/stm32f469-disco.dts
> >>>>> index 9e73656..c2213c0 100644
> >>>>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> >>>>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> >>>>> @@ -64,6 +64,10 @@
> >>>>>         aliases {
> >>>>>                 serial0 = &usart3;
> >>>>>         };
> >>>>> +
> >>>>> +       soc {
> >>>>> +               dma-ranges = <0xc0000000 0x0 0x10000000>;
> >>>>> +       };
> >>>>>  };
> >>>>>
> >>>>>  &clk_hse {
> >>>>> --
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> Br.,
> >>>> Bruno
> >>>>
> >>>
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--94eb2c1a1800228824053fe78b9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have you defined your sdio node within soc node ?=C2=A0</d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-10-27 14:=
57 GMT+02:00 Bruno Herrera <span dir=3D"ltr">&lt;<a href=3D"mailto:bruherre=
ra@gmail.com" target=3D"_blank">bruherrera@gmail.com</a>&gt;</span>:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hi Alex,<br>
<br>
On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue<br>
<div><div class=3D"h5">&lt;<a href=3D"mailto:alexandre.torgue@st.com">alexa=
ndre.torgue@st.com</a>&gt; wrote:<br>
&gt; Hi Bruno,<br>
&gt;<br>
&gt;<br>
&gt; On 10/27/2016 12:43 PM, Bruno Herrera wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Alex,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue<br>
&gt;&gt; &lt;<a href=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st=
.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Bruno,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 10/25/2016 11:06 PM, Bruno Herrera wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Alexandre,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; stm32f469-disco and stm32f429-eval boards use SDRAM st=
art address<br>
&gt;&gt;&gt;&gt;&gt; remapping<br>
&gt;&gt;&gt;&gt;&gt; (to @0) to boost performances. A DMA translation throu=
gh &quot;dma-ranges&quot;<br>
&gt;&gt;&gt;&gt;&gt; property was needed for other masters than the M4 CPU.=
<br>
&gt;&gt;&gt;&gt;&gt; stm32f429-disco doesn&#39;t use remapping so doesn&#39=
;t need this DMA<br>
&gt;&gt;&gt;&gt;&gt; translation.<br>
&gt;&gt;&gt;&gt;&gt; This patches moves this DMA translation definition fro=
m stm32f429 soc<br>
&gt;&gt;&gt;&gt;&gt; file<br>
&gt;&gt;&gt;&gt;&gt; to board files.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Alexandre TORGUE &lt;<a href=3D"mailto:=
alexandre.torgue@st.com">alexandre.torgue@st.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts=
<br>
&gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt;&gt; index 13c7cd2..a763c15 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt;&gt; @@ -82,6 +82,10 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbotg_hs_phy: usbphy=
 {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#phy-cells =3D &lt;0&gt;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;usb-nop-xceiv&quot;;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Shouldn&#39;t also the peripheral dma-ranges property move=
 to board specific<br>
&gt;&gt;&gt;&gt; too?<br>
&gt;&gt;&gt;&gt; I=C2=A0 had this patch for while but I didn&#39;t had the =
time to submit:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Well spot I forgot it. Actually, discussing with Arnd ysterday=
 on IIRC,<br>
&gt;&gt;&gt; empty dma-ranges is not needed. Can you test on your side by r=
emoving<br>
&gt;&gt;&gt; dma-ranges in usb node please ?<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately will take a time for me to set up this environment o=
n<br>
&gt;&gt; the STM32F4-EVAL board.<br>
&gt;&gt; And on the discovery boards we dont have this scenario. That was t=
he<br>
&gt;&gt; main reason I did not submit the patch right away.<br>
&gt;&gt; My conclusion and I might be wrong but is based on the my tests wi=
th<br>
&gt;&gt; SDIO device at STM32F469I-DISCO board.<br>
&gt;&gt;<br>
&gt;&gt; I started this issue as discussion at ST Forum but Maxime gave me =
the<br>
&gt;&gt; hint.<br>
&gt;&gt;<br>
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
&gt;&gt;&gt; I will push a v2 by removing empty dma-ranges if tests are ok =
in your<br>
&gt;&gt;&gt; side.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; From my understating/conclusion is: when empty property(dma-ranges=
) is<br>
&gt;&gt; the device node, the mapping will be taken in consideration when u=
sing<br>
&gt;&gt; DMA otherwise the mapping is ignored.<br>
&gt;&gt; And in the SDIO case it is needed for DEV-&gt;MEM(SDRAM) and<br>
&gt;&gt; MEM(SDRAM)-&gt;DEV. If it is not the case for the devices in quest=
ion so<br>
&gt;&gt; I suppose it can work without the property.<br>
&gt;<br>
&gt;<br>
&gt; For sure translation has to be done but I&#39;m not sure that an empty=
<br>
&gt; &quot;dma-ranges&quot; is needed in device node to activate it. For Et=
hernet empty<br>
&gt; &quot;dma-ranges&quot; is not needed. I will try with usb.<br>
<br>
</div></div>In the case of SDIO it is needed. As example this is my working=
 SDIO node:<br>
<br>
sdio: sdio@40012c00 {<br>
compatible =3D &quot;arm,pl18x&quot;, &quot;arm,primecell&quot;;<br>
arm,primecell-periphid =3D &lt;0x00480181&gt;;<br>
reg =3D &lt;0x40012c00 0x400&gt;;<br>
dmas =3D=C2=A0 &lt;&amp;dma2 6 4 0x10400 0x3&gt;, /* Logical - DevToMem */<=
br>
&lt;&amp;dma2 3 4 0x10400 0x3&gt;; /* Logical - MemToDev */<br>
dma-names =3D &quot;rx&quot;, &quot;tx&quot;;<br>
clocks =3D &lt;&amp;rcc 0 171&gt;;<br>
clock-names =3D &quot;apb_pclk&quot;;<br>
interrupts =3D &lt;49&gt;;<br>
status =3D &quot;disabled&quot;;<br>
};<br>
<br>
&amp;sdio {<br>
status =3D &quot;okay&quot;;<br>
vmmc-supply =3D &lt;&amp;wlan_en&gt;;<br>
bus-width =3D &lt;4&gt;;<br>
max-frequency =3D &lt;24000000&gt;;<br>
pinctrl-names =3D &quot;default&quot;;<br>
pinctrl-0 =3D &lt;&amp;sdio_pins&gt;;<br>
ti,non-removable;<br>
ti,needs-special-hs-handling;<br>
dma-ranges;<br>
cap-power-off-card;<br>
keep-power-in-suspend;<br>
<br>
#address-cells =3D &lt;1&gt;;<br>
#size-cells =3D &lt;0&gt;;<br>
wlcore: wlcore@0 {<br>
compatible =3D &quot;ti,wl1835&quot;;<br>
reg =3D &lt;2&gt;;<br>
interrupt-parent =3D &lt;&amp;gpioa&gt;;<br>
interrupts =3D &lt;8 IRQ_TYPE_EDGE_RISING&gt;;<br>
};<br>
};<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; alex<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks in advance<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Author: Bruno Herrera &lt;<a href=3D"mailto:bruherrera@gma=
il.com">bruherrera@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; Date:=C2=A0 =C2=A0Sun Oct 16 14:50:00 2016 -0200<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ARM: DT: STM32: Use dma-ranges property=
 per board not at dtsi file<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt; index 6bfc595..2a22a82 100644<br>
&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32429i-<wbr>eval.dts<br>
&gt;&gt;&gt;&gt; @@ -52,6 +52,10 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;STMicroel=
ectronics STM32429i-EVAL board&quot;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,s=
tm32429i-eval&quot;, &quot;st,stm32f429&quot;;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm=
a-ranges =3D &lt;0xC0000000 0x0 0x10000000&gt;;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bootargs =3D &quot;root=3D/dev/ram rdinit=3D/linuxrc&quot;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0stdout-path =3D &quot;serial0:115200n8&quot;;<br>
&gt;&gt;&gt;&gt; @@ -96,6 +100,7 @@<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 &amp;ethernet0 {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quo=
t;;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &lt;&amp;ethernet0_mii&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names=C2=A0 =C2=
=A0=3D &quot;default&quot;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;mii-id&quot;;<br>
&gt;&gt;&gt;&gt; @@ -116,6 +121,7 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 &amp;usbotg_hs {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dr_mode =3D &quot;host&qu=
ot;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phys =3D &lt;&amp;usbotg_=
hs_phy&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy-names =3D &quot;usb2-=
phy&quot;;<br>
&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt; index 7d624a2..697a133 100644<br>
&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt; @@ -59,7 +59,6 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dm=
a-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0timer2: timer@40000000 {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32-timer&quot;;<b=
r>
&gt;&gt;&gt;&gt; @@ -472,13 +471,11 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,syscon =3D &lt;&amp;syscfg 0x4&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snps,pbl =3D &lt;8&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snps,mixed-burst;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0};<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0usbotg_hs: usb@40040000 {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;snps,dwc2&quot;;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-ranges;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40040000 0x40000&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;77&gt;;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;rcc 0 29&gt;;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt;&gt; index 0596d60..3a1cfdd 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f429.<wbr>dtsi<br>
&gt;&gt;&gt;&gt;&gt; @@ -59,8 +59,6 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0timer2: timer@40000000 {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;st,stm32-timer&quot=
;;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x40000000 0x400&gt;;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/arch/arm/boot/dts/stm32f469-<wbr>disco.dt=
s<br>
&gt;&gt;&gt;&gt;&gt; b/arch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;&gt;&gt;&gt; index 9e73656..c2213c0 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/arch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;&gt;&gt;&gt; +++ b/arch/arm/boot/dts/stm32f469-<wbr>disco.dts<br>
&gt;&gt;&gt;&gt;&gt; @@ -64,6 +64,10 @@<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0serial0 =3D &amp;usart3;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dma-ranges =3D &lt;0xc0000000 0x0 0x10000000&gt;;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 };<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 &amp;clk_hse {<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Br.,<br>
&gt;&gt;&gt;&gt; Bruno<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.<wbr>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr>mailman/=
listinfo/linux-arm-<wbr>kernel</a><br>
</div></div></blockquote></div><br></div>

--94eb2c1a1800228824053fe78b9b--
