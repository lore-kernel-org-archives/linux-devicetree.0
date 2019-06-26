Return-Path: <SRS0=qy9v=UZ=gmail.com=cwchoi00@kernel.org>
MIME-Version: 1.0
References: <CGME20190605091302eucas1p2b2a959c0889666e95bd727381bceab24@eucas1p2.samsung.com>
 <20190605091236.24263-1-l.luba@partner.samsung.com> <20190605091236.24263-3-l.luba@partner.samsung.com>
In-Reply-To: <20190605091236.24263-3-l.luba@partner.samsung.com>
Reply-To: cwchoi00@gmail.com
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 26 Jun 2019 17:22:23 +0900
Message-ID: <CAGTfZH0X7GmGWTyDZdJV_o98oCgrGR+syRD_pcby-DbOeZ3Emg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drivers: devfreq: events: change matching code
 during probe
Content-Type: multipart/alternative; boundary="000000000000750a84058c35bf17"
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, willy.mh.wolff.ml@gmail.com
List-ID: <devicetree@vger.kernel.org>

--000000000000750a84058c35bf17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

2019=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=EC=88=98) 18:13, Lukasz Luba <l.luba@=
partner.samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> The patch changes the way how the 'ops' gets populated for different
> device versions. The matching function now uses 'of_device_id' in order
> to identify the device type.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/devfreq/event/exynos-ppmu.c | 38 +++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>


Acked-by: Chanwoo Choi <cw00.choi@samsung.com>



