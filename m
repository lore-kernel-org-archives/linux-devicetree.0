From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v10 3/3] clk: qcom: Add lpass clock controller driver for SDM845
Date: Tue, 27 Nov 2018 01:14:29 -0800
Message-ID: <154331006901.88331.9760589510991406736@swboyd.mtv.corp.google.com>
References: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
 <1542873221-13693-4-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542873221-13693-4-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-21 23:53:41)
> +
> +static struct clk_branch lpass_qdsp6ss_core_clk =3D {
> +       .halt_reg =3D 0x20,
> +       /* CLK_OFF would not toggle until LPASS is not out of reset */

Is this really "CLK_OFF won't toggle until LPASS it out of reset"?
