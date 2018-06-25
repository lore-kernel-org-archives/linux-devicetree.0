From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Mon, 25 Jun 2018 16:46:24 -0700
Message-ID: <152997038474.143105.3390705878521933864@swboyd.mtv.corp.google.com>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <20180613130338.GH20078@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180613130338.GH20078@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Quoting Matti Vaittinen (2018-06-13 06:03:38)
> On Tue, Jun 12, 2018 at 11:23:54AM +0300, Matti Vaittinen wrote:
> > =

> > I see. This makes sense. I need to verify from HW colleagues whether
> > this chip has internal oscillator or not. I originally thought we have
> > on-chip oscillator - but as you say, we do have XIN pin in documentatio=
n.
> > So now I am not sure if the test board I have contains oscillator drivi=
ng
> > the clk on PMIC - or if the PMIC has internal oscillator. I'll clarify =
this.
> =

> It really turned out that the PMIC just acts as a clock buffer. So I do
> as you suggested and add lookup for parent clock to the driver. I
> planned to do it so that if no parent is found from DT - then we assume
> the 32.768KHz clock (as described in documentation). Eg, something along
> the lines:
> =

>         init.parent_names =3D of_clk_get_parent_name(pdev->dev.parent->of=
_node, 0);
>         if (init.parent_names) {
>                 init.num_parents =3D 1;
>         } else {
>                 /* If parent is not given from DT we assume the typical u=
se-case with
>                  * 32.768 KHz oscillator for RTC (Maybe we could just err=
or out here?)
>                  */
>                 c->rate =3D BD71837_CLK_RATE;
>                 bd71837_clk_ops.recalc_rate =3D &bd71837_clk_recalc_rate;
>         }

You can also add a clk directly in this driver in that case there isn't
one in DT with the rate and name of your choosing. Then the logic is the
same and we don't need a c->rate variable.
