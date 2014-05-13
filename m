From: "'Kodiak Furr' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v6 3/3] ARM: sunxi: Add IR controller
 support in DT on A20
Date: Tue, 13 May 2014 13:56:57 -0500
Message-ID: <EDBEEFE3-4E6B-4555-916B-0792CC9E70E5@aol.com>
References: <1400006342-2968-4-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="53726af9_46e87ccd_25e"
Return-path: <linux-sunxi+bncBDHJTVHEWICRBXG5ZGNQKGQEMYZ7SHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1400006342-2968-4-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--53726af9_46e87ccd_25e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I've added this to my to-do list.najsjs On May 13, 2014 at 1:39:02 PM CDT, =
Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org> wrote:This patch adds IR controller i=
n A20 Device-Tree:- Two IR devices found in A20 user manual- Pins for two d=
evices- One IR device physically found on Cubieboard 2- One IR device physi=
cally found on CubietruckSigned-off-by: Alexander Bersenev Signed-off-by: A=
lexsey Shestacov --- arch/arm/boot/dts/sun7i-a20-cubieboard2.dts | 6 ++++++=
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 6 ++++++ arch/arm/boot/dts/su=
n7i-a20.dtsi | 31 +++++++++++++++++++++++++++++ 3 files changed, 43 inserti=
ons(+)diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/b=
oot/dts/sun7i-a20-cubieboard2.dtsindex feeff64..2564e8c 100644--- a/arch/ar=
m/boot/dts/sun7i-a20-cubieboard2.dts+++ b/arch/arm/boot/dts/sun7i-a20-cubie=
board2.dts@@ -164,6 +164,12 @@ reg =3D ; }; };++ ir0: ir@01c21800 {+ pinctr=
l-names =3D "default";+ pinctrl-0 =3D ;+ status =3D "okay";+ }; };  leds {d=
iff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/=
sun7i-a20-cubietruck.dtsindex e288562..e375e89 100644--- a/arch/arm/boot/dt=
s/sun7i-a20-cubietruck.dts+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts@=
@ -232,6 +232,12 @@ reg =3D ; }; };++ ir0: ir@01c21800 {+ pinctrl-names =3D=
 "default";+ pinctrl-0 =3D ;+ status =3D "okay";+ }; };  leds {diff --git a=
/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsiindex 0=
ae2b77..40ded74 100644--- a/arch/arm/boot/dts/sun7i-a20.dtsi+++ b/arch/arm/=
boot/dts/sun7i-a20.dtsi@@ -724,6 +724,19 @@ allwinner,drive =3D ; allwinner=
,pull =3D ; };++ ir0_pins_a: ir0@0 {+ allwinner,pins =3D "PB3","PB4";+ allw=
inner,function =3D "ir0";+ allwinner,drive =3D ;+ allwinner,pull =3D ;+ };+=
 ir1_pins_a: ir1@0 {+ allwinner,pins =3D "PB22","PB23";+ allwinner,function=
 =3D "ir1";+ allwinner,drive =3D ;+ allwinner,pull =3D ;+ }; };  timer@01c2=
0c00 {@@ -937,5 +950,23 @@ #interrupt-cells =3D ; interrupts =3D ; };++ ir0=
: ir@01c21800 {+ compatible =3D "allwinner,sun7i-a20-ir";+ clocks =3D , ;+ =
clock-names =3D "apb", "ir";+ interrupts =3D ;+ reg =3D ;+ status =3D "disa=
bled";+ };++ ir1: ir@01c21c00 {+ compatible =3D "allwinner,sun7i-a20-ir";+ =
clocks =3D , ;+ clock-names =3D "apb", "ir";+ interrupts =3D ;+ reg =3D ;+ =
status =3D "disabled";+ }; }; };-- 1.9.3--To unsubscribe from this list: se=
nd the line "unsubscribe linux-kernel" inthe body of a message to majordomo=
@vger.kernel.orgMore majordomo info at http://vger.kernel.org/majordomo-inf=
o.htmlPlease read the FAQ at http://www.tux.org/lkml/    =20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--53726af9_46e87ccd_25e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div>I've added this to my to-do list.najsjs</div><br/><br/><di=
v><div class=3D"quote">On May 13, 2014 at 1:39:02 PM CDT, Alexander Bersene=
v &lt;bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org&gt; wrote:<br/><blockquote type=3D"cite" style=3D"bo=
rder-left-style:solid;border-width:1px;margin-left:0px;padding-left:10px;">=
This patch adds IR controller in A20 Device-Tree:<br />- Two IR devices fou=
nd in A20 user manual<br />- Pins for two devices<br />- One IR device phys=
ically found on Cubieboard 2<br />- One IR device physically found on Cubie=
truck<br /><br />Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org><br />=
Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org><br />---<br /> =
arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  6 ++++++<br /> arch/arm/boot=
/dts/sun7i-a20-cubietruck.dts  |  6 ++++++<br /> arch/arm/boot/dts/sun7i-a2=
0.dtsi            | 31 +++++++++++++++++++++++++++++<br /> 3 files changed,=
 43 insertions(+)<br /><br />diff --git a/arch/arm/boot/dts/sun7i-a20-cubie=
