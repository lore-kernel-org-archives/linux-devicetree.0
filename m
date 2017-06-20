From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] input: sun4i-a10-lradc-keys: Add
 support for A83T
Date: Tue, 20 Jun 2017 23:39:49 +0800
Message-ID: <CAAST=9w2hjo0rDrDXf2RkzVAaYivYo6ONbcohJfUXsMaOMCn4g@mail.gmail.com>
References: <20170620134445.23097-1-techping.chan@gmail.com> <20170620134445.23097-2-techping.chan@gmail.com>
Reply-To: techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="f403043663cee4b10f0552660faf"
Return-path: <linux-sunxi+bncBCJ6PAPY4MPBBR4DUXFAKGQEAGGUVNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170620134445.23097-2-techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--f403043663cee4b10f0552660faf
Content-Type: text/plain; charset="UTF-8"

2017-06-20 21:44 GMT+08:00 Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Allwinner A83T SoC has a low res adc like the one
> in Allwinner A10 SoC, however, the A10 SoC's vref
> of lradc internally is divided by 2/3 and the A83T
> SoC's isn't, thus add a hardware variant for it to
> be compatible with various devices.
>
> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 39
> +++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c
> b/drivers/input/keyboard/sun4i-lradc-keys.c
> index a37c172452e6..3cd981138efc 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -46,6 +46,7 @@
>  #define CONTINUE_TIME_SEL(x)   ((x) << 16) /* 4 bits */
>  #define KEY_MODE_SEL(x)                ((x) << 12) /* 2 bits */
>  #define LEVELA_B_CNT(x)                ((x) << 8)  /* 4 bits */
> +#define HOLD_KEY_EN(x)         ((x) << 7)
>  #define HOLD_EN(x)             ((x) << 6)
>  #define LEVELB_VOL(x)          ((x) << 4)  /* 2 bits */
>  #define SAMPLE_RATE(x)         ((x) << 2)  /* 2 bits */
> @@ -63,6 +64,25 @@
>  #define        CHAN0_KEYDOWN_IRQ       BIT(1)
>  #define CHAN0_DATA_IRQ         BIT(0)
>
> +/* struct lradc_variant - Describe sun4i-a10-lradc-keys hardware variant
> + * @divisor_numerator:         The numerator of lradc Vref internally
> divisor
> + * @divisor_denominator:       The denominator of lradc Vref internally
> divisor
> + */
> +struct lradc_variant {
> +       u8 divisor_numerator;
> +       u8 divisor_denominator;
> +};
> +
> +static const struct lradc_variant lradc_variant_a10 = {
> +       .divisor_numerator = 2,
> +       .divisor_denominator = 3
> +};
> +
> +static const struct lradc_variant r_lradc_variant_a83t = {
> +       .divisor_numerator = 1,
> +       .divisor_denominator = 1
> +};
> +
>  struct sun4i_lradc_keymap {
>         u32 voltage;
>         u32 keycode;
> @@ -74,6 +94,7 @@ struct sun4i_lradc_data {
>         void __iomem *base;
>         struct regulator *vref_supply;
>         struct sun4i_lradc_keymap *chan0_map;
> +       const struct lradc_variant *variant;
>         u32 chan0_map_count;
>         u32 chan0_keycode;
>         u32 vref;
> @@ -99,6 +120,7 @@ static irqreturn_t sun4i_lradc_irq(int irq, void
> *dev_id)
>         if ((ints & CHAN0_KEYDOWN_IRQ) && lradc->chan0_keycode == 0) {
>                 val = readl(lradc->base + LRADC_DATA0) & 0x3f;
>                 voltage = val * lradc->vref / 63;
> +               printk("voltage %d\n", voltage);
>

Oh.....sorry, this is excess....

>
>                 for (i = 0; i < lradc->chan0_map_count; i++) {
>                         diff = abs(lradc->chan0_map[i].voltage - voltage);
> @@ -128,9 +150,9 @@ static int sun4i_lradc_open(struct input_dev *dev)
>         if (error)
>                 return error;
>
> -       /* lradc Vref internally is divided by 2/3 */
> -       lradc->vref = regulator_get_voltage(lradc->vref_supply) * 2 / 3;
> -
> +       lradc->vref = regulator_get_voltage(lradc->vref_supply) *
> +                     lradc->variant->divisor_numerator /
> +                     lradc->variant->divisor_denominator;
>         /*
>          * Set sample time to 4 ms / 250 Hz. Wait 2 * 4 ms for key to
>          * stabilize on press, wait (1 + 1) * 4 ms for key release
> @@ -222,6 +244,12 @@ static int sun4i_lradc_probe(struct platform_device
> *pdev)
>         if (error)
>                 return error;
>
> +       lradc->variant = of_device_get_match_data(&pdev->dev);
> +       if (!lradc->variant) {
> +               dev_err(&pdev->dev, "Missing sun4i-a10-lradc-keys
> variant\n");
> +               return -EINVAL;
> +       }
> +
>         lradc->vref_supply = devm_regulator_get(dev, "vref");
>         if (IS_ERR(lradc->vref_supply))
>                 return PTR_ERR(lradc->vref_supply);
> @@ -265,7 +293,10 @@ static int sun4i_lradc_probe(struct platform_device
> *pdev)
>  }
>
>  static const struct of_device_id sun4i_lradc_of_match[] = {
> -       { .compatible = "allwinner,sun4i-a10-lradc-keys", },
> +       { .compatible = "allwinner,sun4i-a10-lradc-keys",
> +               .data = &lradc_variant_a10 },
> +       { .compatible = "allwinner,sun8i-a83t-r-lradc-keys",
> +               .data = &r_lradc_variant_a83t },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
> --
> 2.11.0
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--f403043663cee4b10f0552660faf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-06-20 21:44 GMT+08:00 Ziping Chen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Ziping Chen &lt;<a href=3D"mailto:techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">techping.chan@gm=
ail.com</a>&gt;<br>
<br>
Allwinner A83T SoC has a low res adc like the one<br>
in Allwinner A10 SoC, however, the A10 SoC&#39;s vref<br>
of lradc internally is divided by 2/3 and the A83T<br>
SoC&#39;s isn&#39;t, thus add a hardware variant for it to<br>
be compatible with various devices.<br>
<br>
Signed-off-by: Ziping Chen &lt;<a href=3D"mailto:techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">t=
echping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0drivers/input/keyboard/sun4i-<wbr>lradc-keys.c | 39 +++++++++++++++++=
++++++++++---<wbr>-<br>
=C2=A01 file changed, 35 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/input/keyboard/<wbr>sun4i-lradc-keys.c b/drivers/input=
/keyboard/<wbr>sun4i-lradc-keys.c<br>
index a37c172452e6..3cd981138efc 100644<br>
--- a/drivers/input/keyboard/<wbr>sun4i-lradc-keys.c<br>
+++ b/drivers/input/keyboard/<wbr>sun4i-lradc-keys.c<br>
@@ -46,6 +46,7 @@<br>
=C2=A0#define CONTINUE_TIME_SEL(x)=C2=A0 =C2=A0((x) &lt;&lt; 16) /* 4 bits =
*/<br>
=C2=A0#define KEY_MODE_SEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ((x) &lt;&lt; 12) /* 2 bits */<br>
=C2=A0#define LEVELA_B_CNT(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ((x) &lt;&lt; 8)=C2=A0 /* 4 bits */<br>
+#define HOLD_KEY_EN(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((x) &lt;&lt; 7)<b=
r>
=C2=A0#define HOLD_EN(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((x=
) &lt;&lt; 6)<br>
=C2=A0#define LEVELB_VOL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &lt;&lt;=
 4)=C2=A0 /* 2 bits */<br>
=C2=A0#define SAMPLE_RATE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((x) &lt;&lt;=
 2)=C2=A0 /* 2 bits */<br>
