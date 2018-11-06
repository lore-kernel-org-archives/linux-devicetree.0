From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: smd: Add support for QCS404 rpm clocks
Date: Tue, 06 Nov 2018 09:47:14 -0800
Message-ID: <154152643447.88331.15663665572409943424@swboyd.mtv.corp.google.com>
References: <20181103070002.19106-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181103070002.19106-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-11-03 00:00:02)
> From: Taniya Das <tdas@codeaurora.org>
> =

> Add rpm smd clocks, PMIC and bus clocks which are required on QCS404
> for clients to vote on.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> [bjorn: Dropped cxo, voter clocks and static initialization]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Patch looks OK.

Applied to clk-next, with a complaint below.

> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 850c02a52248..d3aadaeb2903 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -611,10 +611,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm899=
6 =3D {
>         .num_clks =3D ARRAY_SIZE(msm8996_clks),
>  };
>  =

> +/* QCS404 */
> +DEFINE_CLK_SMD_RPM_QDSS(qcs404, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_=
CLK, 1);
> +
> +DEFINE_CLK_SMD_RPM(qcs404, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0=
);
> +DEFINE_CLK_SMD_RPM(qcs404, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1=
);

Just curious, do we need to keep redefining these clks for each SoC?
Perhaps we should try to consolidate the clks that are common among SoCs
so we can reduce the number of static structs lying around in this
driver.
