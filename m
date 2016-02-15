Return-Path: <kdasu.kdev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
Date: Mon, 15 Feb 2016 16:28:28 -0500
Message-ID: <CAC=U0a10yqw_J3MGXDn=-Sekw94f+32tD80e2q0k3359RRhCpg@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
From: Kamal Dasu <kdasu.kdev@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bae4622a946ab052bd5b2cd
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7bae4622a946ab052bd5b2cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 1:11 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:

> This allows specifying algorithm used for NAND ECC. There are two
> available values: "bch" and "hamming". It's important as having just
> ECC parameters (step, strength) isn't enough to determine algorithm,
> e.g. you can't distinct BCH-1 and Hamming.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>

 Reviewed-by: Kamal Dasu <kdasu.kdev@gmail.com>

Thanks Rafal
>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++
>  drivers/of/of_mtd.c                            | 33
> ++++++++++++++++++++++++++
>  include/linux/mtd/nand.h                       |  5 ++++
>  include/linux/of_mtd.h                         |  6 +++++
>  4 files changed, 47 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt
> b/Documentation/devicetree/bindings/mtd/nand.txt
> index b53f92e..a2c2df5 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,6 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome",
> "hw_oob_first",
>    "soft_bch".
> +- nand-ecc-algo : string, algorithm of NAND ecc.
> +                 Supported values are: "bch", "hamming". The default one
> is
> +                 "bch".
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not presen=
t
> false
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed..f2a6630 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -50,6 +50,39 @@ int of_get_nand_ecc_mode(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
>
>  /**
> + * It maps 'enum nand_ecc_algo' found in include/linux/mtd/nand.h into t=
he
> + * device tree binding of 'nand-ecc-algo'.
> + */
> +static const char * const nand_ecc_algos[] =3D {
> +       [NAND_ECC_BCH]          =3D "bch",
> +       [NAND_ECC_HAMMING]      =3D "hamming",
> +};
> +
> +/**
> + * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_node
> + * @np:        Pointer to the given device_node
> + *
> + * The function gets ecc algorithm string from property 'nand-ecc-algo'
> and
> + * returns its index in nand_ecc_algos table, or errno in error case.
> + */
> +int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       const char *pm;
> +       int err, i;
> +
> +       err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
> +       if (err < 0)
> +               return err;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
> +               if (!strcasecmp(pm, nand_ecc_algos[i]))
> +                       return i;
> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);
> +
> +/**
>   * of_get_nand_ecc_step_size - Get ECC step size associated to
>   * the required ECC strength (see below).
>   * @np:        Pointer to the given device_node
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7604f4b..25854d2 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -119,6 +119,11 @@ typedef enum {
>         NAND_ECC_SOFT_BCH,
>  } nand_ecc_modes_t;
>
> +enum nand_ecc_algo {
> +       NAND_ECC_BCH,
> +       NAND_ECC_HAMMING,
> +};
> +
>  /*
>   * Constants for Hardware ECC
>   */
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index e266caa..0f6aca5 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -13,6 +13,7 @@
>
>  #include <linux/of.h>
>  int of_get_nand_ecc_mode(struct device_node *np);
> +int of_get_nand_ecc_algo(struct device_node *np);
>  int of_get_nand_ecc_step_size(struct device_node *np);
>  int of_get_nand_ecc_strength(struct device_node *np);
>  int of_get_nand_bus_width(struct device_node *np);
> @@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct
> device_node *np)
>         return -ENOSYS;
>  }
>
> +static inline int of_get_nand_ecc_algo(struct device_node *np)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_get_nand_ecc_step_size(struct device_node *np)
>  {
>         return -ENOSYS;
> --
> 1.8.4.5
>
>

--047d7bae4622a946ab052bd5b2cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Feb 12, 2016 at 1:11 PM, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"ltr">&lt;=
<a href=3D"mailto:zajec5@gmail.com" target=3D"_blank">zajec5@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">This allows specifying algorithm used=
 for NAND ECC. There are two<br>
available values: &quot;bch&quot; and &quot;hamming&quot;. It&#39;s importa=
nt as having just<br>
ECC parameters (step, strength) isn&#39;t enough to determine algorithm,<br=
>
e.g. you can&#39;t distinct BCH-1 and Hamming.<br>
<br>
Signed-off-by: Rafa=C5=82 Mi=C5=82ecki &lt;<a href=3D"mailto:zajec5@gmail.c=
om" target=3D"_blank">zajec5@gmail.com</a>&gt;<br></blockquote><div><br></d=
iv><div>=C2=A0<span class=3D"" style=3D"font-size:12.8px">Reviewed</span><s=
pan style=3D"font-size:12.8px">-</span><span class=3D"" style=3D"font-size:=
12.8px">by</span><span style=3D"font-size:12.8px">:=C2=A0</span><span style=
=3D"color:rgb(80,0,80);font-size:12.8px">Kamal Dasu &lt;</span><a href=3D"m=
ailto:kdasu.kdev@gmail.com" style=3D"font-size:12.8px">kdasu.kdev@gmail.com=
</a><span style=3D"color:rgb(80,0,80);font-size:12.8px">&gt;</span></div><s=
pan class=3D"im" style=3D"font-size:12.8px"></span><br style=3D"font-size:1=
2.8px"><span style=3D"font-size:12.8px">Thanks Rafal</span><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"=
>
---<br>
=C2=A0Documentation/devicetree/bindings/mtd/nand.txt |=C2=A0 3 +++<br>
=C2=A0drivers/of/of_mtd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 33 +++++++++++++++++++++=
+++++<br>
=C2=A0include/linux/mtd/nand.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++<br>
=C2=A0include/linux/of_mtd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++<br>
=C2=A04 files changed, 47 insertions(+)<br>
<br>
diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation=
/devicetree/bindings/mtd/nand.txt<br>
index b53f92e..a2c2df5 100644<br>
--- a/Documentation/devicetree/bindings/mtd/nand.txt<br>
+++ b/Documentation/devicetree/bindings/mtd/nand.txt<br>
@@ -3,6 +3,9 @@<br>
=C2=A0- nand-ecc-mode : String, operation mode of the NAND ecc mode.<br>
=C2=A0 =C2=A0Supported values are: &quot;none&quot;, &quot;soft&quot;, &quo=
t;hw&quot;, &quot;hw_syndrome&quot;, &quot;hw_oob_first&quot;,<br>
=C2=A0 =C2=A0&quot;soft_bch&quot;.<br>
+- nand-ecc-algo : string, algorithm of NAND ecc.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Supported va=
lues are: &quot;bch&quot;, &quot;hamming&quot;. The default one is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bch&qu=
ot;.<br>
=C2=A0- nand-bus-width : 8 or 16 bus width if not present 8<br>
=C2=A0- nand-on-flash-bbt: boolean to enable on flash bbt option if not pre=
sent false<br>
<br>
diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c<br>
index b7361ed..f2a6630 100644<br>
--- a/drivers/of/of_mtd.c<br>
+++ b/drivers/of/of_mtd.c<br>
@@ -50,6 +50,39 @@ int of_get_nand_ecc_mode(struct device_node *np)<br>
=C2=A0EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);<br>
<br>
=C2=A0/**<br>
+ * It maps &#39;enum nand_ecc_algo&#39; found in include/linux/mtd/nand.h =
into the<br>
+ * device tree binding of &#39;nand-ecc-algo&#39;.<br>
+ */<br>
+static const char * const nand_ecc_algos[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[NAND_ECC_BCH]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;bch&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[NAND_ECC_HAMMING]=C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;hamming&quot;,<br>
+};<br>
+<br>
+/**<br>
+ * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_node<br>
+ * @np:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pointer to the given device_node<br>
+ *<br>
+ * The function gets ecc algorithm string from property &#39;nand-ecc-algo=
&#39; and<br>
+ * returns its index in nand_ecc_algos table, or errno in error case.<br>
+ */<br>
+int of_get_nand_ecc_algo(struct device_node *np)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *pm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_string(np, &quot;nand-=
ecc-algo&quot;, &amp;pm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(nand_ecc_algos)=
; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcasecmp(pm,=
 nand_ecc_algos[i]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+}<br>
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);<br>
+<br>
+/**<br>
=C2=A0 * of_get_nand_ecc_step_size - Get ECC step size associated to<br>
=C2=A0 * the required ECC strength (see below).<br>
=C2=A0 * @np:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pointer to the given device_node<b=
r>
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h<br>
index 7604f4b..25854d2 100644<br>
--- a/include/linux/mtd/nand.h<br>
+++ b/include/linux/mtd/nand.h<br>
@@ -119,6 +119,11 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NAND_ECC_SOFT_BCH,<br>
=C2=A0} nand_ecc_modes_t;<br>
<br>
+enum nand_ecc_algo {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NAND_ECC_BCH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NAND_ECC_HAMMING,<br>
+};<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Constants for Hardware ECC<br>
=C2=A0 */<br>
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h<br>
index e266caa..0f6aca5 100644<br>
--- a/include/linux/of_mtd.h<br>
+++ b/include/linux/of_mtd.h<br>
@@ -13,6 +13,7 @@<br>
<br>
=C2=A0#include &lt;linux/of.h&gt;<br>
=C2=A0int of_get_nand_ecc_mode(struct device_node *np);<br>
+int of_get_nand_ecc_algo(struct device_node *np);<br>
=C2=A0int of_get_nand_ecc_step_size(struct device_node *np);<br>
=C2=A0int of_get_nand_ecc_strength(struct device_node *np);<br>
=C2=A0int of_get_nand_bus_width(struct device_node *np);<br>
@@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct device_nod=
e *np)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
=C2=A0}<br>
<br>
+static inline int of_get_nand_ecc_algo(struct device_node *np)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
+}<br>
+<br>
=C2=A0static inline int of_get_nand_ecc_step_size(struct device_node *np)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
<span><font color=3D"#888888">--<br>
1.8.4.5<br>
<br>
</font></span></blockquote></div><br></div></div>

--047d7bae4622a946ab052bd5b2cd--