> diff --git a/drivers/devfreq/event/exynos-ppmu.c
> b/drivers/devfreq/event/exynos-ppmu.c
> index c2ea94957501..17f3c86a6f00 100644
> --- a/drivers/devfreq/event/exynos-ppmu.c
> +++ b/drivers/devfreq/event/exynos-ppmu.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/suspend.h>
> @@ -23,6 +24,11 @@
>
>  #include "exynos-ppmu.h"
>
> +enum exynos_ppmu_type {
> +       EXYNOS_TYPE_PPMU,
> +       EXYNOS_TYPE_PPMU_V2,
> +};
> +
>  struct exynos_ppmu_data {
>         struct clk *clk;
>  };
> @@ -36,6 +42,7 @@ struct exynos_ppmu {
>         struct regmap *regmap;
>
>         struct exynos_ppmu_data ppmu;
> +       enum exynos_ppmu_type ppmu_type;
>  };
>
>  #define PPMU_EVENT(name)                       \
> @@ -483,31 +490,23 @@ static const struct devfreq_event_ops
> exynos_ppmu_v2_ops =3D {
>  static const struct of_device_id exynos_ppmu_id_match[] =3D {
>         {
>                 .compatible =3D "samsung,exynos-ppmu",
> -               .data =3D (void *)&exynos_ppmu_ops,
> +               .data =3D (void *)EXYNOS_TYPE_PPMU,
>         }, {
>                 .compatible =3D "samsung,exynos-ppmu-v2",
> -               .data =3D (void *)&exynos_ppmu_v2_ops,
> +               .data =3D (void *)EXYNOS_TYPE_PPMU_V2,
>         },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, exynos_ppmu_id_match);
>
> -static struct devfreq_event_ops *exynos_bus_get_ops(struct device_node
> *np)
> -{
> -       const struct of_device_id *match;
> -
> -       match =3D of_match_node(exynos_ppmu_id_match, np);
> -       return (struct devfreq_event_ops *)match->data;
> -}
> -
>  static int of_get_devfreq_events(struct device_node *np,
>                                  struct exynos_ppmu *info)
>  {
>         struct devfreq_event_desc *desc;
> -       struct devfreq_event_ops *event_ops;
>         struct device *dev =3D info->dev;
>         struct device_node *events_np, *node;
>         int i, j, count;
> +       const struct of_device_id *of_id;
>
>         events_np =3D of_get_child_by_name(np, "events");
>         if (!events_np) {
> @@ -515,7 +514,6 @@ static int of_get_devfreq_events(struct device_node
> *np,
>                         "failed to get child node of devfreq-event
> devices\n");
>                 return -EINVAL;
>         }
> -       event_ops =3D exynos_bus_get_ops(np);
>
>         count =3D of_get_child_count(events_np);
>         desc =3D devm_kcalloc(dev, count, sizeof(*desc), GFP_KERNEL);
> @@ -523,6 +521,12 @@ static int of_get_devfreq_events(struct device_node
> *np,
>                 return -ENOMEM;
>         info->num_events =3D count;
>
> +       of_id =3D of_match_device(exynos_ppmu_id_match, dev);
> +       if (of_id)
> +               info->ppmu_type =3D (enum exynos_ppmu_type)of_id->data;
> +       else
> +               return -EINVAL;
> +
>         j =3D 0;
>         for_each_child_of_node(events_np, node) {
>                 for (i =3D 0; i < ARRAY_SIZE(ppmu_events); i++) {
> @@ -540,7 +544,15 @@ static int of_get_devfreq_events(struct device_node
> *np,
>                         continue;
>                 }
>
> -               desc[j].ops =3D event_ops;
> +               switch (info->ppmu_type) {
> +               case EXYNOS_TYPE_PPMU:
> +                       desc[j].ops =3D &exynos_ppmu_ops;
> +                       break;
> +               case EXYNOS_TYPE_PPMU_V2:
> +                       desc[j].ops =3D &exynos_ppmu_v2_ops;
> +                       break;
> +               }
> +
>                 desc[j].driver_data =3D info;
>
>                 of_property_read_string(node, "event-name", &desc[j].name=
);
> --
> 2.17.1
>
>

--000000000000750a84058c35bf17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Lukasz,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D=
"gmail_attr">2019=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=EC=88=98) 18:13, Lukasz =
Luba &lt;<a href=3D"mailto:l.luba@partner.samsung.com">l.luba@partner.samsu=
ng.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">The patch changes the way how the &#39;ops&#39; gets popu=
lated for different<br>
device versions. The matching function now uses &#39;of_device_id&#39; in o=
rder<br>
to identify the device type.<br>
<br>
Signed-off-by: Lukasz Luba &lt;<a href=3D"mailto:l.luba@partner.samsung.com=
" target=3D"_blank" rel=3D"noreferrer">l.luba@partner.samsung.com</a>&gt;<b=
r>
Signed-off-by: Chanwoo Choi &lt;<a href=3D"mailto:cw00.choi@samsung.com" ta=
rget=3D"_blank" rel=3D"noreferrer">cw00.choi@samsung.com</a>&gt;<br>
---<br>
=C2=A0drivers/devfreq/event/exynos-ppmu.c | 38 +++++++++++++++++++---------=
-<br>
=C2=A01 file changed, 25 insertions(+), 13 deletions(-)<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Acked-by: Chanwoo Choi &lt;<a href=3D"mailto:cw00.choi@samsung.co=
m">cw00.choi@samsung.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
diff --git a/drivers/devfreq/event/exynos-ppmu.c b/drivers/devfreq/event/ex=
ynos-ppmu.c<br>
index c2ea94957501..17f3c86a6f00 100644<br>
--- a/drivers/devfreq/event/exynos-ppmu.c<br>
+++ b/drivers/devfreq/event/exynos-ppmu.c<br>
@@ -16,6 +16,7 @@<br>
=C2=A0#include &lt;linux/kernel.h&gt;<br>
=C2=A0#include &lt;linux/module.h&gt;<br>
=C2=A0#include &lt;linux/of_address.h&gt;<br>
+#include &lt;linux/of_device.h&gt;<br>
=C2=A0#include &lt;linux/platform_device.h&gt;<br>
=C2=A0#include &lt;linux/regmap.h&gt;<br>
=C2=A0#include &lt;linux/suspend.h&gt;<br>
@@ -23,6 +24,11 @@<br>
<br>
=C2=A0#include &quot;exynos-ppmu.h&quot;<br>
<br>
+enum exynos_ppmu_type {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EXYNOS_TYPE_PPMU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0EXYNOS_TYPE_PPMU_V2,<br>
+};<br>
+<br>
=C2=A0struct exynos_ppmu_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk *clk;<br>
=C2=A0};<br>
@@ -36,6 +42,7 @@ struct exynos_ppmu {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regmap *regmap;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct exynos_ppmu_data ppmu;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum exynos_ppmu_type ppmu_type;<br>
=C2=A0};<br>
<br>
=C2=A0#define PPMU_EVENT(name)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -483,31 +490,23 @@ static const struct devfreq_event_ops exynos_ppmu_v2_=
ops =3D {<br>
=C2=A0static const struct of_device_id exynos_ppmu_id_match[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;samsung,exynos-ppmu&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)&=
amp;exynos_ppmu_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)E=
XYNOS_TYPE_PPMU,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }, {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .compatible =3D &qu=
ot;samsung,exynos-ppmu-v2&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)&=
amp;exynos_ppmu_v2_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D (void *)E=
XYNOS_TYPE_PPMU_V2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ },<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, exynos_ppmu_id_match);<br>
<br>
-static struct devfreq_event_ops *exynos_bus_get_ops(struct device_node *np=
)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_device_id *match;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D of_match_node(exynos_ppmu_id_match, n=
p);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return (struct devfreq_event_ops *)match-&gt;da=
ta;<br>
-}<br>
-<br>
=C2=A0static int of_get_devfreq_events(struct device_node *np,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct exynos_ppmu *info)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct devfreq_event_desc *desc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct devfreq_event_ops *event_ops;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D info-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *events_np, *node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, j, count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_device_id *of_id;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 events_np =3D of_get_child_by_name(np, &quot;ev=
ents&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!events_np) {<br>
@@ -515,7 +514,6 @@ static int of_get_devfreq_events(struct device_node *np=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;failed to get child node of devfreq-event devices\n&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0event_ops =3D exynos_bus_get_ops(np);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D of_get_child_count(events_np);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D devm_kcalloc(dev, count, sizeof(*desc)=
, GFP_KERNEL);<br>
@@ -523,6 +521,12 @@ static int of_get_devfreq_events(struct device_node *n=
p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;num_events =3D count;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_id =3D of_match_device(exynos_ppmu_id_match,=
 dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;ppmu_type =
=3D (enum exynos_ppmu_type)of_id-&gt;data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_child_of_node(events_np, node) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; ARRAY_SIZE(ppmu_events); i++) {<br>
@@ -540,7 +544,15 @@ static int of_get_devfreq_events(struct device_node *n=
p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc[j].ops =3D eve=
nt_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (info-&gt;pp=
mu_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXYNOS_TYPE_PP=
MU:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0desc[j].ops =3D &amp;exynos_ppmu_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXYNOS_TYPE_PP=
MU_V2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0desc[j].ops =3D &amp;exynos_ppmu_v2_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc[j].driver_data=
 =3D info;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_st=
ring(node, &quot;event-name&quot;, &amp;desc[j].name);<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--000000000000750a84058c35bf17--
