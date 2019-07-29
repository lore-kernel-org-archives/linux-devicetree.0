Return-Path: <SRS0=mMHK=V2=semihalf.com=jaz@kernel.org>
MIME-Version: 1.0
References: <20190627095104.22529-1-miquel.raynal@bootlin.com> <20190627095104.22529-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190627095104.22529-2-miquel.raynal@bootlin.com>
From: Grzegorz Jaszczyk <jaz@semihalf.com>
Date: Mon, 29 Jul 2019 10:06:43 +0200
Message-ID: <CAH76GKNWwwF3mg453-4K7N-zBW8EHZExcmO8EU7-bYSuA9W1DA@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] phy: mvebu-cp110-comphy: Add clocks support
Content-Type: multipart/alternative; boundary="0000000000000a5cd9058ecd60f1"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--0000000000000a5cd9058ecd60f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

czw., 27 cze 2019 o 11:51 Miquel Raynal <miquel.raynal@bootlin.com>
napisa=C5=82(a):

> +static int mvebu_comphy_init_clks(struct mvebu_comphy_priv *priv)
> +{
> +       int ret;
> +
> +       priv->mg_domain_clk =3D devm_clk_get(priv->dev, "mg_clk");
> +       if (IS_ERR(priv->mg_domain_clk))
> +               return PTR_ERR(priv->mg_domain_clk);
> +
> +       ret =3D clk_prepare_enable(priv->mg_domain_clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       priv->mg_core_clk =3D devm_clk_get(priv->dev, "mg_core_clk");
> +       if (IS_ERR(priv->mg_core_clk)) {
> +               ret =3D PTR_ERR(priv->mg_core_clk);
> +               goto dis_mg_domain_clk;
> +       }
> +
> +       ret =3D clk_prepare_enable(priv->mg_core_clk);
> +       if (ret < 0)
> +               goto dis_mg_domain_clk;
> +
> +       priv->axi_clk =3D devm_clk_get(priv->dev, "axi_clk");
> +       if (IS_ERR(priv->axi_clk)) {
> +               ret =3D PTR_ERR(priv->axi_clk);
> +               goto dis_mg_core_clk;
> +       }
> +
> +       ret =3D clk_prepare_enable(priv->axi_clk);
> +       if (ret < 0)
> +               goto dis_mg_core_clk;
> +
> +       return 0;
> +
> +dis_mg_core_clk:
> +       clk_disable_unprepare(priv->mg_core_clk);
> +
> +dis_mg_domain_clk:
> +       clk_disable_unprepare(priv->mg_domain_clk);
> +
> +       priv->mg_domain_clk =3D NULL;
> +       priv->mg_core_clk =3D NULL;
> +       priv->axi_clk =3D NULL;
> +
> +       return ret;
> +};
> +
> +static void mvebu_comphy_disable_unprepare_clks(struct mvebu_comphy_priv
> *priv)
> +{
> +       if (priv->axi_clk)
> +               clk_disable_unprepare(priv->axi_clk);
> +
> +       if (priv->mg_core_clk)
> +               clk_disable_unprepare(priv->mg_core_clk);
> +
> +       if (priv->mg_domain_clk)
> +               clk_disable_unprepare(priv->mg_domain_clk);
> +}
> +
>  static int mvebu_comphy_probe(struct platform_device *pdev)
>  {
>         struct mvebu_comphy_priv *priv;
>         struct phy_provider *provider;
>         struct device_node *child;
>         struct resource *res;
> +       int ret;
>
>         priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -607,10 +671,17 @@ static int mvebu_comphy_probe(struct platform_devic=
e
> *pdev)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>
> +       /*
> +        * Ignore error if clocks have not been initialized properly for =
DT
> +        * compatibility reasons.
> +        */
> +       ret =3D mvebu_comphy_init_clks(priv);
> +       if (ret)
> +               dev_warn(&pdev->dev, "cannot initialize clocks\n");
> +
>

Please request probe retry when clocks are not ready, e.g.:
-       if (ret)
+       if (ret) {
+               if (ret =3D=3D -EPROBE_DEFER)
+                       return ret;
                 dev_warn(&pdev->dev, "cannot initialize clocks\n");
+       }

After that you can put:
Tested-by: Grzegorz Jaszczyk <jaz@semihalf.com>

regards,
Grzegorz

--0000000000000a5cd9058ecd60f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Miquel,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">czw., 27 cze 2019 o 11:51=C2=A0=
Miquel Raynal &lt;<a href=3D"mailto:miquel.raynal@bootlin.com">miquel.rayna=
l@bootlin.com</a>&gt; napisa=C5=82(a):<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+static int mvebu_comphy_init_clks(struct mvebu_comp=
hy_priv *priv)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;mg_domain_clk =3D devm_clk_get(priv-&g=
t;dev, &quot;mg_clk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;mg_domain_clk))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv=
-&gt;mg_domain_clk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;mg_domain_c=
lk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;mg_core_clk =3D devm_clk_get(priv-&gt;=
dev, &quot;mg_core_clk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;mg_core_clk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(pri=
v-&gt;mg_core_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto dis_mg_domain_=
clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;mg_core_clk=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto dis_mg_domain_=
clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;axi_clk =3D devm_clk_get(priv-&gt;dev,=
 &quot;axi_clk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;axi_clk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(pri=
v-&gt;axi_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto dis_mg_core_cl=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;axi_clk);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto dis_mg_core_cl=
k;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+dis_mg_core_clk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;mg_core_clk);<br=
>
+<br>
+dis_mg_domain_clk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;mg_domain_clk);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;mg_domain_clk =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;mg_core_clk =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;axi_clk =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+};<br>
+<br>
+static void mvebu_comphy_disable_unprepare_clks(struct mvebu_comphy_priv *=
priv)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;axi_clk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(priv-&gt;axi_clk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;mg_core_clk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(priv-&gt;mg_core_clk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;mg_domain_clk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(priv-&gt;mg_domain_clk);<br>
+}<br>
+<br>
=C2=A0static int mvebu_comphy_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mvebu_comphy_priv *priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct phy_provider *provider;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *child;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof=
(*priv), GFP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!priv)<br>
@@ -607,10 +671,17 @@ static int mvebu_comphy_probe(struct platform_device =
*pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(priv-&gt;base))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(priv=
-&gt;base);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Ignore error if clocks have not been initial=
ized properly for DT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * compatibility reasons.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mvebu_comphy_init_clks(priv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-=
&gt;dev, &quot;cannot initialize clocks\n&quot;);<br>
+<br></blockquote><div><br></div><div>Please request probe retry when clock=
s are not ready, e.g.:</div><div>- =C2=A0 =C2=A0 =C2=A0 if (ret)<br>+ =C2=
=A0 =C2=A0 =C2=A0 if (ret) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (ret =3D=3D -EPROBE_DEFER)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-&gt;dev,=
 &quot;cannot initialize clocks\n&quot;);<br>+ =C2=A0 =C2=A0 =C2=A0 }<br></=
div><div><br></div><div>After that you can put:</div><div>Tested-by:=C2=A0G=
rzegorz Jaszczyk &lt;<a href=3D"mailto:jaz@semihalf.com">jaz@semihalf.com</=
a>&gt;</div><div>=C2=A0</div><div>regards,</div><div>Grzegorz</div></div></=
div>

--0000000000000a5cd9058ecd60f1--
