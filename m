Return-Path: <SRS0=jJAd=ZX=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170208233023.31922-2-zajec5@gmail.com>
References: <20170208233023.31922-1-zajec5@gmail.com> <20170208233023.31922-2-zajec5@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Thu, 9 Feb 2017 19:27:30 -0500
Message-ID: <CAC3K-4rmqvJR9xETQG9ibTLUr9uaDEVOaHfSSuZU3K8zy0BWKw@mail.gmail.com>
Subject: Re: [PATCH for-4.11 2/2] Revert "dt-bindings: phy: Add documentation
 for NSP USB3 PHY"
Content-Type: multipart/alternative; boundary=001a114f3274cc46210548222979
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <devicetree@vger.kernel.org>

--001a114f3274cc46210548222979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2017 at 6:30 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This reverts commit c8ca631f9480 ("dt-bindings: phy: Add documentation
> for NSP USB3 PHY") to match reverting commit adding the new PHY driver.
> Please note we revert this commit before it reached stable release.
>
> If new compatible string is needed it should be added to the existing
> bcm-ns-usb3-phy.txt which already describes this PHY.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>

Per the discussion with Rafal, this is acceptable

Acked-by: Jon Mason <jon.mason@broadcom.com>


> ---
>  .../devicetree/bindings/phy/brcm,nsp-usb3-phy.txt  | 39
> ----------------------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/brcm,nsp-usb3-
> phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt
> b/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt
> deleted file mode 100644
> index e68ae5dec9c9..000000000000
> --- a/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Broadcom USB3 phy binding for northstar plus SoC
> -The USB3 phy is internal to the SoC and is accessed using mdio interface=
.
> -
> -Required mdio bus properties:
> -- reg: Should be 0x0 for SoC internal USB3 phy
> -- #address-cells: must be 1
> -- #size-cells: must be 0
> -
> -Required USB3 PHY properties:
> -- compatible: should be "brcm,nsp-usb3-phy"
> -- reg: USB3 Phy address on SoC internal MDIO bus and it should be 0x10.
> -- usb3-ctrl-syscon: handler of syscon node defining physical address
> -  of usb3 control register.
> -- #phy-cells: must be 0
> -
> -Required usb3 control properties:
> -- compatible: should be "brcm,nsp-usb3-ctrl"
> -- reg: offset and length of the control registers
> -
> -Example:
> -
> -       mdio@0 {
> -               reg =3D <0x0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               usb3_phy: usb-phy@10 {
> -                       compatible =3D "brcm,nsp-usb3-phy";
> -                       reg =3D <0x10>;
> -                       usb3-ctrl-syscon =3D <&usb3_ctrl>;
> -                       #phy-cells =3D <0>;
> -                       status =3D "disabled";
> -               };
> -       };
> -
> -       usb3_ctrl: syscon@104408 {
> -               compatible =3D "brcm,nsp-usb3-ctrl", "syscon";
> -               reg =3D <0x104408 0x3fc>;
> -       };
> --
> 2.11.0
>
>

--001a114f3274cc46210548222979
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 8, 2017 at 6:30 PM, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"lt=
r">&lt;<a href=3D"mailto:zajec5@gmail.com" target=3D"_blank">zajec5@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:rafal@milecki.pl">ra=
fal@milecki.pl</a>&gt;<br>
<br>
This reverts commit c8ca631f9480 (&quot;dt-bindings: phy: Add documentation=
<br>
for NSP USB3 PHY&quot;) to match reverting commit adding the new PHY driver=
.<br>
Please note we revert this commit before it reached stable release.<br>
<br>
If new compatible string is needed it should be added to the existing<br>
bcm-ns-usb3-phy.txt which already describes this PHY.<br>
<br>
Signed-off-by: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:rafal@milecki.=
pl">rafal@milecki.pl</a>&gt;<br></blockquote><div><br></div><div>Per the di=
scussion with Rafal, this is acceptable</div><div><br></div><div>Acked-by: =
Jon Mason &lt;<a href=3D"mailto:jon.mason@broadcom.com">jon.mason@broadcom.=
com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0.../devicetree/bindings/phy/<wbr>brcm,nsp-usb3-phy.txt=C2=A0 | 39 ---=
-------------------<br>
=C2=A01 file changed, 39 deletions(-)<br>
=C2=A0delete mode 100644 Documentation/devicetree/<wbr>bindings/phy/brcm,ns=
p-usb3-<wbr>phy.txt<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/phy/brcm,nsp-usb3-<wbr>=
phy.txt b/Documentation/devicetree/<wbr>bindings/phy/brcm,nsp-usb3-<wbr>phy=
.txt<br>
deleted file mode 100644<br>
index e68ae5dec9c9..000000000000<br>
--- a/Documentation/devicetree/<wbr>bindings/phy/brcm,nsp-usb3-<wbr>phy.txt=
<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-Broadcom USB3 phy binding for northstar plus SoC<br>
-The USB3 phy is internal to the SoC and is accessed using mdio interface.<=
br>
-<br>
-Required mdio bus properties:<br>
-- reg: Should be 0x0 for SoC internal USB3 phy<br>
-- #address-cells: must be 1<br>
-- #size-cells: must be 0<br>
-<br>
-Required USB3 PHY properties:<br>
-- compatible: should be &quot;brcm,nsp-usb3-phy&quot;<br>
-- reg: USB3 Phy address on SoC internal MDIO bus and it should be 0x10.<br=
>
-- usb3-ctrl-syscon: handler of syscon node defining physical address<br>
-=C2=A0 of usb3 control register.<br>
-- #phy-cells: must be 0<br>
-<br>
-Required usb3 control properties:<br>
-- compatible: should be &quot;brcm,nsp-usb3-ctrl&quot;<br>
-- reg: offset and length of the control registers<br>
-<br>
-Example:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mdio@0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0&gt;=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;0&gt;;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb3_phy: usb-phy@1=
0 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;brcm,nsp-usb3-phy&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x10&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0usb3-ctrl-syscon =3D &lt;&amp;usb3_ctrl&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#phy-cells =3D &lt;0&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0usb3_ctrl: syscon@104408 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;brcm,nsp-usb3-ctrl&quot;, &quot;syscon&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x10440=
8 0x3fc&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a114f3274cc46210548222979--
