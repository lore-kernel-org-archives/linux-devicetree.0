Return-Path: <SRS0=qy9v=UZ=gmail.com=cwchoi00@kernel.org>
MIME-Version: 1.0
References: <CGME20190605091304eucas1p21e0717cafa17a14de569f1773cc7abe5@eucas1p2.samsung.com>
 <20190605091236.24263-1-l.luba@partner.samsung.com> <20190605091236.24263-5-l.luba@partner.samsung.com>
In-Reply-To: <20190605091236.24263-5-l.luba@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 26 Jun 2019 17:23:43 +0900
Message-ID: <CAGTfZH2kTNWtx=Jp1UJaLN50Qxbq+Q9ThV4vhQ240QbOy1TRMQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] Documentation: devicetree: add PPMU events description
Content-Type: multipart/alternative; boundary="00000000000022b8ac058c35c44d"
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, willy.mh.wolff.ml@gmail.com
List-ID: <devicetree@vger.kernel.org>

--00000000000022b8ac058c35c44d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

2019=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=EC=88=98) 18:14, Lukasz Luba <l.luba@=
partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Extend the documenation by events description with new 'event-data-type'
> field. Add example how the event might be defined in DT.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  .../bindings/devfreq/event/exynos-ppmu.txt    | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>


Acked-by: Chanwoo Choi <cw00.choi@samsung.com>



>
> diff --git
> a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
> b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
> index 3e36c1d11386..fb46b491791c 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
> +++ b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt
> @@ -10,14 +10,23 @@ The Exynos PPMU driver uses the devfreq-event class t=
o
> provide event data
>  to various devfreq devices. The devfreq devices would use the event data
> when
>  derterming the current state of each IP.
>
> -Required properties:
> +Required properties for PPMU device:
>  - compatible: Should be "samsung,exynos-ppmu" or "samsung,exynos-ppmu-v2=
.
>  - reg: physical base address of each PPMU and length of memory mapped
> region.
>
> -Optional properties:
> +Optional properties for PPMU device:
>  - clock-names : the name of clock used by the PPMU, "ppmu"
>  - clocks : phandles for clock specified in "clock-names" property
>
> +Required properties for 'events' child node of PPMU device:
> +- event-name : the unique event name among PPMU device
> +Optional properties for 'events' child node of PPMU device:
> +- event-data-type : Define the type of data which shell be counted
> +by the counter. You can check include/dt-bindings/pmu/exynos_ppmu.h for
> +all possible type, i.e. count read requests, count write data in bytes,
> +etc. This field is optional and when it is missing, the driver code
> +will use default data type.
> +
>  Example1 : PPMUv1 nodes in exynos3250.dtsi are listed below.
>
>                 ppmu_dmc0: ppmu_dmc0@106a0000 {
> @@ -145,3 +154,16 @@ Example3 : PPMUv2 nodes in exynos5433.dtsi are liste=
d
> below.
>                         reg =3D <0x104d0000 0x2000>;
>                         status =3D "disabled";
>                 };
> +
> +Example4 : 'event-data-type' in exynos4412-ppmu-common.dtsi are listed
> below.
> +
> +       &ppmu_dmc0 {
> +               status =3D "okay";
> +               events {
> +                       ppmu_dmc0_3: ppmu-event3-dmc0 {
> +                       event-name =3D "ppmu-event3-dmc0";
> +                       event-data-type =3D <(PPMU_RO_DATA_CNT |
> +                                       PPMU_WO_DATA_CNT)>;
> +                       };
> +               };
> +       };
> --
> 2.17.1
>
>

--00000000000022b8ac058c35c44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Lukasz,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">2019=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=EC=88=
=98) 18:14, Lukasz Luba &lt;<a href=3D"mailto:l.luba@partner.samsung.com">l=
.luba@partner.samsung.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Extend the documenation by events desc=
ription with new &#39;event-data-type&#39;<br>
field. Add example how the event might be defined in DT.<br>
<br>
Signed-off-by: Lukasz Luba &lt;<a href=3D"mailto:l.luba@partner.samsung.com=
" target=3D"_blank" rel=3D"noreferrer">l.luba@partner.samsung.com</a>&gt;<b=
r>
Signed-off-by: Chanwoo Choi &lt;<a href=3D"mailto:cw00.choi@samsung.com" ta=
rget=3D"_blank" rel=3D"noreferrer">cw00.choi@samsung.com</a>&gt;<br>
---<br>
=C2=A0.../bindings/devfreq/event/exynos-ppmu.txt=C2=A0 =C2=A0 | 26 ++++++++=
+++++++++--<br>
=C2=A01 file changed, 24 insertions(+), 2 deletions(-)<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><span style=3D"font-family:sans-serif">Acked-by: Chanwoo Choi &lt;<a=
 href=3D"mailto:cw00.choi@samsung.com">cw00.choi@samsung.com</a>&gt;</span>=
<br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></sp=
an></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br><br>
diff --git a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.tx=
t b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt<br>
index 3e36c1d11386..fb46b491791c 100644<br>
--- a/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt<br>
+++ b/Documentation/devicetree/bindings/devfreq/event/exynos-ppmu.txt<br>
@@ -10,14 +10,23 @@ The Exynos PPMU driver uses the devfreq-event class to =
provide event data<br>
=C2=A0to various devfreq devices. The devfreq devices would use the event d=
ata when<br>
=C2=A0derterming the current state of each IP.<br>
<br>
-Required properties:<br>
+Required properties for PPMU device:<br>
=C2=A0- compatible: Should be &quot;samsung,exynos-ppmu&quot; or &quot;sams=
ung,exynos-ppmu-v2.<br>
=C2=A0- reg: physical base address of each PPMU and length of memory mapped=
 region.<br>
<br>
-Optional properties:<br>
+Optional properties for PPMU device:<br>
=C2=A0- clock-names : the name of clock used by the PPMU, &quot;ppmu&quot;<=
br>
=C2=A0- clocks : phandles for clock specified in &quot;clock-names&quot; pr=
operty<br>
<br>
+Required properties for &#39;events&#39; child node of PPMU device:<br>
+- event-name : the unique event name among PPMU device<br>
+Optional properties for &#39;events&#39; child node of PPMU device:<br>
+- event-data-type : Define the type of data which shell be counted<br>
+by the counter. You can check include/dt-bindings/pmu/exynos_ppmu.h for<br=
>
+all possible type, i.e. count read requests, count write data in bytes,<br=
>
+etc. This field is optional and when it is missing, the driver code<br>
+will use default data type.<br>
+<br>
=C2=A0Example1 : PPMUv1 nodes in exynos3250.dtsi are listed below.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ppmu_dmc0: ppmu_dmc=
0@106a0000 {<br>
@@ -145,3 +154,16 @@ Example3 : PPMUv2 nodes in exynos5433.dtsi are listed =
below.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reg =3D &lt;0x104d0000 0x2000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D &quot;disabled&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+Example4 : &#39;event-data-type&#39; in exynos4412-ppmu-common.dtsi are li=
sted below.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ppmu_dmc0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok=
ay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0events {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ppmu_dmc0_3: ppmu-event3-dmc0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0event-name =3D &quot;ppmu-event3-dmc0&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0event-data-type =3D &lt;(PPMU_RO_DATA_CNT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PPMU_WO_D=
ATA_CNT)&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--00000000000022b8ac058c35c44d--