board2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts<br />index feeff64=
..2564e8c 100644<br />--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts<br =
/>+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts<br />@@ -164,6 +164,12 =
@@<br /> 				reg =3D <1>;<br /> 			};<br /> 		};<br />+<br />+		ir0: ir@01c=
21800 {<br />+			pinctrl-names =3D "default";<br />+			pinctrl-0 =3D <&ir0_=
pins_a>;<br />+			status =3D "okay";<br />+		};<br /> 	};<br /> <br /> 	led=
s {<br />diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm=
/boot/dts/sun7i-a20-cubietruck.dts<br />index e288562..e375e89 100644<br />=
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts<br />+++ b/arch/arm/boot/d=
ts/sun7i-a20-cubietruck.dts<br />@@ -232,6 +232,12 @@<br /> 				reg =3D <1>=
;<br /> 			};<br /> 		};<br />+<br />+		ir0: ir@01c21800 {<br />+			pinctrl=
-names =3D "default";<br />+			pinctrl-0 =3D <&ir0_pins_a>;<br />+			status=
 =3D "okay";<br />+		};<br /> 	};<br /> <br /> 	leds {<br />diff --git a/ar=
ch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi<br />inde=
x 0ae2b77..40ded74 100644<br />--- a/arch/arm/boot/dts/sun7i-a20.dtsi<br />=
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi<br />@@ -724,6 +724,19 @@<br /> 				=
allwinner,drive =3D <2>;<br /> 				allwinner,pull =3D <0>;<br /> 			};<br /=
>+<br />+			ir0_pins_a: ir0@0 {<br />+				    allwinner,pins =3D "PB3","PB4=
";<br />+				    allwinner,function =3D "ir0";<br />+				    allwinner,driv=
e =3D <0>;<br />+				    allwinner,pull =3D <0>;<br />+			};<br />+			ir1_p=
ins_a: ir1@0 {<br />+				    allwinner,pins =3D "PB22","PB23";<br />+				  =
  allwinner,function =3D "ir1";<br />+				    allwinner,drive =3D <0>;<br /=
>+				    allwinner,pull =3D <0>;<br />+			};<br /> 		};<br /> <br /> 		tim=
er@01c20c00 {<br />@@ -937,5 +950,23 @@<br /> 			#interrupt-cells =3D <3>;<=
br /> 			interrupts =3D <1 9 0xf04>;<br /> 		};<br />+<br />+		ir0: ir@01c2=
1800 {<br />+			compatible =3D "allwinner,sun7i-a20-ir";<br />+			clocks =
=3D <&apb0_gates 6>, <&ir0_clk>;<br />+			clock-names =3D "apb", "ir";<br /=
>+			interrupts =3D <0 5 4>;<br />+			reg =3D <0x01c21800 0x40>;<br />+			s=
tatus =3D "disabled";<br />+		};<br />+<br />+		ir1: ir@01c21c00 {<br />+		=
	compatible =3D "allwinner,sun7i-a20-ir";<br />+			clocks =3D <&apb0_gates =
7>, <&ir1_clk>;<br />+			clock-names =3D "apb", "ir";<br />+			interrupts =
=3D <0 6 4>;<br />+			reg =3D <0x01C21c00 0x40>;<br />+			status =3D "disab=
led";<br />+		};<br /> 	};<br /> };<br />-- <br />1.9.3<br /><br />--<br />=
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in<=
br />the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org<br />More majordomo=
 info at  http://vger.kernel.org/majordomo-info.html<br />Please read the F=
AQ at  http://www.tux.org/lkml/<br /></blockquote></div></div></body></html=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--53726af9_46e87ccd_25e--
