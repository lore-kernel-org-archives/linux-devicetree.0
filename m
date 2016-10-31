From: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: stm32: move dma translation to board files
Date: Mon, 31 Oct 2016 14:41:31 -0200
Message-ID: <CAF3+Tqdz+92yxuSwZHdQ01d-G-bBNtzayKyP2-_On2APvFyLNA@mail.gmail.com>
References: <CAF3+Tqd2MGmz+8XhLXhaZiEc78QOwHSpVrQA65-p1AcfT+_xgg@mail.gmail.com>
 <404315f0-fc9e-93e2-54df-f85e484d9389@st.com> <CAF3+TqdzESUNbkmAVv42pNv13wuyuPgGgksK3pJbORYw2a8ZFQ@mail.gmail.com>
 <65096fbe-3f06-c8db-fbe8-29f0be28cb61@st.com> <CAF3+TqcxVj9f7kcSQTKDercVfvDdLzAXGpUU1oAxeNBFZx73nQ@mail.gmail.com>
 <CAFvLkMQGVygLb9SQ8o+2Q=bg7vvRjpHypmSyjRyLkdcHypoFHw@mail.gmail.com>
 <CAF3+TqcFnXENmX4OpG9jzhPhuaq-EqNsRhhjKgFjHA96DLqK5g@mail.gmail.com> <CAFvLkMQ6YMg4sf2Ug8x4-YshwnjbLz3aVzm+JpKP6zG9r-WU4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=94eb2c193b6e8a15b605402be240
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFvLkMQ6YMg4sf2Ug8x4-YshwnjbLz3aVzm+JpKP6zG9r-WU4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, ">" <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ">" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--94eb2c193b6e8a15b605402be240
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 12:14 PM, Rados=C5=82aw Pietrzyk
<radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This is weird because dma ddresses are recalculated using parent's
> dma-ranges property and soc already has it so there should be absolutely =
no
> problem.

