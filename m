From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Subject: Re: [PATCH v4 01/03] ARM: sunxi: Add documentation for
 sunxi consumer infrared devices
Date: Wed, 30 Apr 2014 03:54:35 -0700 (PDT)
Message-ID: <6a8ffca8-d586-46f6-96e5-4e132ba0f368@googlegroups.com>
References: <d641a69a-01b4-443d-b121-48d13f46ee03@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_3080_22425817.1398855275430"
Return-path: <linux-sunxi+bncBCLIFP6QZ4HRB25MQONQKGQE56QMEQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <d641a69a-01b4-443d-b121-48d13f46ee03-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_3080_22425817.1398855275430
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[PATCH v4 01/03] ARM: sunxi: Add documentation for sunxi consumer infrared=
=20
devices

This patch adds documentation for Device-Tree bindings for sunxi IR=20
controller.=20

Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt=20
b/Documentation/devicetree/bindings/media/sunxi-ir.txt
new file mode 100644
index 0000000..d502cf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -0,0 +1,23 @@
+Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
+
+Required properties:
+- compatible    : should be "allwinner,sun7i-a20-ir";
+- clocks    : list of clock specifiers, corresponding to
+      entries in clock-names property;
+- clock-names    : should contain "apb0_ir0" and "ir0" entries;
+- interrupts    : should contain IR IRQ number;
+- reg    : should contain IO map address for IR.
+
+Optional properties:
+- linux,rc-map-name : Remote control map name.
+
+Example:
+
+ir0: ir@01c21800 {
+       compatible =3D "allwinner,sun7i-a20-ir";
+       clocks =3D <&apb0_gates 6>, <&ir0_clk>;
+       clock-names =3D "apb0_ir0", "ir0";
+       interrupts =3D <0 5 1>;
+       reg =3D <0x01C21800 0x40>;
+       linux,rc-map-name =3D "rc-rc6-mce";
+};


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

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_3080_22425817.1398855275430
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[PATCH v4 01/03] ARM: sunxi: Add documentation for su=
nxi consumer infrared devices</div><div><br></div><div>This patch adds docu=
mentation for Device-Tree bindings for sunxi IR&nbsp;</div><div>controller.=
&nbsp;</div><div><br></div><div>Signed-off-by: Alexander Bersenev &lt;bay@h=
ackerdom.ru&gt;</div><div>Signed-off-by: Alexsey Shestacov &lt;wingrime@lin=
ux-sunxi.org&gt;</div><div><br></div><div>diff --git a/Documentation/device=
tree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/=
sunxi-ir.txt</div><div>new file mode 100644</div><div>index 0000000..d502cf=
4</div><div>--- /dev/null</div><div>+++ b/Documentation/devicetree/bindings=
/media/sunxi-ir.txt</div><div>@@ -0,0 +1,23 @@</div><div>+Device-Tree bindi=
ngs for SUNXI IR controller found in sunXi SoC family</div><div>+</div><div=
>+Required properties:</div><div>+- compatible<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">	</span> &nbsp; &nbsp;: should be "allwinner,su=
n7i-a20-ir";</div><div>+- clocks<span class=3D"Apple-tab-span" style=3D"whi=
te-space:pre">	</span> &nbsp; &nbsp;: list of clock specifiers, correspondi=
ng to</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</span> &nbsp; &nbsp; &nbsp;entries in clock-names property;</div><div>+- =
clock-names<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span=
> &nbsp; &nbsp;: should contain "apb0_ir0" and "ir0" entries;</div><div>+- =
interrupts<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
 &nbsp; &nbsp;: should contain IR IRQ number;</div><div>+- reg<span class=
=3D"Apple-tab-span" style=3D"white-space:pre">		</span> &nbsp; &nbsp;: shou=
ld contain IO map address for IR.</div><div>+</div><div>+Optional propertie=
s:</div><div>+- linux,rc-map-name : Remote control map name.</div><div>+</d=
iv><div>+Example:</div><div>+</div><div>+ir0: ir@01c21800 {</div><div>+ &nb=
sp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>compatible =3D "allwinner,sun7i-a20-ir";</div><div>+ &nbsp; &nbsp; =
&nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>clo=
cks =3D &lt;&amp;apb0_gates 6&gt;, &lt;&amp;ir0_clk&gt;;</div><div>+ &nbsp;=
 &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span>clock-names =3D "apb0_ir0", "ir0";</div><div>+ &nbsp; &nbsp; &nbsp; <s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>interrupts =
=3D &lt;0 5 1&gt;;</div><div>+ &nbsp; &nbsp; &nbsp; <span class=3D"Apple-ta=
b-span" style=3D"white-space:pre">	</span>reg =3D &lt;0x01C21800 0x40&gt;;<=
/div><div>+ &nbsp; &nbsp; &nbsp; <span class=3D"Apple-tab-span" style=3D"wh=
ite-space:pre">	</span>linux,rc-map-name =3D "rc-rc6-mce";</div><div>+};</d=
iv><div><br></div><br>=D1=81=D1=80=D0=B5=D0=B4=D0=B0, 30 =D0=B0=D0=BF=D1=80=
=D0=B5=D0=BB=D1=8F 2014&nbsp;=D0=B3., 16:51:12 UTC+6 =D0=BF=D0=BE=D0=BB=D1=
=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C =D0=90=D0=BB=D0=B5=D0=
=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80 =D0=91=D0=B5=D1=80=D1=81=D0=B5=D0=BD=D0=
=B5=D0=B2 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:<blockquote class=3D"g=
mail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc sol=
id;padding-left: 1ex;"><div dir=3D"ltr"><div>This patch introduces Consumer=
 IR(CIR) support for sunxi boards.</div><div><br></div><div>This is based o=
n Alexsey Shestacov's work based on the original driver&nbsp;</div><div>sup=
plied by Allwinner.</div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_3080_22425817.1398855275430--
