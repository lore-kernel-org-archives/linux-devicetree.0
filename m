From: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PATH[1/3] ARM: axp20x_usb_power.c add device tree
 configuration options for REG 30H: VBUS-IPSOUT
Date: Tue, 17 May 2016 10:50:42 -0700 (PDT)
Message-ID: <35a39bdc-1304-403d-b56a-a45bb8debf5e@googlegroups.com>
References: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
 <671c7471-b63a-40cc-989f-6b20f00571ee@googlegroups.com>
Reply-To: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_725_950679940.1463507442454"
Return-path: <linux-sunxi+bncBDC4H35J54ORB4VT5W4QKGQEZM5YGLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <671c7471-b63a-40cc-989f-6b20f00571ee-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_725_950679940.1463507442454
Content-Type: multipart/alternative;
	boundary="----=_Part_726_2042748720.1463507442454"

------=_Part_726_2042748720.1463507442454
Content-Type: text/plain; charset=UTF-8

the documentation is updated to describe how to convert actual values to 
the provided parameters

---
diff -uprN -X linux-sunxi-original/Documentation/dontdiff 
linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
--- 
linux-sunxi-original/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
       2016-05-09 16:48:46.000000000 +0200
+++ 
linux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt 
   2016-05-11 13:05:58.995873267 +0200
@@ -5,6 +5,26 @@ Required Properties:
 This node is a subnode of the axp20x PMIC.
+The following 3 parameters are configurable from the device-tree:
+          - vhold-enable
+                      - bit 6 of register REG 30H: VBUS-IPSOUT Power Path 
Management
+                      - available values are:
+                                  - 0x00 : VBUS VHOLD voltage limiting 
control disabled
+                                  - 0x01 : VBUS VHOLD voltage limiting 
control enabled
+          - vhold-set
+                      - bits <5-3> of register REG 30H: VBUS-IPSOUT Power 
Path Management
+                      - available values are from 0x00 to 0x07
+                      - VHOLD = [4000000 + ( vhold-set & 0x07 ) * 100000] 
in uV
+
+          - ibus-limit
+                      - bits <1-0> of register REG 30H: VBUS-IPSOUT Power 
Path Management
+                      - available values are :
+                                  - 0x00 : 900000uA
+                                  - 0x01 : 500000uA
+                                  - 0x02 : 100000uA
+                                  - 0x03 : unlimited
+
+
Example:
 axp209: pmic@34 {
@@ -30,5 +50,8 @@ axp209: pmic@34 {
            usb-power-supply: usb-power-supply {
                       compatible = "x-powers,axp202-usb-power-supply";
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

------=_Part_726_2042748720.1463507442454
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">the documentation is updated to describe how to convert ac=
tual values to the provided parameters<div><br></div><div>---</div><div><di=
v>diff -uprN -X linux-sunxi-original/Documentation/dontdiff linux-sunxi-ori=
ginal/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt l=
inux-sunxi/Documentation/devicetree/bindings/power_supply/axp20x_usb_power.=
txt</div><div>--- linux-sunxi-original/Documentation/devicetree/bindings/po=
wer_supply/axp20x_usb_power.txt =C2=A0 =C2=A0 =C2=A0 =C2=A02016-05-09 16:48=
:46.000000000 +0200</div><div>+++ linux-sunxi/Documentation/devicetree/bind=
ings/power_supply/axp20x_usb_power.txt =C2=A0 =C2=A02016-05-11 13:05:58.995=
873267 +0200</div><div>@@ -5,6 +5,26 @@ Required Properties:</div><div>=C2=
=A0This node is a subnode of the axp20x PMIC.</div><div>+The following 3 pa=
rameters are configurable from the device-tree:</div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0- vhold-enable</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- bit 6 of register REG 30H=
: VBUS-IPSOUT Power Path Management</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- available values are:</d=
iv><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 0x00 : VBUS VHOLD =
voltage limiting control disabled</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- 0x01 : VBUS VHOLD voltage limiting control enabled</div>=
<div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- vhold-set</div><div>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- bits &l=
t;5-3&gt; of register REG 30H: VBUS-IPSOUT Power Path Management</div><div>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- available values are from 0x00 to 0x07</div><div>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- VHOLD =3D [400=
0000 + ( vhold-set &amp; 0x07 ) * 100000] in uV</div><div>+</div><div>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- ibus-limit</div><div>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- bits &lt;1-0&g=
t; of register REG 30H: VBUS-IPSOUT Power Path Management</div><div>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =
available values are :</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 0x00 : 900000uA</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 0x01 : 500000uA</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 0x02 : 100000uA</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 0x03 : unlimited</div><div>+</div><div>+</div><div>Example:</div><d=
iv>=C2=A0axp209: pmic@34 {</div><div>@@ -30,5 +50,8 @@ axp209: pmic@34 {</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb-power-supply: usb-pow=
er-supply {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;x-powers,axp202-usb-pow=
er-supply&quot;;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vhold-enable =3D &lt;0x01&gt;;</div><div>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0vhold-set =3D &lt;0x04&gt;;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus-limit =3D &lt;0x01&gt;;</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};</div><div>};</div></di=
v><div>---</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_726_2042748720.1463507442454--

------=_Part_725_950679940.1463507442454--
