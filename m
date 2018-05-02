From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Wed, 02 May 2018 08:30:04 -0700
Message-ID: <152527500426.138124.18419525952886399750@swboyd.mtv.corp.google.com>
References: <1525258277-3478-1-git-send-email-tdas@codeaurora.org>
 <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-05-02 03:51:17)
> +               ret =3D devm_clk_hw_register(&pdev->dev, hw_clks[i]);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to register %s\n",
> +                                       hw_clks[i]->init->name);
> +                       goto err;
> +               }
> +
> +               rpmh_clk->dev =3D &pdev->dev;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_rpmh_hw_ge=
t,
> +                                     (void *) desc);

Drop the void cast.

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to add clock provider\n");
> +               goto err;
> +       }
> +
> +       dev_dbg(&pdev->dev, "Registered RPMh clocks\n");
> +
> +       return 0;
> +err:
> +       if (rpmh_client)
> +               rpmh_release(rpmh_client);
> +
> +       return ret;
> +}
> +
> +static int clk_rpmh_remove(struct platform_device *pdev)
> +{
> +       const struct clk_rpmh_desc *desc =3D
> +                       of_device_get_match_data(&pdev->dev);
> +       struct clk_hw **hw_clks =3D desc->clks;
> +       struct clk_rpmh *rpmh_clk =3D to_clk_rpmh(hw_clks[0]);
> +
> +       rpmh_release(rpmh_clk->rpmh_client);
> +
> +       return 0;
> +}

I'll review Lina's series again. Still hoping to drop the client thing.