These are my DTS and DTSI file.
>
> 2016-10-31 11:27 GMT+01:00 Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>
>> On Fri, Oct 28, 2016 at 5:09 AM, Rados=C5=82aw Pietrzyk
>> <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Have you defined your sdio node within soc node ?
>>
>> It is in the SOC node of the DSTI file.
>>
>> >
>> > 2016-10-27 14:57 GMT+02:00 Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> >>
>> >> Hi Alex,
>> >>
>> >> On Thu, Oct 27, 2016 at 10:21 AM, Alexandre Torgue
>> >> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> >> > Hi Bruno,
>> >> >
>> >> >
>> >> > On 10/27/2016 12:43 PM, Bruno Herrera wrote:
>> >> >>
>> >> >> Hi Alex,
>> >> >>
>> >> >> On Wed, Oct 26, 2016 at 7:09 AM, Alexandre Torgue
>> >> >> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> >> >>>
>> >> >>> Hi Bruno,
>> >> >>>
>> >> >>> On 10/25/2016 11:06 PM, Bruno Herrera wrote:
>> >> >>>>
>> >> >>>>
>> >> >>>> Hi Alexandre,
>> >> >>>>
>> >> >>>>>
>> >> >>>>> stm32f469-disco and stm32f429-eval boards use SDRAM start addre=
ss
>> >> >>>>> remapping
>> >> >>>>> (to @0) to boost performances. A DMA translation through
>> >> >>>>> "dma-ranges"
>> >> >>>>> property was needed for other masters than the M4 CPU.
>> >> >>>>> stm32f429-disco doesn't use remapping so doesn't need this DMA
>> >> >>>>> translation.
>> >> >>>>> This patches moves this DMA translation definition from stm32f4=
29
>> >> >>>>> soc
>> >> >>>>> file
>> >> >>>>> to board files.
>> >> >>>>>
>> >> >>>>> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>> >> >>>>>
>> >> >>>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>>> b/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>>> index 13c7cd2..a763c15 100644
>> >> >>>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>>> @@ -82,6 +82,10 @@
>> >> >>>>>                 };
>> >> >>>>>         };
>> >> >>>>>
>> >> >>>>> +       soc {
>> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >> >>>>> +       };
>> >> >>>>> +
>> >> >>>>>         usbotg_hs_phy: usbphy {
>> >> >>>>>                 #phy-cells =3D <0>;
>> >> >>>>>                 compatible =3D "usb-nop-xceiv";
>> >> >>>>
>> >> >>>>
>> >> >>>>
>> >> >>>> Shouldn't also the peripheral dma-ranges property move to board
>> >> >>>> specific
>> >> >>>> too?
>> >> >>>> I  had this patch for while but I didn't had the time to submit:
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> Well spot I forgot it. Actually, discussing with Arnd ysterday on
>> >> >>> IIRC,
>> >> >>> empty dma-ranges is not needed. Can you test on your side by
>> >> >>> removing
>> >> >>> dma-ranges in usb node please ?
>> >> >>
>> >> >> Unfortunately will take a time for me to set up this environment o=
n
>> >> >> the STM32F4-EVAL board.
>> >> >> And on the discovery boards we dont have this scenario. That was t=
he
>> >> >> main reason I did not submit the patch right away.
>> >> >> My conclusion and I might be wrong but is based on the my tests wi=
th
>> >> >> SDIO device at STM32F469I-DISCO board.
>> >> >>
>> >> >> I started this issue as discussion at ST Forum but Maxime gave me
>> >> >> the
>> >> >> hint.
>> >> >>
>> >> >>
>> >> >>
>> >> >>
>> >> >> https://my.st.com/public/STe2ecommunities/mcu/Lists/cortex_mx_stm3=
2/Flat.aspx?RootFolder=3Dhttps%3a%2f%2fmy%2est%2ecom%2fpublic%2fSTe2ecommun=
ities%2fmcu%2fLists%2fcortex_mx_stm32%2fDMA2%20and%20SYSCFG_MEMRMP%20relati=
onship&FolderCTID=3D0x01200200770978C69A1141439FE559EB459D7580009C4E14902C3=
CDE46A77F0FFD06506F5B&currentviews=3D44
>> >> >>
>> >> >>> I will push a v2 by removing empty dma-ranges if tests are ok in
>> >> >>> your
>> >> >>> side.
>> >> >>
>> >> >>
>> >> >> From my understating/conclusion is: when empty property(dma-ranges=
)
>> >> >> is
>> >> >> the device node, the mapping will be taken in consideration when
>> >> >> using
>> >> >> DMA otherwise the mapping is ignored.
>> >> >> And in the SDIO case it is needed for DEV->MEM(SDRAM) and
>> >> >> MEM(SDRAM)->DEV. If it is not the case for the devices in question
>> >> >> so
>> >> >> I suppose it can work without the property.
>> >> >
>> >> >
>> >> > For sure translation has to be done but I'm not sure that an empty
>> >> > "dma-ranges" is needed in device node to activate it. For Ethernet
>> >> > empty
>> >> > "dma-ranges" is not needed. I will try with usb.
>> >>
>> >> In the case of SDIO it is needed. As example this is my working SDIO
>> >> node:
>> >>
>> >> sdio: sdio@40012c00 {
>> >> compatible =3D "arm,pl18x", "arm,primecell";
>> >> arm,primecell-periphid =3D <0x00480181>;
>> >> reg =3D <0x40012c00 0x400>;
>> >> dmas =3D  <&dma2 6 4 0x10400 0x3>, /* Logical - DevToMem */
>> >> <&dma2 3 4 0x10400 0x3>; /* Logical - MemToDev */
>> >> dma-names =3D "rx", "tx";
>> >> clocks =3D <&rcc 0 171>;
>> >> clock-names =3D "apb_pclk";
>> >> interrupts =3D <49>;
>> >> status =3D "disabled";
>> >> };
>> >>
>> >> &sdio {
>> >> status =3D "okay";
>> >> vmmc-supply =3D <&wlan_en>;
>> >> bus-width =3D <4>;
>> >> max-frequency =3D <24000000>;
>> >> pinctrl-names =3D "default";
>> >> pinctrl-0 =3D <&sdio_pins>;
>> >> ti,non-removable;
>> >> ti,needs-special-hs-handling;
>> >> dma-ranges;
>> >> cap-power-off-card;
>> >> keep-power-in-suspend;
>> >>
>> >> #address-cells =3D <1>;
>> >> #size-cells =3D <0>;
>> >> wlcore: wlcore@0 {
>> >> compatible =3D "ti,wl1835";
>> >> reg =3D <2>;
>> >> interrupt-parent =3D <&gpioa>;
>> >> interrupts =3D <8 IRQ_TYPE_EDGE_RISING>;
>> >> };
>> >> };
>> >>
>> >> >
>> >> > alex
>> >> >
>> >> >
>> >> >>
>> >> >>>
>> >> >>> Thanks in advance
>> >> >>> Alex
>> >> >>>
>> >> >>>
>> >> >>>>
>> >> >>>> Author: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >> >>>> Date:   Sun Oct 16 14:50:00 2016 -0200
>> >> >>>>
>> >> >>>>     ARM: DT: STM32: Use dma-ranges property per board not at dts=
i
>> >> >>>> file
>> >> >>>>
>> >> >>>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>> b/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>> index 6bfc595..2a22a82 100644
>> >> >>>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> >> >>>> @@ -52,6 +52,10 @@
>> >> >>>>         model =3D "STMicroelectronics STM32429i-EVAL board";
>> >> >>>>         compatible =3D "st,stm32429i-eval", "st,stm32f429";
>> >> >>>>
>> >> >>>> +       soc {
>> >> >>>> +               dma-ranges =3D <0xC0000000 0x0 0x10000000>;
>> >> >>>> +       };
>> >> >>>> +
>> >> >>>>         chosen {
>> >> >>>>                 bootargs =3D "root=3D/dev/ram rdinit=3D/linuxrc"=
;
>> >> >>>>                 stdout-path =3D "serial0:115200n8";
>> >> >>>> @@ -96,6 +100,7 @@
>> >> >>>>
>> >> >>>>  &ethernet0 {
>> >> >>>>         status =3D "okay";
>> >> >>>> +       dma-ranges;
>> >> >>>>         pinctrl-0       =3D <&ethernet0_mii>;
>> >> >>>>         pinctrl-names   =3D "default";
>> >> >>>>         phy-mode        =3D "mii-id";
>> >> >>>> @@ -116,6 +121,7 @@
>> >> >>>>  };
>> >> >>>>
>> >> >>>>  &usbotg_hs {
>> >> >>>> +       dma-ranges;
>> >> >>>>         dr_mode =3D "host";
>> >> >>>>         phys =3D <&usbotg_hs_phy>;
>> >> >>>>         phy-names =3D "usb2-phy";
>> >> >>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>> b/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>> index 7d624a2..697a133 100644
>> >> >>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>> @@ -59,7 +59,6 @@
>> >> >>>>         };
>> >> >>>>
>> >> >>>>         soc {
>> >> >>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >> >>>>
>> >> >>>>                 timer2: timer@40000000 {
>> >> >>>>                         compatible =3D "st,stm32-timer";
>> >> >>>> @@ -472,13 +471,11 @@
>> >> >>>>                         st,syscon =3D <&syscfg 0x4>;
>> >> >>>>                         snps,pbl =3D <8>;
>> >> >>>>                         snps,mixed-burst;
>> >> >>>> -                       dma-ranges;
>> >> >>>>                         status =3D "disabled";
>> >> >>>>                 };
>> >> >>>>
>> >> >>>>                 usbotg_hs: usb@40040000 {
>> >> >>>>                         compatible =3D "snps,dwc2";
>> >> >>>> -                       dma-ranges;
>> >> >>>>                         reg =3D <0x40040000 0x40000>;
>> >> >>>>                         interrupts =3D <77>;
>> >> >>>>                         clocks =3D <&rcc 0 29>;
>> >> >>>>
>> >> >>>>
>> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>>> b/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>>> index 0596d60..3a1cfdd 100644
>> >> >>>>> --- a/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>>> +++ b/arch/arm/boot/dts/stm32f429.dtsi
>> >> >>>>> @@ -59,8 +59,6 @@
>> >> >>>>>         };
>> >> >>>>>
>> >> >>>>>         soc {
>> >> >>>>> -               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >> >>>>> -
>> >> >>>>>                 timer2: timer@40000000 {
>> >> >>>>>                         compatible =3D "st,stm32-timer";
>> >> >>>>>                         reg =3D <0x40000000 0x400>;
>> >> >>>>> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
>> >> >>>>> b/arch/arm/boot/dts/stm32f469-disco.dts
>> >> >>>>> index 9e73656..c2213c0 100644
>> >> >>>>> --- a/arch/arm/boot/dts/stm32f469-disco.dts
>> >> >>>>> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
>> >> >>>>> @@ -64,6 +64,10 @@
>> >> >>>>>         aliases {
>> >> >>>>>                 serial0 =3D &usart3;
>> >> >>>>>         };
>> >> >>>>> +
>> >> >>>>> +       soc {
>> >> >>>>> +               dma-ranges =3D <0xc0000000 0x0 0x10000000>;
>> >> >>>>> +       };
>> >> >>>>>  };
>> >> >>>>>
>> >> >>>>>  &clk_hse {
>> >> >>>>> --
>> >> >>>>
>> >> >>>>
>> >> >>>>
>> >> >>>>
>> >> >>>> Br.,
>> >> >>>> Bruno
>> >> >>>>
>> >> >>>
>> >> >
>> >>
>> >> _______________________________________________
>> >> linux-arm-kernel mailing list
>> >> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>> >
>> >
>
>

--94eb2c193b6e8a15b605402be240
Content-Type: application/octet-stream; name="stm32f469-disco.dts"
Content-Disposition: attachment; filename="stm32f469-disco.dts"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iuyalmj00

LyoKICogQ29weXJpZ2h0IDIwMTYgLSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgog
KgogKiBUaGlzIGZpbGUgaXMgZHVhbC1saWNlbnNlZDogeW91IGNhbiB1c2UgaXQgZWl0aGVyIHVu
ZGVyIHRoZSB0ZXJtcwogKiBvZiB0aGUgR1BMIG9yIHRoZSBYMTEgbGljZW5zZSwgYXQgeW91ciBv
cHRpb24uIE5vdGUgdGhhdCB0aGlzIGR1YWwKICogbGljZW5zaW5nIG9ubHkgYXBwbGllcyB0byB0
aGlzIGZpbGUsIGFuZCBub3QgdGhpcyBwcm9qZWN0IGFzIGEKICogd2hvbGUuCiAqCiAqICBhKSBU
aGlzIGZpbGUgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
CiAqICAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcwogKiAgICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlCiAqICAgICBMaWNlbnNlLCBvciAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgogKgogKiAgICAgVGhpcyBmaWxlIGlzIGRpc3Ry
aWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiAqICAgICBidXQgV0lU
SE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgog
KiAgICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQogKiAgICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0
YWlscy4KICoKICogICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYwogKiAgICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgZmlsZTsgaWYg
bm90LCB3cml0ZSB0byB0aGUgRnJlZQogKiAgICAgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwg
NTEgRnJhbmtsaW4gU3QsIEZpZnRoIEZsb29yLCBCb3N0b24sCiAqICAgICBNQSAwMjExMC0xMzAx
IFVTQQogKgogKiBPciwgYWx0ZXJuYXRpdmVseSwKICoKICogIGIpIFBlcm1pc3Npb24gaXMgaGVy
ZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uCiAqICAgICBvYnRhaW5p
bmcgYSBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbgog
KiAgICAgZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0
aG91dAogKiAgICAgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhl
IHJpZ2h0cyB0byB1c2UsCiAqICAgICBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0
cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3IKICogICAgIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0
d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCiAqICAgICBTb2Z0d2FyZSBp
cyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZwogKiAgICAgY29u
ZGl0aW9uczoKICoKICogICAgIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBl
cm1pc3Npb24gbm90aWNlIHNoYWxsIGJlCiAqICAgICBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KICoKICogICAgIFRIRSBTT0ZU
V0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELAog
KiAgICAgRVhQUkVTUyBPUiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRI
RSBXQVJSQU5USUVTCiAqICAgICBPRiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORAogKiAgICAgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SUyBPUiBDT1BZUklHSFQKICogICAgIEhPTERFUlMgQkUgTElBQkxFIEZP
UiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLAogKiAgICAgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HCiAqICAg
ICBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUg
VVNFIE9SCiAqICAgICBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCiAqLwoKL2R0cy12
MS87CiNpbmNsdWRlICJzdG0zMmY0MjkuZHRzaSIKI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0
L2lucHV0Lmg+CiNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgoKLyB7Cgltb2RlbCA9ICJTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzJGNDY5aS1ESVNDTyBib2FyZCI7Cgljb21wYXRpYmxlID0gInN0
LHN0bTMyZjQ2OWktZGlzY28iLCAic3Qsc3RtMzJmNDY5IjsKCglzb2MgewoJCWRtYS1yYW5nZXMg
PSA8MHhDMDAwMDAwMCAweDAgMHgxMDAwMDAwMD47Cgl9OwoKCWNob3NlbiB7CgkJYm9vdGFyZ3Mg
PSAicm9vdD0vZGV2L3NkYTEgcm9vdGZzdHlwZT1leHQ0IHJvIHJvb3R3YWl0IGNsa19pZ25vcmVf
dW51c2VkIHVzZXJfZGVidWc9MzEiOwoJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgi
OwoJfTsKCgltZW1vcnkgewoJCXJlZyA9IDwweDAwMDAwMDAwIDB4MTAwMDAwMD47Cgl9OwoKCWFs
aWFzZXMgewoJCXNlcmlhbDAgPSAmdXNhcnQzOwoJfTsKCn07CgomY2xrX2hzZSB7CgljbG9jay1m
cmVxdWVuY3kgPSA8ODAwMDAwMD47Cn07CgomdXNhcnQzIHsKCXBpbmN0cmwtMCA9IDwmdXNhcnQz
X3BpbnNfYT47CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJc3RhdHVzID0gIm9rYXkiOwp9
OwoKJnNkaW8gewoJc3RhdHVzID0gIm9rYXkiOwoJYnVzLXdpZHRoID0gPDQ+OwoJbWF4LWZyZXF1
ZW5jeSA9IDwyNDAwMDAwMD47CglwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwoJcGluY3RybC0w
ID0gPCZzZGlvX3BpbnM+OwoJdGksbm9uLXJlbW92YWJsZTsKCXRpLG5lZWRzLXNwZWNpYWwtaHMt
aGFuZGxpbmc7CglkbWEtcmFuZ2VzOwoJY2FwLXBvd2VyLW9mZi1jYXJkOwoJa2VlcC1wb3dlci1p
bi1zdXNwZW5kOwoKCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJI3NpemUtY2VsbHMgPSA8MD47Cgl3
bGNvcmU6IHdsY29yZUAwIHsKCQljb21wYXRpYmxlID0gInRpLHdsMTgzNSI7CgkJcmVnID0gPDI+
OwoJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9hPjsKCQlpbnRlcnJ1cHRzID0gPDggSVJRX1RZ
UEVfRURHRV9SSVNJTkc+OwoJfTsKfTsK
--94eb2c193b6e8a15b605402be240
Content-Type: application/octet-stream; name="stm32f429.dtsi"
Content-Disposition: attachment; filename="stm32f429.dtsi"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iuyalmj51

LyoKICogQ29weXJpZ2h0IDIwMTUgLSBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20+CiAqCiAqIFRoaXMgZmlsZSBpcyBkdWFsLWxpY2Vuc2VkOiB5b3UgY2FuIHVzZSBp
dCBlaXRoZXIgdW5kZXIgdGhlIHRlcm1zCiAqIG9mIHRoZSBHUEwgb3IgdGhlIFgxMSBsaWNlbnNl
LCBhdCB5b3VyIG9wdGlvbi4gTm90ZSB0aGF0IHRoaXMgZHVhbAogKiBsaWNlbnNpbmcgb25seSBh
cHBsaWVzIHRvIHRoaXMgZmlsZSwgYW5kIG5vdCB0aGlzIHByb2plY3QgYXMgYQogKiB3aG9sZS4K
ICoKICogIGEpIFRoaXMgZmlsZSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IKICogICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCiAqICAgICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUKICogICAgIExpY2Vuc2Us
IG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCiAqCiAqICAgICBUaGlzIGZp
bGUgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKICog
ICAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCiAqICAgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlCiAqICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9yZSBkZXRhaWxzLgogKgogKiAgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCiAqICAgICBMaWNlbnNlIGFsb25nIHdpdGggdGhp
cyBmaWxlOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlCiAqICAgICBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdCwgRmlmdGggRmxvb3IsIEJvc3RvbiwKICogICAgIE1B
IDAyMTEwLTEzMDEgVVNBCiAqCiAqIE9yLCBhbHRlcm5hdGl2ZWx5LAogKgogKiAgYikgUGVybWlz
c2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24KICog
ICAgIG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1
bWVudGF0aW9uCiAqICAgICBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBT
b2Z0d2FyZSB3aXRob3V0CiAqICAgICByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGlt
aXRhdGlvbiB0aGUgcmlnaHRzIHRvIHVzZSwKICogICAgIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1
Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgogKiAgICAgc2VsbCBjb3BpZXMg
b2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKICogICAg
IFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5n
CiAqICAgICBjb25kaXRpb25zOgogKgogKiAgICAgVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2Ug
YW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUKICogICAgIGluY2x1ZGVkIGluIGFs
bCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgogKgogKiAg
ICAgVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0Yg
QU5ZIEtJTkQsCiAqICAgICBFWFBSRVNTIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJ
TUlURUQgVE8gVEhFIFdBUlJBTlRJRVMKICogICAgIE9GIE1FUkNIQU5UQUJJTElUWSwgRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5ECiAqICAgICBOT05JTkZSSU5HRU1FTlQuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVAogKiAgICAgSE9MREVSUyBC
RSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksCiAqICAg
ICBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFS
SVNJTkcKICogICAgIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IKICogICAgIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4K
ICovCgojaW5jbHVkZSAic2tlbGV0b24uZHRzaSIKI2luY2x1ZGUgImFybXY3LW0uZHRzaSIKI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzJmNDI5LXBpbmZ1bmMuaD4KCi8gewoJY2xv
Y2tzIHsKCQljbGtfaHNlOiBjbGstaHNlIHsKCQkJI2Nsb2NrLWNlbGxzID0gPDA+OwoJCQljb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsKCQkJY2xvY2stZnJlcXVlbmN5ID0gPDA+OwoJCX07Cgl9
OwoKCXNvYyB7CgoJCXRpbWVyMjogdGltZXJANDAwMDAwMDAgewoJCQljb21wYXRpYmxlID0gInN0
LHN0bTMyLXRpbWVyIjsKCQkJcmVnID0gPDB4NDAwMDAwMDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRz
ID0gPDI4PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxMjg+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OwoJCX07CgoJCXRpbWVyMzogdGltZXJANDAwMDA0MDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0
bTMyLXRpbWVyIjsKCQkJcmVnID0gPDB4NDAwMDA0MDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0g
PDI5PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxMjk+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJ
CX07CgoJCXRpbWVyNDogdGltZXJANDAwMDA4MDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMy
LXRpbWVyIjsKCQkJcmVnID0gPDB4NDAwMDA4MDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0gPDMw
PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxMzA+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07
CgoJCXRpbWVyNTogdGltZXJANDAwMDBjMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXRp
bWVyIjsKCQkJcmVnID0gPDB4NDAwMDBjMDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0gPDUwPjsK
CQkJY2xvY2tzID0gPCZyY2MgMCAxMzE+OwoJCX07CgoJCXRpbWVyNjogdGltZXJANDAwMDEwMDAg
ewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXRpbWVyIjsKCQkJcmVnID0gPDB4NDAwMDEwMDAg
MHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0gPDU0PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxMzI+OwoJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXRpbWVyNzogdGltZXJANDAwMDE0MDAgewoJ
CQljb21wYXRpYmxlID0gInN0LHN0bTMyLXRpbWVyIjsKCQkJcmVnID0gPDB4NDAwMDE0MDAgMHg0
MDA+OwoJCQlpbnRlcnJ1cHRzID0gPDU1PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxMzM+OwoJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXVzYXJ0Mjogc2VyaWFsQDQwMDA0NDAwIHsKCQkJ
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMi11c2FydCIsICJzdCxzdG0zMi11YXJ0IjsKCQkJcmVnID0g
PDB4NDAwMDQ0MDAgMHg0MDA+OwoJCQlpbnRlcnJ1cHRzID0gPDM4PjsKCQkJY2xvY2tzID0gIDwm
cmNjIDAgMTQ1PjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQl9OwoKCQl1c2FydDM6IHNlcmlh
bEA0MDAwNDgwMCB7CgkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzItdXNhcnQiLCAic3Qsc3RtMzIt
dWFydCI7CgkJCXJlZyA9IDwweDQwMDA0ODAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDwzOT47
CgkJCWNsb2NrcyA9IDwmcmNjIDAgMTQ2PjsKCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCQkJLypk
bWFzID0gPCZkbWExIDEgNCAweDQwMCAweDA+LAoJCQkgICAgICAgPCZkbWExIDMgNCAweDQwMCAw
eDA+OwoJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOyovCgkJfTsKCgkJdXNhcnQ0OiBzZXJpYWxA
NDAwMDRjMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXVhcnQiOwoJCQlyZWcgPSA8MHg0
MDAwNGMwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8NTI+OwoJCQljbG9ja3MgPSA8JnJjYyAw
IDE0Nz47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdXNhcnQ1OiBzZXJpYWxANDAw
MDUwMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXVhcnQiOwoJCQlyZWcgPSA8MHg0MDAw
NTAwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8NTM+OwoJCQljbG9ja3MgPSA8JnJjYyAwIDE0
OD47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdXNhcnQ3OiBzZXJpYWxANDAwMDc4
MDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXVzYXJ0IiwgInN0LHN0bTMyLXVhcnQiOwoJ
CQlyZWcgPSA8MHg0MDAwNzgwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8ODI+OwoJCQljbG9j
a3MgPSA8JnJjYyAwIDE1OD47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdXNhcnQ4
OiBzZXJpYWxANDAwMDdjMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXVzYXJ0IiwgInN0
LHN0bTMyLXVhcnQiOwoJCQlyZWcgPSA8MHg0MDAwN2MwMCAweDQwMD47CgkJCWludGVycnVwdHMg
PSA8ODM+OwoJCQljbG9ja3MgPSA8JnJjYyAwIDE1OT47CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CgkJfTsKCgkJdXNhcnQxOiBzZXJpYWxANDAwMTEwMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0
bTMyLXVzYXJ0IiwgInN0LHN0bTMyLXVhcnQiOwoJCQlyZWcgPSA8MHg0MDAxMTAwMCAweDQwMD47
CgkJCWludGVycnVwdHMgPSA8Mzc+OwoJCQljbG9ja3MgPSA8JnJjYyAwIDE2ND47CgkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CgkJCS8qZG1hcyA9IDwmZG1hMiAyIDQgMHg0MDAgMHgwPiwKCQkJICAg
ICAgIDwmZG1hMiA3IDQgMHg0MDAgMHgwPjsKCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsqLwoJ
CX07CgoJCXVzYXJ0Njogc2VyaWFsQDQwMDExNDAwIHsKCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0z
Mi11c2FydCIsICJzdCxzdG0zMi11YXJ0IjsKCQkJcmVnID0gPDB4NDAwMTE0MDAgMHg0MDA+OwoJ
CQlpbnRlcnJ1cHRzID0gPDcxPjsKCQkJY2xvY2tzID0gPCZyY2MgMCAxNjU+OwoJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwoJCQlkbWFzID0gPCZkbWEyIDIgNSAweDQwMCAweDA+LAoJCQkgICAgICAg
PCZkbWEyIDcgNSAweDQwMCAweDA+OwoJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOwoJCX07CgoJ
CXNkaW86IHNkaW9ANDAwMTJjMDAgewoJCQljb21wYXRpYmxlID0gImFybSxwbDE4eCIsICJhcm0s
cHJpbWVjZWxsIjsKCQkJYXJtLHByaW1lY2VsbC1wZXJpcGhpZCA9IDwweDAwNDgwMTgxPjsKCQkJ
cmVnID0gPDB4NDAwMTJjMDAgMHg0MDA+OwoJCQlkbWFzID0gIDwmZG1hMiA2IDQgMHgxMDQwMCAw
eDM+LCAvKiBMb2dpY2FsIC0gRGV2VG9NZW0gKi8KCQkJCTwmZG1hMiAzIDQgMHgxMDQwMCAweDM+
OyAvKiBMb2dpY2FsIC0gTWVtVG9EZXYgKi8KCQkJZG1hLW5hbWVzID0gInJ4IiwgInR4IjsKCQkJ
Y2xvY2tzID0gPCZyY2MgMCAxNzE+OwoJCQljbG9jay1uYW1lcyA9ICJhcGJfcGNsayI7CgkJCWlu
dGVycnVwdHMgPSA8NDk+OwoJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwoJCX07CgoJCXN5c2NmZzog
c3lzdGVtLWNvbmZpZ0A0MDAxMzgwMCB7CgkJCWNvbXBhdGlibGUgPSAic3lzY29uIjsKCQkJcmVn
ID0gPDB4NDAwMTM4MDAgMHg0MDA+OwoJCX07CgoJCWV4dGk6IGludGVycnVwdC1jb250cm9sbGVy
QDQwMDEzYzAwIHsKCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1leHRpIjsKCQkJaW50ZXJydXB0
LWNvbnRyb2xsZXI7CgkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CgkJCXJlZyA9IDwweDQwMDEz
QzAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDwxPiwgPDI+LCA8Mz4sIDw2PiwgPDc+LCA8OD4s
IDw5PiwgPDEwPiwgPDIzPiwgPDQwPiwgPDQxPiwgPDQyPiwgPDYyPiwgPDc2PjsKCQl9OwoKCQlw
aW5jdHJsOiBwaW4tY29udHJvbGxlciB7CgkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkjc2l6
ZS1jZWxscyA9IDwxPjsKCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0MjktcGluY3RybCI7CgkJ
CXJhbmdlcyA9IDwwIDB4NDAwMjAwMDAgMHgzMDAwPjsKCQkJaW50ZXJydXB0LXBhcmVudCA9IDwm
ZXh0aT47CgkJCXN0LHN5c2NmZyA9IDwmc3lzY2ZnIDB4OD47CgkJCXBpbnMtYXJlLW51bWJlcmVk
OwoKCQkJZ3Bpb2E6IGdwaW9ANDAwMjAwMDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dw
aW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcgPSA8MHgwIDB4NDAwPjsKCQkJCWNsb2NrcyA9IDwmcmNj
IDAgMD47CgkJCQlzdCxiYW5rLW5hbWUgPSAiR1BJT0EiOwoJCQl9OwoKCQkJZ3Bpb2I6IGdwaW9A
NDAwMjA0MDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8Mj47CgkJ
CQlyZWcgPSA8MHg0MDAgMHg0MDA+OwoJCQkJY2xvY2tzID0gPCZyY2MgMCAxPjsKCQkJCXN0LGJh
bmstbmFtZSA9ICJHUElPQiI7CgkJCX07CgoJCQlncGlvYzogZ3Bpb0A0MDAyMDgwMCB7CgkJCQln
cGlvLWNvbnRyb2xsZXI7CgkJCQkjZ3Bpby1jZWxscyA9IDwyPjsKCQkJCXJlZyA9IDwweDgwMCAw
eDQwMD47CgkJCQljbG9ja3MgPSA8JnJjYyAwIDI+OwoJCQkJc3QsYmFuay1uYW1lID0gIkdQSU9D
IjsKCQkJfTsKCgkJCWdwaW9kOiBncGlvQDQwMDIwYzAwIHsKCQkJCWdwaW8tY29udHJvbGxlcjsK
CQkJCSNncGlvLWNlbGxzID0gPDI+OwoJCQkJcmVnID0gPDB4YzAwIDB4NDAwPjsKCQkJCWNsb2Nr
cyA9IDwmcmNjIDAgMz47CgkJCQlzdCxiYW5rLW5hbWUgPSAiR1BJT0QiOwoJCQl9OwoKCQkJZ3Bp
b2U6IGdwaW9ANDAwMjEwMDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMg
PSA8Mj47CgkJCQlyZWcgPSA8MHgxMDAwIDB4NDAwPjsKCQkJCWNsb2NrcyA9IDwmcmNjIDAgND47
CgkJCQlzdCxiYW5rLW5hbWUgPSAiR1BJT0UiOwoJCQl9OwoKCQkJZ3Bpb2Y6IGdwaW9ANDAwMjE0
MDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcg
PSA8MHgxNDAwIDB4NDAwPjsKCQkJCWNsb2NrcyA9IDwmcmNjIDAgNT47CgkJCQlzdCxiYW5rLW5h
bWUgPSAiR1BJT0YiOwoJCQl9OwoKCQkJZ3Bpb2c6IGdwaW9ANDAwMjE4MDAgewoJCQkJZ3Bpby1j
b250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcgPSA8MHgxODAwIDB4NDAw
PjsKCQkJCWNsb2NrcyA9IDwmcmNjIDAgNj47CgkJCQlzdCxiYW5rLW5hbWUgPSAiR1BJT0ciOwoJ
CQl9OwoKCQkJZ3Bpb2g6IGdwaW9ANDAwMjFjMDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJ
I2dwaW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcgPSA8MHgxYzAwIDB4NDAwPjsKCQkJCWNsb2NrcyA9
IDwmcmNjIDAgNz47CgkJCQlzdCxiYW5rLW5hbWUgPSAiR1BJT0giOwoJCQl9OwoKCQkJZ3Bpb2k6
IGdwaW9ANDAwMjIwMDAgewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8
Mj47CgkJCQlyZWcgPSA8MHgyMDAwIDB4NDAwPjsKCQkJCWNsb2NrcyA9IDwmcmNjIDAgOD47CgkJ
CQlzdCxiYW5rLW5hbWUgPSAiR1BJT0kiOwoJCQl9OwoKCQkJZ3Bpb2o6IGdwaW9ANDAwMjI0MDAg
ewoJCQkJZ3Bpby1jb250cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcgPSA8
MHgyNDAwIDB4NDAwPjsKCQkJCWNsb2NrcyA9IDwmcmNjIDAgOT47CgkJCQlzdCxiYW5rLW5hbWUg
PSAiR1BJT0oiOwoJCQl9OwoKCQkJZ3Bpb2s6IGdwaW9ANDAwMjI4MDAgewoJCQkJZ3Bpby1jb250
cm9sbGVyOwoJCQkJI2dwaW8tY2VsbHMgPSA8Mj47CgkJCQlyZWcgPSA8MHgyODAwIDB4NDAwPjsK
CQkJCWNsb2NrcyA9IDwmcmNjIDAgMTA+OwoJCQkJc3QsYmFuay1uYW1lID0gIkdQSU9LIjsKCQkJ
fTsKCgkJCXVzYXJ0MV9waW5zX2E6IHVzYXJ0MUAwIHsKCQkJCXBpbnMxIHsKCQkJCQlwaW5tdXgg
PSA8U1RNMzJGNDI5X1BBOV9GVU5DX1VTQVJUMV9UWD47CgkJCQkJYmlhcy1kaXNhYmxlOwoJCQkJ
CWRyaXZlLXB1c2gtcHVsbDsKCQkJCQlzbGV3LXJhdGUgPSA8MD47CgkJCQl9OwoJCQkJcGluczIg
ewoJCQkJCXBpbm11eCA9IDxTVE0zMkY0MjlfUEExMF9GVU5DX1VTQVJUMV9SWD47CgkJCQkJYmlh
cy1kaXNhYmxlOwoJCQkJfTsKCQkJfTsKCgkJCXVzYXJ0Nl9waW5zX2E6IHVzYXJ0NkAwIHsKCQkJ
CXBpbnMxIHsKCQkJCQlwaW5tdXggPSA8U1RNMzJGNDI5X1BHMTRfRlVOQ19VU0FSVDZfVFg+LAoJ
CQkJCQkgPFNUTTMyRjQyOV9QRzEyX0ZVTkNfVVNBUlQ2X1JUUz47CgkJCQkJYmlhcy1kaXNhYmxl
OwoJCQkJCWRyaXZlLXB1c2gtcHVsbDsKCQkJCQlzbGV3LXJhdGUgPSA8Mj47CgkJCQl9OwoJCQkJ
cGluczIgewoJCQkJCXBpbm11eCA9IDxTVE0zMkY0MjlfUEc5X0ZVTkNfVVNBUlQ2X1JYPiwKCQkJ
CQkJIDxTVE0zMkY0MjlfUEcxM19GVU5DX1VTQVJUNl9DVFM+OwoJCQkJCWJpYXMtZGlzYWJsZTsK
CQkJCX07CgkJCX07CgoJCQl1c2JvdGdfZnNfcGluc19hOiB1c2JvdGdfZnNAMCB7CgkJCQlwaW5z
IHsKCQkJCQlwaW5tdXggPSA8U1RNMzJGNDI5X1BBMTBfRlVOQ19PVEdfRlNfSUQ+LAoJCQkJCQkg
PFNUTTMyRjQyOV9QQTExX0ZVTkNfT1RHX0ZTX0RNPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEExMl9G
VU5DX09UR19GU19EUD47CgkJCQkJYmlhcy1kaXNhYmxlOwoJCQkJCWRyaXZlLXB1c2gtcHVsbDsK
CQkJCQlzbGV3LXJhdGUgPSA8Mj47CgkJCQl9OwoJCQl9OwoKCQkJdXNib3RnX2ZzX3BpbnNfYjog
dXNib3RnX2ZzQDEgewoJCQkJcGlucyB7CgkJCQkJcGlubXV4ID0gPFNUTTMyRjQyOV9QQjEyX0ZV
TkNfT1RHX0hTX0lEPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEIxNF9GVU5DX09UR19IU19ETT4sCgkJ
CQkJCSA8U1RNMzJGNDI5X1BCMTVfRlVOQ19PVEdfSFNfRFA+OwoJCQkJCWJpYXMtZGlzYWJsZTsK
CQkJCQlkcml2ZS1wdXNoLXB1bGw7CgkJCQkJc2xldy1yYXRlID0gPDI+OwoJCQkJfTsKCQkJfTsK
CgkJCXVzYXJ0M19waW5zX2E6IHVzYXJ0M0AwIHsKCQkJCXBpbnMxIHsKCQkJCQlwaW5tdXggPSA8
U1RNMzJGNDI5X1BCMTBfRlVOQ19VU0FSVDNfVFg+OwoJCQkJCWJpYXMtZGlzYWJsZTsKCQkJCQlk
cml2ZS1wdXNoLXB1bGw7CgkJCQkJc2xldy1yYXRlID0gPDA+OwoJCQkJfTsKCQkJCXBpbnMyIHsK
CQkJCQlwaW5tdXggPSA8U1RNMzJGNDI5X1BCMTFfRlVOQ19VU0FSVDNfUlg+OwoJCQkJCWJpYXMt
ZGlzYWJsZTsKCQkJCX07CgkJCX07CgoJCQl1c2JvdGdfaHNfcGluc19hOiB1c2JvdGdfaHNAMCB7
CgkJCQlwaW5zIHsKCQkJCQlwaW5tdXggPSA8U1RNMzJGNDI5X1BINF9GVU5DX09UR19IU19VTFBJ
X05YVD4sCgkJCQkJCSA8U1RNMzJGNDI5X1BJMTFfRlVOQ19PVEdfSFNfVUxQSV9ESVI+LAoJCQkJ
CQkgPFNUTTMyRjQyOV9QQzBfRlVOQ19PVEdfSFNfVUxQSV9TVFA+LAoJCQkJCQkgPFNUTTMyRjQy
OV9QQTVfRlVOQ19PVEdfSFNfVUxQSV9DSz4sCgkJCQkJCSA8U1RNMzJGNDI5X1BBM19GVU5DX09U
R19IU19VTFBJX0QwPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEIwX0ZVTkNfT1RHX0hTX1VMUElfRDE+
LAoJCQkJCQkgPFNUTTMyRjQyOV9QQjFfRlVOQ19PVEdfSFNfVUxQSV9EMj4sCgkJCQkJCSA8U1RN
MzJGNDI5X1BCMTBfRlVOQ19PVEdfSFNfVUxQSV9EMz4sCgkJCQkJCSA8U1RNMzJGNDI5X1BCMTFf
RlVOQ19PVEdfSFNfVUxQSV9END4sCgkJCQkJCSA8U1RNMzJGNDI5X1BCMTJfRlVOQ19PVEdfSFNf
VUxQSV9ENT4sCgkJCQkJCSA8U1RNMzJGNDI5X1BCMTNfRlVOQ19PVEdfSFNfVUxQSV9ENj4sCgkJ
CQkJCSA8U1RNMzJGNDI5X1BCNV9GVU5DX09UR19IU19VTFBJX0Q3PjsKCQkJCQliaWFzLWRpc2Fi
bGU7CgkJCQkJZHJpdmUtcHVzaC1wdWxsOwoJCQkJCXNsZXctcmF0ZSA9IDwyPjsKCQkJCX07CgkJ
CX07CgoJCQlldGhlcm5ldDBfbWlpOiBtaWlAMCB7CgkJCQlwaW5zIHsKCQkJCQlwaW5tdXggPSA8
U1RNMzJGNDI5X1BHMTNfRlVOQ19FVEhfTUlJX1RYRDBfRVRIX1JNSUlfVFhEMD4sCgkJCQkJCSA8
U1RNMzJGNDI5X1BHMTRfRlVOQ19FVEhfTUlJX1RYRDFfRVRIX1JNSUlfVFhEMT4sCgkJCQkJCSA8
U1RNMzJGNDI5X1BDMl9GVU5DX0VUSF9NSUlfVFhEMj4sCgkJCQkJCSA8U1RNMzJGNDI5X1BCOF9G
VU5DX0VUSF9NSUlfVFhEMz4sCgkJCQkJCSA8U1RNMzJGNDI5X1BDM19GVU5DX0VUSF9NSUlfVFhf
Q0xLPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEcxMV9GVU5DX0VUSF9NSUlfVFhfRU5fRVRIX1JNSUlf
VFhfRU4+LAoJCQkJCQkgPFNUTTMyRjQyOV9QQTJfRlVOQ19FVEhfTURJTz4sCgkJCQkJCSA8U1RN
MzJGNDI5X1BDMV9GVU5DX0VUSF9NREM+LAoJCQkJCQkgPFNUTTMyRjQyOV9QQTFfRlVOQ19FVEhf
TUlJX1JYX0NMS19FVEhfUk1JSV9SRUZfQ0xLPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEE3X0ZVTkNf
RVRIX01JSV9SWF9EVl9FVEhfUk1JSV9DUlNfRFY+LAoJCQkJCQkgPFNUTTMyRjQyOV9QQzRfRlVO
Q19FVEhfTUlJX1JYRDBfRVRIX1JNSUlfUlhEMD4sCgkJCQkJCSA8U1RNMzJGNDI5X1BDNV9GVU5D
X0VUSF9NSUlfUlhEMV9FVEhfUk1JSV9SWEQxPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEg2X0ZVTkNf
RVRIX01JSV9SWEQyPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEg3X0ZVTkNfRVRIX01JSV9SWEQzPjsK
CQkJCQlzbGV3LXJhdGUgPSA8Mj47CgkJCQl9OwoJCQl9OwoKCQkJc2Rpb19waW5zOiBzZGlvQDAg
ewoJCQkJcGlucyB7CgkJCQkJcGlubXV4ID0gPFNUTTMyRjQyOV9QQzhfRlVOQ19TRElPX0QwPiwK
CQkJCQkJIDxTVE0zMkY0MjlfUEM5X0ZVTkNfU0RJT19EMT4sCgkJCQkJCSA8U1RNMzJGNDI5X1BD
MTBfRlVOQ19TRElPX0QyPiwKCQkJCQkJIDxTVE0zMkY0MjlfUEMxMV9GVU5DX1NESU9fRDM+LAoJ
CQkJCQkgPFNUTTMyRjQyOV9QQzEyX0ZVTkNfU0RJT19DSz4sCgkJCQkJCSA8U1RNMzJGNDI5X1BE
Ml9GVU5DX1NESU9fQ01EPjsKCQkJCQliaWFzLWRpc2FibGU7CgkJCQkJZHJpdmUtcHVzaC1wdWxs
OwoJCQkJCXNsZXctcmF0ZSA9IDwyPjsKCQkJCX07CgkJCX07CgkJfTsKCgkJcmNjOiByY2NANDAw
MjM4MTAgewoJCQkjcmVzZXQtY2VsbHMgPSA8MT47CgkJCSNjbG9jay1jZWxscyA9IDwyPjsKCQkJ
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0Mnh4LXJjYyIsICJzdCxzdG0zMi1yY2MiOwoJCQlyZWcg
PSA8MHg0MDAyMzgwMCAweDQwMD47CgkJCWNsb2NrcyA9IDwmY2xrX2hzZT47CgkJfTsKCgkJZG1h
MTogZG1hLWNvbnRyb2xsZXJANDAwMjYwMDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWRt
YSI7CgkJCXJlZyA9IDwweDQwMDI2MDAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDwxMT4sCgkJ
CQkgICAgIDwxMj4sCgkJCQkgICAgIDwxMz4sCgkJCQkgICAgIDwxND4sCgkJCQkgICAgIDwxNT4s
CgkJCQkgICAgIDwxNj4sCgkJCQkgICAgIDwxNz4sCgkJCQkgICAgIDw0Nz47CgkJCWNsb2NrcyA9
IDwmcmNjIDAgMjE+OwoJCQkjZG1hLWNlbGxzID0gPDQ+OwoJCX07CgoJCWRtYTI6IGRtYS1jb250
cm9sbGVyQDQwMDI2NDAwIHsKCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1kbWEiOwoJCQlyZWcg
PSA8MHg0MDAyNjQwMCAweDQwMD47CgkJCWludGVycnVwdHMgPSA8NTY+LAoJCQkJICAgICA8NTc+
LAoJCQkJICAgICA8NTg+LAoJCQkJICAgICA8NTk+LAoJCQkJICAgICA8NjA+LAoJCQkJICAgICA8
Njg+LAoJCQkJICAgICA8Njk+LAoJCQkJICAgICA8NzA+OwoJCQljbG9ja3MgPSA8JnJjYyAwIDIy
PjsKCQkJI2RtYS1jZWxscyA9IDw0PjsKCQkJc3QsbWVtMm1lbTsKCQl9OwoKCQlldGhlcm5ldDA6
IGR3bWFjQDQwMDI4MDAwIHsKCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1kd21hYyIsICJzbnBz
LGR3bWFjLTMuNTBhIjsKCQkJcmVnID0gPDB4NDAwMjgwMDAgMHg4MDAwPjsKCQkJcmVnLW5hbWVz
ID0gInN0bW1hY2V0aCI7CgkJCWludGVycnVwdHMgPSA8NjE+LCA8NjI+OwoJCQlpbnRlcnJ1cHQt
bmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtlX2lycSI7CgkJCWNsb2NrLW5hbWVzID0gInN0bW1h
Y2V0aCIsICJ0eC1jbGsiLCAicngtY2xrIjsKCQkJY2xvY2tzID0gPCZyY2MgMCAyNT4sIDwmcmNj
IDAgMjY+LCA8JnJjYyAwIDI3PjsKCQkJc3Qsc3lzY29uID0gPCZzeXNjZmcgMHg0PjsKCQkJc25w
cyxwYmwgPSA8OD47CgkJCXNucHMsbWl4ZWQtYnVyc3Q7CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CgkJfTsKCgkJdXNib3RnX2hzOiB1c2JANDAwNDAwMDAgewoJCQljb21wYXRpYmxlID0gInNucHMs
ZHdjMiI7CgkJCXJlZyA9IDwweDQwMDQwMDAwIDB4NDAwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPDc3
PjsKCQkJY2xvY2tzID0gPCZyY2MgMCAyOT47CgkJCWNsb2NrLW5hbWVzID0gIm90ZyI7CgkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CgkJfTsKCgkJdXNib3RnX2ZzOiB1c2JANTAwMDAwMDAgewoJCQlj
b21wYXRpYmxlID0gInN0LHN0bTMyLWZzb3RnIiwgInNucHMsZHdjMiI7CgkJCXJlZyA9IDwweDUw
MDAwMDAwIDB4NDAwMDA+OwoJCQlpbnRlcnJ1cHRzID0gPDY3PjsKCQkJY2xvY2tzID0gPCZyY2Mg
MCAzOT47CgkJCWNsb2NrLW5hbWVzID0gIm90ZyI7CgkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CgkJ
fTsKCgkJcm5nOiBybmdANTAwNjA4MDAgewoJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXJuZyI7
CgkJCXJlZyA9IDwweDUwMDYwODAwIDB4NDAwPjsKCQkJaW50ZXJydXB0cyA9IDw4MD47CgkJCWNs
b2NrcyA9IDwmcmNjIDAgMzg+OwoJCX07Cgl9Owp9OwoKJnN5c3RpY2sgewoJY2xvY2tzID0gPCZy
Y2MgMSAwPjsKCXN0YXR1cyA9ICJva2F5IjsKfTsK
--94eb2c193b6e8a15b605402be240--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
