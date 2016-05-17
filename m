From: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: PATH[1/3] ARM: axp20x_usb_power.c add device tree
 configuration options for REG 30H: VBUS-IPSOUT
Date: Tue, 17 May 2016 10:41:41 -0700 (PDT)
Message-ID: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
Reply-To: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_783_874223710.1463506901180"
Return-path: <linux-sunxi+bncBDC4H35J54ORBVNP5W4QKGQEALNOHGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_783_874223710.1463506901180
Content-Type: multipart/alternative;
	boundary="----=_Part_784_1162355918.1463506901180"

------=_Part_784_1162355918.1463506901180
Content-Type: text/plain; charset=UTF-8

The AXP20X chips have a configuration register "REG 30H: VBUS-IPSOUT Power 
Path Management" that provide USB power supply protection.
The current axp20x_usb_power.c provides support only for reading those 
values.

>From the datasheet:
In order not to affect the USB communication, VBUS is always working under 
Voltage-Limit mode by default. In this mode, AXP209 ensures that VBUS 
voltage remains above a configurable reference voltage VHOLD which can meet 
the USB specification. The default VHOLD is 4.4V, adjustable in Reg30H 
[5:3] register. If the system has limit on current obtained from USB VBUS, 
a current-limit mode is provided (See REG30H[1] register), with 
900mA/500mA/100mA (Reg30H [0]) selectable.

The following entries are added in the axp209.dtsi 
file: vhold-enable, vhold-set and ibus-limit
The chosen default values are the AXP20X reset values, as described in the 
data sheet.

Signed-off-by: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


---
diff -uprN -X linux-sunxi-original/Documentation/dontdiff 
linux-sunxi-original/arch/arm/boot/dts/axp209.dtsi 
linux-sunxi/arch/arm/boot/dts/axp209.dtsi
--- linux-sunxi-original/arch/arm/boot/dts/axp209.dtsi         2016-05-11 
09:21:47.470923679 +0200
+++ linux-sunxi/arch/arm/boot/dts/axp209.dtsi     2016-05-10 
18:45:32.795158651 +0200
@@ -98,5 +98,8 @@
           usb_power_supply: usb_power_supply {
                       compatible = "x-powers,axp202-usb-power-supply";
                       status = "disabled";
+                      vhold-enable = <0x01>;
+                      vhold-set = <0x04>;
+                      ibus-limit = <0x01>;
           };
};
---

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_784_1162355918.1463506901180
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The AXP20X chips have a configuration register &quot;REG 3=
0H: VBUS-IPSOUT Power Path Management&quot; that provide USB power supply p=
rotection.<div>The current axp20x_usb_power.c provides support only for rea=
ding those values.</div><div><br></div><div>From the datasheet:</div><div>I=
n order not to affect the USB communication, VBUS is always working under V=
oltage-Limit mode by
default. In this mode, AXP209 ensures that VBUS voltage remains above a con=
figurable reference
voltage VHOLD which can meet the USB specification. The default VHOLD is 4.=
4V, adjustable in
Reg30H [5:3] register.
If the system has limit on current obtained from USB VBUS, a current-limit =
mode is provided (See
REG30H[1] register), with 900mA/500mA/100mA (Reg30H [0]) selectable.<br></d=
iv><div><br></div><div>The following entries are added in the axp209.dtsi f=
ile:=C2=A0vhold-enable,=C2=A0vhold-set and ibus-limit</div><div>The chosen =
default values are the AXP20X reset values, as described in the data sheet.=
</div><div><br></div><div>Signed-off-by: Ene Alexandru &lt;ene.alexandru@gm=
ail.com&gt;<br></div><div><br></div><div><br></div><div>---</div><div><div>=
diff -uprN -X linux-sunxi-original/Documentation/dontdiff linux-sunxi-origi=
nal/arch/arm/boot/dts/axp209.dtsi linux-sunxi/arch/arm/boot/dts/axp209.dtsi=
</div><div>--- linux-sunxi-original/arch/arm/boot/dts/axp209.dtsi =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2016-05-11 09:21:47.470923679 +0200</div><div>+++ linu=
x-sunxi/arch/arm/boot/dts/axp209.dtsi =C2=A0 =C2=A0 2016-05-10 18:45:32.795=
158651 +0200</div><div>@@ -98,5 +98,8 @@</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0usb_power_supply: usb_power_supply {</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
mpatible =3D &quot;x-powers,axp202-usb-power-supply&quot;;</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0status =3D &quot;disabled&quot;;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vhold-enable =3D &lt;0x01&=
gt;;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0vhold-set =3D &lt;0x04&gt;;</div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus-limit =
=3D &lt;0x01&gt;;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};</di=
v><div>};</div><div>---</div></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_784_1162355918.1463506901180--

------=_Part_783_874223710.1463506901180--
