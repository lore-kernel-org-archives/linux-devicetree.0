From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Tue, 9 Feb 2016 20:10:45 +0100
Message-ID: <CAEKpxBncN5-WYTNTw+8jfZypiMNfJt=55qEx2zTPfvZmjr9XdQ@mail.gmail.com>
References: <1455010156-27754-1-git-send-email-codekipper@gmail.com>
	<20160209183420.GW31506@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11c25f8215caff052b5b130c
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBNXT5C2QKGQE6Z2EQAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160209183420.GW31506@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a11c25f8215caff052b5b130c
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 19:34, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
wrote:
> Hi,
>
> On Tue, Feb 09, 2016 at 10:29:16AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Enable the otg/drc usb controller on the Itead Ibox device.
>>
>> Note this board has the otg-vbus connected directly to the 5v-dcc of
>> the board, so there is no vbus0 regulator, nor vbus0-det.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Changes since v1:
>> - Added comment concerning vbus0 regulator and detection to commit
message
>>
>> ---
>>  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     | 14 ++++++++++++++
>>  arch/arm/boot/dts/sunxi-itead-core-common.dtsi |  9 +++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> index 661c21d..a512581 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>> @@ -118,8 +118,22 @@
>>               allwinner,drive = <SUN4I_PINCTRL_20_MA>;
>>               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>>       };
>> +
>> +     usb0_id_detect_pin: usb0_id_detect_pin@0 {
>> +             allwinner,pins = "PH4";
>> +             allwinner,function = "gpio_in";
>> +             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +     };
>>  };
>>
>>  &reg_ahci_5v {
>>       status = "okay";
>>  };
>> +
>> +&usbphy {
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&usb0_id_detect_pin>;
>> +     usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>> +     status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> index 2565d51..d22eea3 100644
>> --- a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> +++ b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>> @@ -88,6 +88,10 @@
>>       status = "okay";
>>  };
>>
>> +&otg_sram {
>> +     status = "okay";
>> +};
>> +
>>  #include "axp209.dtsi"
>>
>>  &reg_dcdc2 {
>> @@ -129,6 +133,11 @@
>>       status = "okay";
>>  };
>>
>> +&usb_otg {
>> +     dr_mode = "otg";
>
> If VBUS is tied to 5V, without anyway to disable it, then it cannot do
> OTG.
>
> The mode it can do is host.
This is the same patch as what was applied to cubieboard2
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts?id=b8962f7ee700580a148e05eceb2302bcfc59ffbc
which it looks like this hardware copies. I can power the Ibox using this
USB socket and when I plug in a usb2ethernet device then it is detected.
BR,
CK
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11c25f8215caff052b5b130c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><br><br>On 9 February 2016 at 19:34, Maxime Ripa=
rd &lt;<a href=3D"mailto:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org">maxime.ripard@fr=
ee-electrons.com</a>&gt; wrote:<br>&gt; Hi,<br>&gt;<br>&gt; On Tue, Feb 09,=
 2016 at 10:29:16AM +0100, <a href=3D"mailto:codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">codekipp=
er-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a> wrote:<br>&gt;&gt; From: Marcus Cooper &lt;<a href=3D"mail=
to:codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>&gt;&gt;<br>&gt;&g=
t; Enable the otg/drc usb controller on the Itead Ibox device.<br>&gt;&gt;<=
br>&gt;&gt; Note this board has the otg-vbus connected directly to the 5v-d=
cc of<br>&gt;&gt; the board, so there is no vbus0 regulator, nor vbus0-det.=
<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Marcus Cooper &lt;<a href=3D"mailto=
:codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>&gt;&gt; ---<br>&gt;=
&gt; Changes since v1:<br>&gt;&gt; - Added comment concerning vbus0 regulat=
or and detection to commit message<br>&gt;&gt;<br>&gt;&gt; ---<br>&gt;&gt; =
=C2=A0arch/arm/boot/dts/sun7i-a20-itead-ibox.dts =C2=A0 =C2=A0 | 14 +++++++=
+++++++<br>&gt;&gt; =C2=A0arch/arm/boot/dts/sunxi-itead-core-common.dtsi | =
=C2=A09 +++++++++<br>&gt;&gt; =C2=A02 files changed, 23 insertions(+)<br>&g=
t;&gt;<br>&gt;&gt; diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts =
b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts<br>&gt;&gt; index 661c21d..a51=
2581 100644<br>&gt;&gt; --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts<br=
>&gt;&gt; +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts<br>&gt;&gt; @@ -=
118,8 +118,22 @@<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 allwinner,drive =3D &lt;SUN4I_PINCTRL_20_MA&gt;;<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,pull =3D &lt;SUN4I_PINCTRL=
_NO_PULL&gt;;<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 };<br>&gt;&gt; +<br>&gt;&gt;=
 + =C2=A0 =C2=A0 usb0_id_detect_pin: usb0_id_detect_pin@0 {<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,pins =3D &quot;PH4&quot=
;;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,functi=
on =3D &quot;gpio_in&quot;;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 allwinner,drive =3D &lt;SUN4I_PINCTRL_10_MA&gt;;<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner,pull =3D &lt;SUN4I_PINC=
TRL_NO_PULL&gt;;<br>&gt;&gt; + =C2=A0 =C2=A0 };<br>&gt;&gt; =C2=A0};<br>&gt=
;&gt;<br>&gt;&gt; =C2=A0&amp;reg_ahci_5v {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 status =3D &quot;okay&quot;;<br>&gt;&gt; =C2=A0};<br>&gt;&gt; +<br>&gt;&gt=
; +&amp;usbphy {<br>&gt;&gt; + =C2=A0 =C2=A0 pinctrl-names =3D &quot;defaul=
t&quot;;<br>&gt;&gt; + =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;usb0_id_detect_=
pin&gt;;<br>&gt;&gt; + =C2=A0 =C2=A0 usb0_id_det-gpio =3D &lt;&amp;pio 7 4 =
GPIO_ACTIVE_HIGH&gt;; /* PH4 */<br>&gt;&gt; + =C2=A0 =C2=A0 status =3D &quo=
t;okay&quot;;<br>&gt;&gt; +};<br>&gt;&gt; diff --git a/arch/arm/boot/dts/su=
nxi-itead-core-common.dtsi b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi=
<br>&gt;&gt; index 2565d51..d22eea3 100644<br>&gt;&gt; --- a/arch/arm/boot/=
dts/sunxi-itead-core-common.dtsi<br>&gt;&gt; +++ b/arch/arm/boot/dts/sunxi-=
itead-core-common.dtsi<br>&gt;&gt; @@ -88,6 +88,10 @@<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>&gt;&gt; =C2=A0};<br>&gt;&gt;=
<br>&gt;&gt; +&amp;otg_sram {<br>&gt;&gt; + =C2=A0 =C2=A0 status =3D &quot;=
okay&quot;;<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; =C2=A0#include &quot;=
axp209.dtsi&quot;<br>&gt;&gt;<br>&gt;&gt; =C2=A0&amp;reg_dcdc2 {<br>&gt;&gt=
; @@ -129,6 +133,11 @@<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 status =3D &quot;ok=
ay&quot;;<br>&gt;&gt; =C2=A0};<br>&gt;&gt;<br>&gt;&gt; +&amp;usb_otg {<br>&=
gt;&gt; + =C2=A0 =C2=A0 dr_mode =3D &quot;otg&quot;;<br>&gt;<br>&gt; If VBU=
S is tied to 5V, without anyway to disable it, then it cannot do<br>&gt; OT=
G.<br>&gt;<br>&gt; The mode it can do is host.<br>This is the same patch as=
 what was applied to cubieboard2 <a href=3D"https://git.kernel.org/cgit/lin=
ux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/sun7i-a20-cubieb=
oard2.dts?id=3Db8962f7ee700580a148e05eceb2302bcfc59ffbc">https://git.kernel=
.org/cgit/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/sun=
7i-a20-cubieboard2.dts?id=3Db8962f7ee700580a148e05eceb2302bcfc59ffbc</a> wh=
ich it looks like this hardware copies. I can power the Ibox using this USB=
 socket and when I plug in a usb2ethernet device then it is detected. <br><=
/div>BR,<br></div>CK<br><div><div>&gt;<br>&gt; Maxime<br>&gt;<br>&gt; --<br=
>&gt; Maxime Ripard, Free Electrons<br>&gt; Embedded Linux, Kernel and Andr=
oid engineering<br>&gt; <a href=3D"http://free-electrons.com">http://free-e=
lectrons.com</a><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11c25f8215caff052b5b130c--