@@ -63,6 +64,25 @@<br>
=C2=A0#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHAN0_KEYDOWN_IRQ=C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(1)<br>
=C2=A0#define CHAN0_DATA_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
<br>
+/* struct lradc_variant - Describe sun4i-a10-lradc-keys hardware variant<b=
r>
+ * @divisor_numerator:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The numerator of l=
radc Vref internally divisor<br>
+ * @divisor_denominator:=C2=A0 =C2=A0 =C2=A0 =C2=A0The denominator of lrad=
c Vref internally divisor<br>
+ */<br>
+struct lradc_variant {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 divisor_numerator;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 divisor_denominator;<br>
+};<br>
+<br>
+static const struct lradc_variant lradc_variant_a10 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.divisor_numerator =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.divisor_denominator =3D 3<br>
+};<br>
+<br>
+static const struct lradc_variant r_lradc_variant_a83t =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.divisor_numerator =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.divisor_denominator =3D 1<br>
+};<br>
+<br>
=C2=A0struct sun4i_lradc_keymap {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 voltage;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 keycode;<br>
@@ -74,6 +94,7 @@ struct sun4i_lradc_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regulator *vref_supply;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sun4i_lradc_keymap *chan0_map;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct lradc_variant *variant;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 chan0_map_count;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 chan0_keycode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 vref;<br>
@@ -99,6 +120,7 @@ static irqreturn_t sun4i_lradc_irq(int irq, void *dev_id=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ints &amp; CHAN0_KEYDOWN_IRQ) &amp;&amp; l=
radc-&gt;chan0_keycode =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D readl(lradc=
-&gt;base + LRADC_DATA0) &amp; 0x3f;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage =3D val * l=
radc-&gt;vref / 63;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(&quot;voltag=
e %d\n&quot;, voltage);<br></blockquote><div><br></div><div>Oh.....sorry, t=
his is excess....=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; lradc-&gt;chan0_map_count; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 diff =3D abs(lradc-&gt;chan0_map[i].<wbr>voltage - voltage);<br>
@@ -128,9 +150,9 @@ static int sun4i_lradc_open(struct input_dev *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return error;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* lradc Vref internally is divided by 2/3 */<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lradc-&gt;vref =3D regulator_get_voltage(lradc-=
&gt;<wbr>vref_supply) * 2 / 3;<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lradc-&gt;vref =3D regulator_get_voltage(lradc-=
&gt;<wbr>vref_supply) *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lradc-&gt;variant-&gt;divisor_<wbr>numerator /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lradc-&gt;variant-&gt;divisor_<wbr>denominator;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Set sample time to 4 ms / 250 Hz. Wait =
2 * 4 ms for key to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* stabilize on press, wait (1 + 1) * 4 ms=
 for key release<br>
@@ -222,6 +244,12 @@ static int sun4i_lradc_probe(struct platform_device *p=
dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return error;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lradc-&gt;variant =3D of_device_get_match_data(=
&amp;<wbr>pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lradc-&gt;variant) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;Missing sun4i-a10-lradc-keys variant\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lradc-&gt;vref_supply =3D devm_regulator_get(de=
v, &quot;vref&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(lradc-&gt;vref_supply))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(lrad=
c-&gt;vref_supply);<br>
@@ -265,7 +293,10 @@ static int sun4i_lradc_probe(struct platform_device *p=
dev)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct of_device_id sun4i_lradc_of_match[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;allwinner,sun4i-a10-lra=
dc-<wbr>keys&quot;, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;allwinner,sun4i-a10-lra=
dc-<wbr>keys&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;lrad=
c_variant_a10 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;allwinner,sun8i-a83t-r-=
lradc-<wbr>keys&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;r_lr=
adc_variant_a83t },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--f403043663cee4b10f0552660faf--
