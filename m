From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Mon, 03 Dec 2018 09:46:01 -0800
Message-ID: <154385916141.88331.12696569463331774426@swboyd.mtv.corp.google.com>
References: <1543602089-21086-1-git-send-email-tdas@codeaurora.org>
 <1543602089-21086-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543602089-21086-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-30 10:21:28)
> Add device tree bindings for Low Power Audio subsystem clock controller f=
or
> Qualcomm Technology Inc's SDM845 SoCs.
> =

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

I noticed that a #define was lost after some revisions for some always
on clk, but I suspect we never care and will never need to turn it on so
I just went with it and dropped it too. Let's cross fingers and hope
that doesn't come back to haunt us!
