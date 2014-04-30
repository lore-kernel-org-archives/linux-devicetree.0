From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Subject: Re: [PATCH v4 03/03] ARM: sunxi: Add IR controller
 support in DT on A20
Date: Wed, 30 Apr 2014 04:02:05 -0700 (PDT)
Message-ID: <a792e87c-0676-409d-a8a2-2d4635598f2f@googlegroups.com>
References: <d641a69a-01b4-443d-b121-48d13f46ee03@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_4850_27522045.1398855725315"
Return-path: <linux-sunxi+bncBCLIFP6QZ4HRBLVQQONQKGQELPFMTMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <d641a69a-01b4-443d-b121-48d13f46ee03-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_4850_27522045.1398855725315
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch adds IR controller in A20 Device-Tree:
- Two IR devices found in A20 user manual
- Pins for two devices
- One IR device physically found on Cubieboard 2=20
- One IR device physically found on Cubietruck=20

Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts=20
b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index feeff64..2564e8c 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -164,6 +164,12 @@
  reg =3D <1>;
  };
  };
+
+ ir0: ir@01c21800 {
+ pinctrl-names =3D "default";
+ pinctrl-0 =3D <&ir0_pins_a>;
+ status =3D "okay";
+ };
  };
=20
  leds {
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts=20
b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index e288562..e375e89 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -232,6 +232,12 @@
  reg =3D <1>;
  };
  };
+
+ ir0: ir@01c21800 {
+ pinctrl-names =3D "default";
+ pinctrl-0 =3D <&ir0_pins_a>;
+ status =3D "okay";
+ };
  };
=20
  leds {
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi=20
b/arch/arm/boot/dts/sun7i-a20.dtsi
index 0ae2b77..bb655a5 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -724,6 +724,19 @@
  allwinner,drive =3D <2>;
  allwinner,pull =3D <0>;
  };
+
+ ir0_pins_a: ir0@0 {
+    allwinner,pins =3D "PB3","PB4";
+    allwinner,function =3D "ir0";
+    allwinner,drive =3D <0>;
+    allwinner,pull =3D <0>;
+ };
+ ir1_pins_a: ir1@0 {
+    allwinner,pins =3D "PB22","PB23";
+    allwinner,function =3D "ir1";
+    allwinner,drive =3D <0>;
+    allwinner,pull =3D <0>;
+ };
  };
=20
  timer@01c20c00 {
@@ -937,5 +950,23 @@
  #interrupt-cells =3D <3>;
  interrupts =3D <1 9 0xf04>;
  };
+
+       ir0: ir@01c21800 {
+     compatible =3D "allwinner,sun7i-a20-ir";
+ clocks =3D <&apb0_gates 6>, <&ir0_clk>;
+ clock-names =3D "apb", "ir";
+ interrupts =3D <0 5 4>;
+ reg =3D <0x01c21800 0x40>;
+ status =3D "disabled";
+ };
+
+       ir1: ir@01c21c00 {
+     compatible =3D "allwinner,sun7i-a20-ir";
+ clocks =3D <&apb0_gates 7>, <&ir1_clk>;
+ clock-names =3D "apb", "ir";
+ interrupts =3D <0 6 4>;
+ reg =3D <0x01C21c00 0x40>;
+ status =3D "disabled";
+ };
  };
 };


