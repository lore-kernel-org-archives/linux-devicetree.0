Return-Path: <SRS0=cDgn=5Z=linaro.org=guodong.xu@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1497930035-60894-3-git-send-email-kevin.wangtao@hisilicon.com>
References: <1497930035-60894-1-git-send-email-kevin.wangtao@hisilicon.com> <1497930035-60894-3-git-send-email-kevin.wangtao@hisilicon.com>
From: Guodong Xu <guodong.xu@linaro.org>
Date: Tue, 20 Jun 2017 15:38:58 +0800
Message-ID: <CAFGCpxwmN3jAZn2chK+QQ-YKg7TwWJOTHSi1VzwcSQ7Mm3gQng@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: register Hi3660's thermal sensor
Content-Type: multipart/alternative; boundary="94eb2c07947037d50405525f5819"
To: Tao Wang <kevin.wangtao@hisilicon.com>
Cc: edubezval@gmail.com, Leo Yan <leo.yan@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, sunzhaosheng@hisilicon.com, rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c07947037d50405525f5819
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017=E5=B9=B46=E6=9C=8820=E6=97=A5 =E4=B8=8A=E5=8D=8811:49=EF=BC=8C"Tao Wan=
g" <kevin.wangtao@hisilicon.com>=E5=86=99=E9=81=93=EF=BC=9A

Bind thermal sensor driver for Hi3660.

Signed-off-by: Tao Wang <kevin.wangtao@hisilicon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 3983086..cc67958 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -156,5 +156,12 @@


i am wondering which tree this patch should be applied to. Actually Olof
Johansson olof@lixom.net just merged hi3660 dts into his tree. You should
better rebase you dts patch onto that.


                        clock-names =3D "uartclk", "apb_pclk";
                        status =3D "disabled";
                };
+
+               tsensor: tsensor {
+                       compatible =3D "hisilicon,thermal-hi3660";
+                       reg =3D <0x0 0xfff30000 0x0 0x1000>;
+                       #thermal-sensor-cells =3D <1>;
+                       status =3D "ok";


please remove status ok. that's default. redundant.

+               };
        };
 };
--
1.7.9.5


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--94eb2c07947037d50405525f5819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">2017=E5=B9=B46=E6=9C=8820=E6=97=A5 =E4=B8=8A=E5=8D=8811:49=EF=BC=
=8C&quot;Tao Wang&quot; &lt;<a href=3D"mailto:kevin.wangtao@hisilicon.com">=
kevin.wangtao@hisilicon.com</a>&gt;=E5=86=99=E9=81=93=EF=BC=9A<br type=3D"a=
ttribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Bind thermal sensor driver for Hi3660.=
<br>
<br>
Signed-off-by: Tao Wang &lt;<a href=3D"mailto:kevin.wangtao@hisilicon.com">=
kevin.wangtao@hisilicon.com</a>&gt;<br>
Signed-off-by: Leo Yan &lt;<a href=3D"mailto:leo.yan@linaro.org">leo.yan@li=
naro.org</a>&gt;<br>
---<br>
=C2=A0arch/arm64/boot/dts/hisilicon/<wbr>hi3660.dtsi |=C2=A0 =C2=A0 7 +++++=
++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/<wbr>hisilicon/hi3660.dtsi b/arch/arm64/bo=
ot/dts/<wbr>hisilicon/hi3660.dtsi<br>
index 3983086..cc67958 100644<br>
--- a/arch/arm64/boot/dts/<wbr>hisilicon/hi3660.dtsi<br>
+++ b/arch/arm64/boot/dts/<wbr>hisilicon/hi3660.dtsi<br>
@@ -156,5 +156,12 @@<br></blockquote></div></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">i am wondering which tree this patch should be ap=
plied to. Actually Olof Johansson <a href=3D"mailto:olof@lixom.net">olof@li=
xom.net</a>=C2=A0just merged hi3660 dts into his tree. You should better re=
base you dts patch onto that.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clock-names =3D &quot;uartclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D &quot;disabled&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsensor: tsensor {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;hisilicon,thermal-hi3660&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x0 0xfff30000 0x0 0x1000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#thermal-sensor-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0status =3D &quot;ok&quot;;<br></blockquote></div></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">please remove status ok. that&#39=
;s default. redundant.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.<wbr>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr>mailman/=
listinfo/linux-arm-<wbr>kernel</a><br>
</font></blockquote></div><br></div></div></div>

--94eb2c07947037d50405525f5819--
