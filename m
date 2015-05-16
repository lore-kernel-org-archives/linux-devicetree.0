From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 03/10] clk: sunxi: Let divs clocks read
 the base factor clock name from devicetree
Date: Sat, 16 May 2015 10:10:07 +0800
Message-ID: <CAGb2v64y8+bdya3N=gK-YEie3A9nVM5nuxRZTVPXYSaN6WzPoQ@mail.gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
	<1431707940-19372-4-git-send-email-jenskuske@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11c2fd9ebc40e305162975a5
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBWO3KVAKGQEVWIT6XY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431707940-19372-4-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: VishnuPatekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--001a11c2fd9ebc40e305162975a5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2015=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8A=E5=8D=8812:39=E6=96=BC "Jens K=
uske" <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Currently, the sunxi clock driver gets the name for the base factor clock
> of divs clocks from the name field in factors_data. This prevents reusing
> of the factor clock for clocks with same properties, but different name.
>
> This commit makes the divs setup function try to get a name from
> clock-output-names in the devicetree. It also removes the name field wher=
e
> possible and merges the sun4i PLL5 and PLL6 clocks.
>
> The sun4i PLL5 clock doesn't have a output for the base factor clock,
> so we still have to use the name field there.
>
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/clk/sunxi/clk-sunxi.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.=
c
> index 17cba4d..afe560c 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -708,18 +708,10 @@ static const struct factors_data sun4i_pll5_data
__initconst =3D {
>         .name =3D "pll5",
>  };
>
> -static const struct factors_data sun4i_pll6_data __initconst =3D {
> -       .enable =3D 31,
> -       .table =3D &sun4i_pll5_config,
> -       .getter =3D sun4i_get_pll5_factors,
> -       .name =3D "pll6",
> -};
> -
>  static const struct factors_data sun6i_a31_pll6_data __initconst =3D {
>         .enable =3D 31,
>         .table =3D &sun6i_a31_pll6_config,
>         .getter =3D sun6i_a31_get_pll6_factors,
> -       .name =3D "pll6x2",
>  };
>
>  static const struct factors_data sun5i_a13_ahb_data __initconst =3D {
> @@ -1099,7 +1091,7 @@ static const struct divs_data pll5_divs_data
__initconst =3D {
>  };
>
>  static const struct divs_data pll6_divs_data __initconst =3D {
> -       .factors =3D &sun4i_pll6_data,
> +       .factors =3D &sun4i_pll5_data,
>         .ndivs =3D 4,
>         .div =3D {
>                 { .shift =3D 0, .table =3D pll6_sata_tbl, .gate =3D 14 },=
 /* M,
SATA */
> @@ -1141,6 +1133,7 @@ static void __init sunxi_divs_clk_setup(struct
device_node *node,
>         struct clk_gate *gate =3D NULL;
>         struct clk_fixed_factor *fix_factor;
>         struct clk_divider *divider;
> +       struct factors_data factors =3D *data->factors;
>         void __iomem *reg;
>         int ndivs =3D SUNXI_DIVS_MAX_QTY, i =3D 0;
>         int flags, clkflags;
> @@ -1149,8 +1142,17 @@ static void __init sunxi_divs_clk_setup(struct
device_node *node,
>         if (data->ndivs)
>                 ndivs =3D data->ndivs;
>
> +       /* Try to find a name for base factor clock */
> +       for (i =3D 0; i < ndivs; i++) {
> +               if (data->div[i].self) {
> +                       of_property_read_string_index(node,
"clock-output-names",
> +                                                     i, &factors.name);

Please excuse the bad formatting.
I'm at the airport without my laptop.

This will not work. All the static factors_data structs are const.
You should make a copy of it, maybe on the stack,
update the .name field, and pass that to sunxi_factors_clk_setup().

ChenYu

> +                       break;
> +               }
> +       }
> +
>         /* Set up factor clock that we will be dividing */
> -       pclk =3D sunxi_factors_clk_setup(node, data->factors);
> +       pclk =3D sunxi_factors_clk_setup(node, &factors);
>         parent =3D __clk_get_name(pclk);
>
>         reg =3D of_iomap(node, 0);
> --
> 2.4.0
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--001a11c2fd9ebc40e305162975a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
2015=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8A=E5=8D=8812:39=E6=96=BC &quot;J=
ens Kuske&quot; &lt;<a href=3D"mailto:jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">jenskuske@gmail.=
com</a>&gt;=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; Currently, the sunxi clock driver gets the name for the base factor cl=
ock<br>
&gt; of divs clocks from the name field in factors_data. This prevents reus=
ing<br>
&gt; of the factor clock for clocks with same properties, but different nam=
e.<br>
&gt;<br>
&gt; This commit makes the divs setup function try to get a name from<br>
&gt; clock-output-names in the devicetree. It also removes the name field w=
here<br>
&gt; possible and merges the sun4i PLL5 and PLL6 clocks.<br>
&gt;<br>
&gt; The sun4i PLL5 clock doesn&#39;t have a output for the base factor clo=
ck,<br>
&gt; so we still have to use the name field there.<br>
&gt;<br>
&gt; Signed-off-by: Jens Kuske &lt;<a href=3D"mailto:jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">j=
enskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/clk/sunxi/clk-sunxi.c | 22 ++++++++++++----------<br>
&gt; =C2=A01 file changed, 12 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sun=
xi.c<br>
&gt; index 17cba4d..afe560c 100644<br>
&gt; --- a/drivers/clk/sunxi/clk-sunxi.c<br>
&gt; +++ b/drivers/clk/sunxi/clk-sunxi.c<br>
&gt; @@ -708,18 +708,10 @@ static const struct factors_data sun4i_pll5_data=
 __initconst =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll5&quot;,<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; -static const struct factors_data sun4i_pll6_data __initconst =3D {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D 31,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.table =3D &amp;sun4i_pll5_config,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.getter =3D sun4i_get_pll5_factors,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;pll6&quot;,<br>
&gt; -};<br>
&gt; -<br>
&gt; =C2=A0static const struct factors_data sun6i_a31_pll6_data __initconst=
 =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =3D 31,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .table =3D &amp;sun6i_a31_pll6_config,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .getter =3D sun6i_a31_get_pll6_factors,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;pll6x2&quot;,<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; =C2=A0static const struct factors_data sun5i_a13_ahb_data __initconst =
=3D {<br>
&gt; @@ -1099,7 +1091,7 @@ static const struct divs_data pll5_divs_data __i=
nitconst =3D {<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; =C2=A0static const struct divs_data pll6_divs_data __initconst =3D {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.factors =3D &amp;sun4i_pll6_data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.factors =3D &amp;sun4i_pll5_data,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ndivs =3D 4,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 .div =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .shift =3D 0=
, .table =3D pll6_sata_tbl, .gate =3D 14 }, /* M, SATA */<br>
&gt; @@ -1141,6 +1133,7 @@ static void __init sunxi_divs_clk_setup(struct d=
evice_node *node,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_gate *gate =3D NULL;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_fixed_factor *fix_factor;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_divider *divider;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct factors_data factors =3D *data-&gt;=
factors;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *reg;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ndivs =3D SUNXI_DIVS_MAX_QTY, i =3D 0;=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int flags, clkflags;<br>
&gt; @@ -1149,8 +1142,17 @@ static void __init sunxi_divs_clk_setup(struct =
device_node *node,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data-&gt;ndivs)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndivs =3D data=
-&gt;ndivs;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to find a name for base factor cloc=
k */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ndivs; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;d=
iv[i].self) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0of_property_read_string_index(node, &quot;clock-output-names&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, &amp;<a href=3D"http://fact=
ors.name">factors.name</a>);</p>
<p dir=3D"ltr">Please excuse the bad formatting.<br>
I&#39;m at the airport without my laptop.</p>
<p dir=3D"ltr">This will not work. All the static factors_data structs are =
const.<br>
You should make a copy of it, maybe on the stack,<br>
update the .name field, and pass that to sunxi_factors_clk_setup().</p>
<p dir=3D"ltr">ChenYu</p>
<p dir=3D"ltr">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Set up factor clock that we will be div=
iding */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pclk =3D sunxi_factors_clk_setup(node, dat=
a-&gt;factors);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pclk =3D sunxi_factors_clk_setup(node, &am=
p;factors);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent =3D __clk_get_name(pclk);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D of_iomap(node, 0);<br>
&gt; --<br>
&gt; 2.4.0<br>
&gt;<br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--001a11c2fd9ebc40e305162975a5--
