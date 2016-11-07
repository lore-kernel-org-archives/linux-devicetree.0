Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1478523943-23142-4-git-send-email-gabriel.fernandez@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com> <1478523943-23142-4-git-send-email-gabriel.fernandez@st.com>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Mon, 7 Nov 2016 14:48:15 +0100
Message-ID: <CAFvLkMTM_g8UbCbNTs6_bVoCOgYucpvqABhyPZ77takmuOX13g@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: stm32f4: Add post divisor for I2S & SAI PLLs and
 Add lcd-tft clock
Content-Type: multipart/alternative; boundary=94eb2c0d90589be52f0540b64687
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <daniel.thompson@linaro.org>, Andrea Merello <andrea.merello@gmail.com>, devicetree@vger.kernel.org, amelie.delaunay@st.com, kernel@stlinux.com, olivier.bideau@st.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c0d90589be52f0540b64687
Content-Type: text/plain; charset=UTF-8

Wouldn't it be good to connect ltdc gate clock with lcd-tft clock to enable
the whole LCD clock chain in once ?

2016-11-07 14:05 GMT+01:00 <gabriel.fernandez@st.com>:

> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This patch adds post dividers of I2S & SAI PLLs.
> These dividers are managed by a dedicated register (RCC_DCKCFGR).
> The PLL should be off before a set rate.
> This patch also introduces the lcd-tft clock.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  drivers/clk/clk-stm32f4.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index dda15bc..5fa5d51 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -215,6 +215,7 @@ struct stm32f4_gate_data {
>  enum {
>         SYSTICK, FCLK, CLK_LSI, CLK_LSE, CLK_HSE_RTC, CLK_RTC,
>         PLL_VCO_I2S, PLL_VCO_SAI,
> +       CLK_LCD,
>         END_PRIMARY_CLK
>  };
>
> @@ -599,6 +600,9 @@ static struct clk_hw *clk_register_pll_div(const char
> *name,
>  static const struct clk_div_table pll_divp_table[] = {
>         { 0, 2 }, { 1, 4 }, { 2, 6 }, { 3, 8 },
>  };
> +static const struct clk_div_table pll_lcd_div_table[] = {
> +       { 0, 2 }, { 1, 4 }, { 2, 8 }, { 3, 16 },
> +};
>
>  /*
>   * Decode current PLL state and (statically) model the state we inherit
> from
> @@ -659,16 +663,35 @@ static struct clk_hw *stm32f4_rcc_register_pll(const
> char *pllsrc,
>                 clk_register_pll_div(data->p_name, data->vco_name, 0, reg,
>                                 16, 2, 0, pll_divp_table, pll_hw, lock);
>
> -       if (data->q_name)
> +       if (data->q_name) {
>                 clk_register_pll_div(data->q_name, data->vco_name, 0, reg,
>                                 24, 4, CLK_DIVIDER_ONE_BASED, NULL,
>                                 pll_hw, lock);
>
> -       if (data->r_name)
> +               if (data->pll_num == PLL_I2S)
> +                       clk_register_pll_div("plli2s-q-div", data->q_name,
> +                               0, base + STM32F4_RCC_DCKCFGR,
> +                               0, 5, 0, NULL, pll_hw, &stm32f4_clk_lock);
> +
> +               if (data->pll_num == PLL_SAI)
> +                       clk_register_pll_div("pllsai-q-div", data->q_name,
> +                               0, base + STM32F4_RCC_DCKCFGR,
> +                               8, 5, 0, NULL, pll_hw, &stm32f4_clk_lock);
> +       }
> +
> +       if (data->r_name) {
>                 clk_register_pll_div(data->r_name, data->vco_name, 0, reg,
>                                 28, 3, CLK_DIVIDER_ONE_BASED, NULL,
> pll_hw,
>                                 lock);
>
> +               if (data->pll_num == PLL_SAI)
> +                       clks[CLK_LCD] = clk_register_pll_div("lcd-tft",
> +                                       data->r_name, CLK_SET_RATE_PARENT,
> +                                       base + STM32F4_RCC_DCKCFGR, 16, 2,
> 0,
> +                                       pll_lcd_div_table, pll_hw,
> +                                       &stm32f4_clk_lock);
> +       }
> +
>         return pll_hw;
>  }
>
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--94eb2c0d90589be52f0540b64687
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wouldn&#39;t it be good to connect ltdc gate clock with lc=
d-tft clock to enable the whole LCD clock chain in once ?=C2=A0</div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-11-07 14:05 GMT+01=
:00  <span dir=3D"ltr">&lt;<a href=3D"mailto:gabriel.fernandez@st.com" targ=
et=3D"_blank">gabriel.fernandez@st.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernand=
ez@st.com">gabriel.fernandez@st.com</a>&gt;<br>
<br>
This patch adds post dividers of I2S &amp; SAI PLLs.<br>
These dividers are managed by a dedicated register (RCC_DCKCFGR).<br>
The PLL should be off before a set rate.<br>
This patch also introduces the lcd-tft clock.<br>
<br>
Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernandez@st=
.com">gabriel.fernandez@st.com</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk-stm32f4.c | 27 +++++++++++++++++++++++++--<br>
=C2=A01 file changed, 25 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c<br>
index dda15bc..5fa5d51 100644<br>
--- a/drivers/clk/clk-stm32f4.c<br>
+++ b/drivers/clk/clk-stm32f4.c<br>
@@ -215,6 +215,7 @@ struct stm32f4_gate_data {<br>
=C2=A0enum {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTICK, FCLK, CLK_LSI, CLK_LSE, CLK_HSE_RTC, C=
LK_RTC,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PLL_VCO_I2S, PLL_VCO_SAI,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_LCD,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 END_PRIMARY_CLK<br>
=C2=A0};<br>
<br>
@@ -599,6 +600,9 @@ static struct clk_hw *clk_register_pll_div(const char *=
name,<br>
=C2=A0static const struct clk_div_table pll_divp_table[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0, 2 }, { 1, 4 }, { 2, 6 }, { 3, 8 },<br>
=C2=A0};<br>
+static const struct clk_div_table pll_lcd_div_table[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0, 2 }, { 1, 4 }, { 2, 8 }, { 3, 16 },<br>
+};<br>
<br>
=C2=A0/*<br>
=C2=A0 * Decode current PLL state and (statically) model the state we inher=
it from<br>
@@ -659,16 +663,35 @@ static struct clk_hw *stm32f4_rcc_register_pll(<wbr>c=
onst char *pllsrc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_pll_di=
v(data-&gt;p_<wbr>name, data-&gt;vco_name, 0, reg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16, 2, 0, pll_divp_table, pll_hw, lo=
ck);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;q_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;q_name) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_pll_di=
v(data-&gt;q_<wbr>name, data-&gt;vco_name, 0, reg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24, 4, CLK_DIVIDER_ONE_BASED, NULL,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pll_hw, lock);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;r_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;pll_nu=
m =3D=3D PLL_I2S)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk_register_pll_div(&quot;plli2s-<wbr>q-div&quot;, data-&gt;q_na=
me,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, base + STM32F4_RCC_DCKCFGR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 5, 0, NULL, pll_hw, &amp;stm32f4_c=
lk_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;pll_nu=
m =3D=3D PLL_SAI)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk_register_pll_div(&quot;pllsai-<wbr>q-div&quot;, data-&gt;q_na=
me,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, base + STM32F4_RCC_DCKCFGR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08, 5, 0, NULL, pll_hw, &amp;stm32f4_c=
lk_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;r_name) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_pll_di=
v(data-&gt;r_<wbr>name, data-&gt;vco_name, 0, reg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 28, 3, CLK_DIVIDER_ONE_BASED, NULL,=
=C2=A0 pll_hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;pll_nu=
m =3D=3D PLL_SAI)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clks[CLK_LCD] =3D clk_register_pll_div(&quot;lcd-tft&quot;<wbr>,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;=
r_name, CLK_SET_RATE_PARENT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base + ST=
M32F4_RCC_DCKCFGR, 16, 2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_lcd_d=
iv_table, pll_hw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;stm3=
2f4_clk_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pll_hw;<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.<wbr>infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/<wbr>mailman/=
listinfo/linux-arm-<wbr>kernel</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0d90589be52f0540b64687--
