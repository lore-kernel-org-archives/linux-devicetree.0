From: Troy Dack <troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i-h3-orangepi-plus: Enable
 USB host controllers
Date: Mon, 23 Nov 2015 14:20:10 -0800 (PST)
Message-ID: <fff9e78a-e23e-4226-9cec-67550bf09efb@googlegroups.com>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
 <1447616777-24660-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ@mail.gmail.com>
 <56498FA8.3050908@redhat.com>
 <564B51D7.7090500@gmail.com>
Reply-To: troy-yfroEPzt3eC6c6uEtOJ/EA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_6910_766272508.1448317210926"
Return-path: <linux-sunxi+bncBDCKB7GE2ABBBG5CZ2ZAKGQEVL6BK7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <564B51D7.7090500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_6910_766272508.1448317210926
Content-Type: multipart/alternative;
	boundary="----=_Part_6911_518773576.1448317210927"

------=_Part_6911_518773576.1448317210927
Content-Type: text/plain; charset=UTF-8



On Wednesday, 18 November 2015 03:12:11 UTC+11, Jens Kuske wrote:
>
> Enable the 2 USB host controllers used on the Orange Pi Plus 
> and add the necessary regulators. 
>
> Signed-off-by: Reinder de Haan <patch...-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org <javascript:>> 
> Signed-off-by: Hans de Goede <hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org <javascript:>> 
> Signed-off-by: Jens Kuske <jens...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <javascript:>> 
> --- 
>
> Hi Hans, 
>
> with these regulators USB works on the Orange Pi Plus too. 
> I don't know if adding the regulators in the dts is okay, since most 
> regulators are defined in the sunxi-common-regulators.dtsi, but 
> we use different pins. 
>
> Jens 
>
>
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 44 
> ++++++++++++++++++++++++++++ 
>  1 file changed, 44 insertions(+) 
>
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts 
> b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts 
> index e67df59..1cb6c66 100644 
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts 
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts 
> @@ -58,6 +58,35 @@ 
>          chosen { 
>                  stdout-path = "serial0:115200n8"; 
>          }; 
> + 
> +        reg_usb3_vbus: usb3-vbus { 
> +                compatible = "regulator-fixed"; 
> +                pinctrl-names = "default"; 
> +                pinctrl-0 = <&usb3_vbus_pin_a>; 
> +                regulator-name = "usb3-vbus"; 
> +                regulator-min-microvolt = <5000000>; 
> +                regulator-max-microvolt = <5000000>; 
> +                regulator-boot-on; 
> +                enable-active-high; 
> +                gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>; 
> +        }; 
> +}; 
> + 
> +&ehci1 { 
> +        status = "okay"; 
> +}; 
> + 
> +&ehci3 { 
> +        status = "okay"; 
> +}; 
> + 
> +&pio { 
> +        usb3_vbus_pin_a: usb3_vbus_pin@0 { 
> +                allwinner,pins = "PG11"; 
> +                allwinner,function = "gpio_out"; 
> +                allwinner,drive = <SUN4I_PINCTRL_10_MA>; 
> +                allwinner,pull = <SUN4I_PINCTRL_NO_PULL>; 
> +        }; 
>  }; 
>   
>  &mmc0 { 
> @@ -70,8 +99,23 @@ 
>          status = "okay"; 
>  }; 
>   
> +&reg_usb1_vbus { 
> +        gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>; 
> +        status = "okay"; 
> +}; 
> + 
>  &uart0 { 
>          pinctrl-names = "default"; 
>          pinctrl-0 = <&uart0_pins_a>; 
>          status = "okay"; 
>  }; 
> + 
> +&usb1_vbus_pin_a { 
> +        allwinner,pins = "PG13"; 
> +}; 
> + 
> +&usbphy { 
> +        usb1_vbus-supply = <&reg_usb1_vbus>; 
> +        usb3_vbus-supply = <&reg_usb3_vbus>; 
> +        status = "okay"; 
> +}; 
>

I've been trying to test these patches by using Hans' github sunxi-wip 
branches of the kernel and U-Boot.

U-Boot at commit 7e17fd2 "suxni: Add support for Orangepi Plus and Orangepi 
PC boards"
Kernel at commit cb45b8  "ARM: dts: sun8i-h3-orangepi-plus: Enable USB host 
controllers"

Both have been built using the default defconfig for an OrangePi Plus

U-Boot starts and successfully boots the kernel, but the kernel does not 
appear to boot fully and hangs at:

[    0.861175] cpu cpu0: failed to get cpu0 clock: -2
[    0.865973] cpufreq-dt: probe of cpufreq-dt failed with error -2
[    0.872017] Registering SWP/SWPB emulation handler

Full boot log: http://pastebin.com/VGkEix9p

Building the kernel (or just using a dab) with the dts from commit 0a8c01 
"ARM: dts: sun8i: Add Orange Pi Plus support" results in the kernel booting 
fully to a login prompt.  Of course without enabled/working USB.

There is a fair chance I've done something wrong that is causing this.  Any 
advice on how to get a bootable kernel?

Thanks,
   Troy

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_6911_518773576.1448317210927
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, 18 November 2015 03:12:11 UTC+11, Jens Kuske  wrote:<=
blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bord=
er-left: 1px #ccc solid;padding-left: 1ex;">Enable the 2 USB host controlle=
rs used on the Orange Pi Plus
<br>and add the necessary regulators.
<br>
<br>Signed-off-by: Reinder de Haan &lt;<a href=3D"javascript:" target=3D"_b=
lank" gdf-obfuscated-mailto=3D"Zbc5Yp_LBgAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">patch...-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org</a>&gt;
<br>Signed-off-by: Hans de Goede &lt;<a href=3D"javascript:" target=3D"_bla=
nk" gdf-obfuscated-mailto=3D"Zbc5Yp_LBgAJ" rel=3D"nofollow" onmousedown=3D"=
this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39=
;javascript:&#39;;return true;">hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;
<br>Signed-off-by: Jens Kuske &lt;<a href=3D"javascript:" target=3D"_blank"=
 gdf-obfuscated-mailto=3D"Zbc5Yp_LBgAJ" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;ja=
