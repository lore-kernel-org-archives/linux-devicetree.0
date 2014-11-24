From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCHv2 3/5] clk: s2mps11: Add the support for S2MPS13 PMIC
 clock
Date: Mon, 24 Nov 2014 10:04:35 +0000
Message-ID: <20141124100435.GA4241@x1>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
 <1416301183-10478-4-git-send-email-cw00.choi@samsung.com>
 <20141118215926.25314.90810@quantum>
 <20141119164310.GH1875@x1>
 <5472F3C2.4030907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5472F3C2.4030907@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, broonie@kernel.org, a.zummo@towertech.it, lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Could you please apply this patchset on your tree
> or Do we wait the Ack from RTC mainatiner for patch 4?

We still need an Ack from Alessandro.

> On 11/20/2014 01:43 AM, Lee Jones wrote:
> > On Tue, 18 Nov 2014, Mike Turquette wrote:
> >=20
> >> Quoting Chanwoo Choi (2014-11-18 00:59:41)
> >>> This patch adds the support for S2MPS13 PMIC clock which is same =
with existing
> >>> S2MPS14 RTC IP. But, S2MPS13 uses all of clocks (32khz_{ap|bt|cp}=
).
> >>>
> >>> Cc: Mike Turquette <mturquette@linaro.org>
> >>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> >>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>
> >> Applied to clk-next.
> >=20
> > I'm pretty sure you can't do that.  You have a dependency on
> > linux/mfd/samsung/s2mps13.h, which is satisfied in one of the earli=
er
> > patches in the set.  If you'd care to just provide an Ack for this
> > patch, I can send you a pull-request with the decencies met.
> >=20
> >>> ---
> >>>  drivers/clk/clk-s2mps11.c | 24 ++++++++++++++++++++++++
> >>>  1 file changed, 24 insertions(+)
> >>>
> >>> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.=
c
> >>> index b7797fb..7bb13af 100644
> >>> --- a/drivers/clk/clk-s2mps11.c
> >>> +++ b/drivers/clk/clk-s2mps11.c
> >>> @@ -23,6 +23,7 @@
> >>>  #include <linux/clk-provider.h>
> >>>  #include <linux/platform_device.h>
> >>>  #include <linux/mfd/samsung/s2mps11.h>
> >>> +#include <linux/mfd/samsung/s2mps13.h>
> >>>  #include <linux/mfd/samsung/s2mps14.h>
> >>>  #include <linux/mfd/samsung/s5m8767.h>
> >>>  #include <linux/mfd/samsung/core.h>
> >>> @@ -120,6 +121,24 @@ static struct clk_init_data s2mps11_clks_ini=
t[S2MPS11_CLKS_NUM] =3D {
> >>>         },
> >>>  };
> >>> =20
> >>> +static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] =
=3D {
> >>> +       [S2MPS11_CLK_AP] =3D {
> >>> +               .name =3D "s2mps13_ap",
> >>> +               .ops =3D &s2mps11_clk_ops,
> >>> +               .flags =3D CLK_IS_ROOT,
> >>> +       },
> >>> +       [S2MPS11_CLK_CP] =3D {
> >>> +               .name =3D "s2mps13_cp",
> >>> +               .ops =3D &s2mps11_clk_ops,
> >>> +               .flags =3D CLK_IS_ROOT,
> >>> +       },
> >>> +       [S2MPS11_CLK_BT] =3D {
> >>> +               .name =3D "s2mps13_bt",
> >>> +               .ops =3D &s2mps11_clk_ops,
> >>> +               .flags =3D CLK_IS_ROOT,
> >>> +       },
> >>> +};
> >>> +
> >>>  static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] =
=3D {
> >>>         [S2MPS11_CLK_AP] =3D {
> >>>                 .name =3D "s2mps14_ap",
> >>> @@ -184,6 +203,10 @@ static int s2mps11_clk_probe(struct platform=
_device *pdev)
> >>>                 s2mps11_reg =3D S2MPS11_REG_RTC_CTRL;
> >>>                 clks_init =3D s2mps11_clks_init;
> >>>                 break;
> >>> +       case S2MPS13X:
> >>> +               s2mps11_reg =3D S2MPS13_REG_RTCCTRL;
> >>> +               clks_init =3D s2mps13_clks_init;
> >>> +               break;
> >>>         case S2MPS14X:
> >>>                 s2mps11_reg =3D S2MPS14_REG_RTCCTRL;
> >>>                 clks_init =3D s2mps14_clks_init;
> >>> @@ -279,6 +302,7 @@ static int s2mps11_clk_remove(struct platform=
_device *pdev)
> >>> =20
> >>>  static const struct platform_device_id s2mps11_clk_id[] =3D {
> >>>         { "s2mps11-clk", S2MPS11X},
> >>> +       { "s2mps13-clk", S2MPS13X},
> >>>         { "s2mps14-clk", S2MPS14X},
> >>>         { "s5m8767-clk", S5M8767X},
> >>>         { },
> >=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