=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 201=
4 =D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=
=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=
=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>
> This patch introduces Consumer IR(CIR) support for sunxi boards.
>
> This is based on Alexsey Shestacov's work based on the original driver=20
> supplied by Allwinner.
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_4850_27522045.1398855725315
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This patch adds IR controller in A20 Device-Tree:</di=
v><div>- Two IR devices found in A20 user manual</div><div>- Pins for two d=
evices</div><div>- One IR device physically found on Cubieboard 2&nbsp;</di=
v><div>- One IR device physically found on Cubietruck&nbsp;</div><div><br><=
/div><div>Signed-off-by: Alexander Bersenev &lt;bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org&gt;</div><=
div>Signed-off-by: Alexsey Shestacov &lt;wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org&gt;</div>=
<div><br></div><div>diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dt=
s b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts</div><div>index feeff64..25=
64e8c 100644</div><div>--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts</d=
iv><div>+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts</div><div>@@ -164=
,6 +164,12 @@</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">				</span>reg =3D &lt;1&gt;;</div><div>&nbsp;<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">			</span>};</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>};</div><div>+<=
/div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</spa=
n>ir0: ir@01c21800 {</div><div>+<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">			</span>pinctrl-names =3D "default";</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">			</span>pinctrl-0 =3D &lt;&=
amp;ir0_pins_a&gt;;</div><div>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">			</span>status =3D "okay";</div><div>+<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">		</span>};</div><div>&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>};</div><div>&nbsp;</=
div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span>leds {</div><div>diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.d=
ts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts</div><div>index e288562..e3=
75e89 100644</div><div>--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts</di=
v><div>+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts</div><div>@@ -232,6=
 +232,12 @@</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">				</span>reg =3D &lt;1&gt;;</div><div>&nbsp;<span class=3D"Appl=
e-tab-span" style=3D"white-space:pre">			</span>};</div><div>&nbsp;<span cl=
ass=3D"Apple-tab-span" style=3D"white-space:pre">		</span>};</div><div>+</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>=
ir0: ir@01c21800 {</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">			</span>pinctrl-names =3D "default";</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">			</span>pinctrl-0 =3D &lt;&=
amp;ir0_pins_a&gt;;</div><div>+<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">			</span>status =3D "okay";</div><div>+<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">		</span>};</div><div>&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">	</span>};</div><div>&nbsp;</=
div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span>leds {</div><div>diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/=
arm/boot/dts/sun7i-a20.dtsi</div><div>index 0ae2b77..bb655a5 100644</div><d=
iv>--- a/arch/arm/boot/dts/sun7i-a20.dtsi</div><div>+++ b/arch/arm/boot/dts=
/sun7i-a20.dtsi</div><div>@@ -724,6 +724,19 @@</div><div>&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">				</span>allwinner,drive =
=3D &lt;2&gt;;</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">				</span>allwinner,pull =3D &lt;0&gt;;</div><div>&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>};</div><div>=
+</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</=
span>ir0_pins_a: ir0@0 {</div><div>+<span class=3D"Apple-tab-span" style=3D=
"white-space:pre">				</span> &nbsp; &nbsp;allwinner,pins =3D "PB3","PB4";<=
/div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">				</s=
pan> &nbsp; &nbsp;allwinner,function =3D "ir0";</div><div>+<span class=3D"A=
pple-tab-span" style=3D"white-space:pre">				</span> &nbsp; &nbsp;allwinner=
,drive =3D &lt;0&gt;;</div><div>+<span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">				</span> &nbsp; &nbsp;allwinner,pull =3D &lt;0&gt;;</div>=
<div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>};=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</s=
pan>ir1_pins_a: ir1@0 {</div><div>+<span class=3D"Apple-tab-span" style=3D"=
white-space:pre">				</span> &nbsp; &nbsp;allwinner,pins =3D "PB22","PB23";=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">				</=
span> &nbsp; &nbsp;allwinner,function =3D "ir1";</div><div>+<span class=3D"=
Apple-tab-span" style=3D"white-space:pre">				</span> &nbsp; &nbsp;allwinne=
r,drive =3D &lt;0&gt;;</div><div>+<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">				</span> &nbsp; &nbsp;allwinner,pull =3D &lt;0&gt;;</div=
><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>}=
;</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
		</span>};</div><div>&nbsp;</div><div>&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">		</span>timer@01c20c00 {</div><div>@@ -937,5 +9=
50,23 @@</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">			</span>#interrupt-cells =3D &lt;3&gt;;</div><div>&nbsp;<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">			</span>interrupts =3D &lt=
;1 9 0xf04&gt;;</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">		</span>};</div><div>+</div><div>+ &nbsp; &nbsp; &nbsp; <spa=
n class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>ir0: ir@01c21=
800 {</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:p=
re">		</span>compatible =3D "allwinner,sun7i-a20-ir";</div><div>+<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">			</span>clocks =3D &lt;&am=
p;apb0_gates 6&gt;, &lt;&amp;ir0_clk&gt;;</div><div>+<span class=3D"Apple-t=
ab-span" style=3D"white-space:pre">			</span>clock-names =3D "apb", "ir";</=
div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</spa=
n>interrupts =3D &lt;0 5 4&gt;;</div><div>+<span class=3D"Apple-tab-span" s=
tyle=3D"white-space:pre">			</span>reg =3D &lt;0x01c21800 0x40&gt;;</div><d=
iv>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>stat=
us =3D "disabled";</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space:pre">		</span>};</div><div>+</div><div>+ &nbsp; &nbsp; &nbsp; <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span>ir1: ir@01c21c0=
0 {</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span> &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre=
">		</span>compatible =3D "allwinner,sun7i-a20-ir";</div><div>+<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">			</span>clocks =3D &lt;&amp=
;apb0_gates 7&gt;, &lt;&amp;ir1_clk&gt;;</div><div>+<span class=3D"Apple-ta=
b-span" style=3D"white-space:pre">			</span>clock-names =3D "apb", "ir";</d=
iv><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span=
>interrupts =3D &lt;0 6 4&gt;;</div><div>+<span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre">			</span>reg =3D &lt;0x01C21c00 0x40&gt;;</div><di=
v>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">			</span>statu=
s =3D "disabled";</div><div>+<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">		</span>};</div><div>&nbsp;<span class=3D"Apple-tab-span" style=
=3D"white-space:pre">	</span>};</div><div>&nbsp;};</div><div><br></div><br>=
=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 201=
4&nbsp;=D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=
=D0=B0=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=
=D0=B4=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=B5=D0=B2 =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"=
><div dir=3D"ltr"><div>This patch introduces Consumer IR(CIR) support for s=
unxi boards.</div><div><br></div><div>This is based on Alexsey Shestacov's =
work based on the original driver&nbsp;</div><div>supplied by Allwinner.</d=
iv><div><br></div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_4850_27522045.1398855725315--
