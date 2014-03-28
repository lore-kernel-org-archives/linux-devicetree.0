Return-Path: <dinh.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396041629-28820-1-git-send-email-robherring2@gmail.com>
References: <1396041629-28820-1-git-send-email-robherring2@gmail.com>
Date: Fri, 28 Mar 2014 16:27:10 -0500
Message-ID: <CADhT+we7jAbH1J=_N3ryEbvfHq930iBCpeBG3rco=AVeru0aGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt/bindings: add binding for ARM Versatile character LCD
From: Dinh Nguyen <dinh.linux@gmail.com>
Content-Type: multipart/alternative; boundary=089e0149426852415004f5b15d5e
To: Rob Herring <robherring2@gmail.com>
Cc: Linux List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

--089e0149426852415004f5b15d5e
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 28, 2014 at 4:20 PM, Rob Herring <robherring2@gmail.com> wrote:

> From: Rob Herring <robh@kernel.org>
>
> Add binding doc for Versatile platforms character LCD controller
> interface.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/misc/arm-charlcd.txt | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/arm-charlcd.txt
>
> diff --git a/Documentation/devicetree/bindings/misc/arm-charlcd.txt
> b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
> new file mode 100644
> index 0000000..e28e2aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
> @@ -0,0 +1,18 @@
> +ARM Versatile Character LCD
> +-----------------------------------------------------
> +This binding defines the character LCD interface found on ARM Versatile AB
> +and PB reference platforms.
> +
> +Required properties:
> +- compatible : "arm,versatile-clcd"
> +- reg : Location and size of character LCD registers
> +
> +Optional properties:
> +- interrupts - single interrupt for character LCD. The character LCD can
> +  operate in polled mode without an interrupt.
> +
> +Example:
> +       lcd@10008000 {
> +               compatible = "arm,versatile-lcd";
>

Should be "arm,versatile-clcd" here?

Dinh

> +               reg = <0x10008000 0x1000>;
> +       };
> --
> 1.8.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e0149426852415004f5b15d5e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Mar 28, 2014 at 4:20 PM, Rob Herring <span dir=3D"ltr">&lt;=
<a href=3D"mailto:robherring2@gmail.com" target=3D"_blank">robherring2@gmai=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Rob Herring &lt;<a href=3D"mailto:robh=
@kernel.org">robh@kernel.org</a>&gt;<br>
<br>
Add binding doc for Versatile platforms character LCD controller<br>
interface.<br>
<br>
Signed-off-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@kern=
el.org</a>&gt;<br>
Cc: Pawel Moll &lt;<a href=3D"mailto:pawel.moll@arm.com">pawel.moll@arm.com=
</a>&gt;<br>
Cc: Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com">mark.rutland@a=
rm.com</a>&gt;<br>
Cc: Ian Campbell &lt;<a href=3D"mailto:ijc%2Bdevicetree@hellion.org.uk">ijc=
+devicetree@hellion.org.uk</a>&gt;<br>
Cc: Kumar Gala &lt;<a href=3D"mailto:galak@codeaurora.org">galak@codeaurora=
.org</a>&gt;<br>
---<br>
=A0Documentation/devicetree/bindings/misc/arm-charlcd.txt | 18 ++++++++++++=
++++++<br>
=A01 file changed, 18 insertions(+)<br>
=A0create mode 100644 Documentation/devicetree/bindings/misc/arm-charlcd.tx=
t<br>
<br>
diff --git a/Documentation/devicetree/bindings/misc/arm-charlcd.txt b/Docum=
entation/devicetree/bindings/misc/arm-charlcd.txt<br>
new file mode 100644<br>
index 0000000..e28e2aa<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/misc/arm-charlcd.txt<br>
@@ -0,0 +1,18 @@<br>
+ARM Versatile Character LCD<br>
+-----------------------------------------------------<br>
+This binding defines the character LCD interface found on ARM Versatile AB=
<br>
+and PB reference platforms.<br>
+<br>
+Required properties:<br>
+- compatible : &quot;arm,versatile-clcd&quot;<br>
+- reg : Location and size of character LCD registers<br>
+<br>
+Optional properties:<br>
+- interrupts - single interrupt for character LCD. The character LCD can<b=
r>
+ =A0operate in polled mode without an interrupt.<br>
+<br>
+Example:<br>
+ =A0 =A0 =A0 lcd@10008000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;arm,versatile-lcd&quot;;=
<br></blockquote><div><br></div><div>Should be &quot;arm,versatile-clcd&quo=
t; here?</div><div><br></div><div>Dinh=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">

+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x10008000 0x1000&gt;;<br>
+ =A0 =A0 =A0 };<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.2<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe devicetree&q=
uot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br></div></div>

--089e0149426852415004f5b15d5e--