vascript:&#39;;return true;">jens...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;
<br>---
<br>
<br>Hi Hans,
<br>
<br>with these regulators USB works on the Orange Pi Plus too.
<br>I don&#39;t know if adding the regulators in the dts is okay, since mos=
t
<br>regulators are defined in the sunxi-common-regulators.dtsi, but
<br>we use different pins.
<br>
<br>Jens
<br>
<br>
<br>=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts | 44 ++++++++++=
++++++++++++++++++
<br>=C2=A01 file changed, 44 insertions(+)
<br>
<br>diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts b/arch/a=
rm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts
<br>index e67df59..1cb6c66 100644
<br>--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts
<br>+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts
<br>@@ -58,6 +58,35 @@
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0chosen {
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0stdout-path =3D &quot;serial0:115200n8&quo=
t;;
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
<br>+
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg_usb3_vbus: usb3-vb=
us {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D &quot;regulator-fixed&quot;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D &quot;default&quot;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D &lt;&amp;usb3_vbus_pin_a&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-<wbr>name =3D &quot;usb3-vbus&quot;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-<wbr>min-microvolt =3D &lt;5000000&gt;=
;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-<wbr>max-microvolt =3D &lt;5000000&gt;=
;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0regulator-<wbr>boot-on;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0enable-<wbr>active-high;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio =3D &lt;&amp;pio 6 11 GPIO_ACTIVE_HIGH&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
<br>+};
<br>+
<br>+&amp;ehci1 {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;okay&=
quot;;
<br>+};
<br>+
<br>+&amp;ehci3 {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;okay&=
quot;;
<br>+};
<br>+
<br>+&amp;pio {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb3_vbus_pin_a: usb3_=
vbus_pin@0 {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0allwinner,<wbr>pins =3D &quot;PG11&quot;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0allwinner,<wbr>function =3D &quot;gpio_out&quot;=
;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0allwinner,<wbr>drive =3D &lt;SUN4I_PINCTRL_10_MA=
&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0allwinner,<wbr>pull =3D &lt;SUN4I_PINCTRL_NO_PUL=
L&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
<br>=C2=A0};
<br>=C2=A0
<br>=C2=A0&amp;mmc0 {
<br>@@ -70,8 +99,23 @@
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;=
okay&quot;;
<br>=C2=A0};
<br>=C2=A0
<br>+&amp;reg_usb1_vbus {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio =3D &lt;&amp;pio =
6 13 GPIO_ACTIVE_HIGH&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;okay&=
quot;;
<br>+};
<br>+
<br>=C2=A0&amp;uart0 {
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D=
 &quot;default&quot;;
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D &lt=
;&amp;uart0_pins_a&gt;;
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;=
okay&quot;;
<br>=C2=A0};
<br>+
<br>+&amp;usb1_vbus_pin_a {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0allwinner,pins =3D &qu=
ot;PG13&quot;;
<br>+};
<br>+
<br>+&amp;usbphy {
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb1_vbus-supply =3D &=
lt;&amp;reg_usb1_vbus&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb3_vbus-supply =3D &=
lt;&amp;reg_usb3_vbus&gt;;
<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D &quot;okay&=
quot;;
<br>+};
<br></blockquote><div><br></div><div>I&#39;ve been trying to test these pat=
ches by using Hans&#39; github sunxi-wip branches of the kernel and U-Boot.=
</div><div><br></div><div>U-Boot at commit=C2=A07e17fd2 &quot;suxni: Add su=
pport for Orangepi Plus and Orangepi PC boards&quot;</div><div>Kernel at co=
mmit=C2=A0cb45b8 =C2=A0&quot;ARM: dts: sun8i-h3-orangepi-plus: Enable USB h=
ost controllers&quot;</div><div><br></div><div>Both have been built using t=
he default defconfig for an OrangePi Plus</div><div><br></div><div>U-Boot s=
tarts and successfully boots the kernel, but the kernel does not appear to =
boot fully and hangs at:</div><div><br></div><div><div>[ =C2=A0 =C2=A00.861=
175] cpu cpu0: failed to get cpu0 clock: -2</div><div>[ =C2=A0 =C2=A00.8659=
73] cpufreq-dt: probe of cpufreq-dt failed with error -2</div><div>[ =C2=A0=
 =C2=A00.872017] Registering SWP/SWPB emulation handler</div></div><div><br=
></div><div>Full boot log:=C2=A0http://pastebin.com/VGkEix9p</div><div><br>=
</div><div>Building the kernel (or just using a dab) with the dts from comm=
it=C2=A00a8c01 &quot;ARM: dts: sun8i: Add Orange Pi Plus support&quot; resu=
lts in the kernel booting fully to a login prompt. =C2=A0Of course without =
enabled/working USB.</div><div><br></div><div>There is a fair chance I&#39;=
ve done something wrong that is causing this. =C2=A0Any advice on how to ge=
t a bootable kernel?</div><div><br></div><div>Thanks,</div><div>=C2=A0 =C2=
=A0Troy</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_6911_518773576.1448317210927--

------=_Part_6910_766272508.1448317210926--
