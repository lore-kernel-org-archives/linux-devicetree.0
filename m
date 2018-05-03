From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Thu, 03 May 2018 10:04:08 -0700
Message-ID: <152536704820.138124.12887560717683281434@swboyd.mtv.corp.google.com>
References: <1525258277-3478-1-git-send-email-tdas@codeaurora.org>
 <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
 <152527500426.138124.18419525952886399750@swboyd.mtv.corp.google.com>
 <d687230c-1178-41e4-d8e3-2c3957affb4a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d687230c-1178-41e4-d8e3-2c3957affb4a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-05-03 03:33:10)
> Hello Stephen,
> =

> Thanks for review.
> =

> On 5/2/2018 9:00 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-05-02 03:51:17)
> >> +               ret =3D devm_clk_hw_register(&pdev->dev, hw_clks[i]);
> >> +               if (ret) {
> >> +                       dev_err(&pdev->dev, "failed to register %s\n",
> >> +                                       hw_clks[i]->init->name);
> >> +                       goto err;
> >> +               }
> >> +
> >> +               rpmh_clk->dev =3D &pdev->dev;
> >> +       }
> >> +
> >> +       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_rpmh_hw=
_get,
> >> +                                     (void *) desc);
> > =

> > Drop the void cast.
> > =

> =

> I see a compiler warning, that is the reason to keep the void cast.
> /include/linux/clk-provider.h:881:5: note: expected =E2=80=98void *=E2=80=
=99 but =

> argument is of type =E2=80=98const struct clk_rpmh_desc *=E2=80=99

Ok. Casting away const is not good though. Can you pass a pointer to the
hw_clks array instead?
