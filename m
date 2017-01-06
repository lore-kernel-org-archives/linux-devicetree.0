Return-Path: <SRS0=GrzW=YU=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 6 Jan 2017 17:19:02 +0800
Message-ID: <CA+DQWkwMipiMEH1S+=SvfZB_2M75TD=1czdoULMjA9Z7rXD6eA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] dt-bindings: zte: add bindings document for zx2967
 power domain controller
Content-Type: multipart/alternative; boundary=001a114abf4a45cd7c05456982a6
To: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, Arnd Bergmann <arnd@arndb.de>, claudiu.manoil@nxp.com, amit daniel <amitdanielk@gmail.com>, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114abf4a45cd7c05456982a6
Content-Type: text/plain; charset=UTF-8

+ Shawn

On 6 January 2017 at 17:16, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch adds device tree bindings document for ZTE zx2967
> family power domain controller.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  .../devicetree/bindings/soc/zte/pd-2967xx.txt         | 19
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/
> bindings/soc/zte/pd-2967xx.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
> b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
> new file mode 100644
> index 0000000..7629de1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
> @@ -0,0 +1,19 @@
> +* ZTE zx2967 family Power Domains
> +
> +zx2967 family includes support for multiple power domains which are used
> +to gate power to one or more peripherals on the processor.
> +
> +Required Properties:
> +  - compatible: should be one of the following.
> +      * zte,zx296718-pcu - for zx296718 power domain.
> +  - reg: physical base address of the controller and length of memory
> mapped
> +      region.
> +  - #power-domain-cells: Must be 1.
> +
> +Example:
> +
> +       pcu_domain: pcu@117000 {
> +               compatible = "zte,zx296718-pcu";
> +               reg = <0x00117000 0x1000>;
> +               #power-domain-cells = <1>;
> +       };
> --
> 2.7.4
>
>

--001a114abf4a45cd7c05456982a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ Shawn<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 6 January 2017 at 17:16, Baoyou Xie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:baoyou.xie@linaro.org" target=3D"_blank">baoyou.xie@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This pat=
ch adds device tree bindings document for ZTE zx2967<br>
family power domain controller.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoy=
ou.xie@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../devicetree/bindings/soc/<wbr>zte/pd-2967xx.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/soc/zte/pd-=
2967xx.txt<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/soc/zte/pd-2967xx.txt b=
/Documentation/devicetree/<wbr>bindings/soc/zte/pd-2967xx.txt<br>
new file mode 100644<br>
index 0000000..7629de1<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/soc/zte/pd-2967xx.txt<br>
@@ -0,0 +1,19 @@<br>
+* ZTE zx2967 family Power Domains<br>
+<br>
+zx2967 family includes support for multiple power domains which are used<b=
r>
+to gate power to one or more peripherals on the processor.<br>
+<br>
+Required Properties:<br>
+=C2=A0 - compatible: should be one of the following.<br>
+=C2=A0 =C2=A0 =C2=A0 * zte,zx296718-pcu - for zx296718 power domain.<br>
+=C2=A0 - reg: physical base address of the controller and length of memory=
 mapped<br>
+=C2=A0 =C2=A0 =C2=A0 region.<br>
+=C2=A0 - #power-domain-cells: Must be 1.<br>
+<br>
+Example:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcu_domain: pcu@117000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;zte,zx296718-pcu&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x00117=
000 0x1000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#power-domain-cells=
 =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a114abf4a45cd7c05456982a6--
