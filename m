From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/2] Add QCOM video clock controller driver
Date: Fri, 04 May 2018 09:31:04 -0700
Message-ID: <152545146453.138124.2471609033510400995@swboyd.mtv.corp.google.com>
References: <1525350925-16006-1-git-send-email-anischal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525350925-16006-1-git-send-email-anischal@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Amit Nischal (2018-05-03 05:35:23)
> Changes in v1:
>    https://lkml.org/lkml/2018/4/24/545
> Addressed below review comments given by Rob
> - Change the compatible property as per '<vendor>,<soc>-<block>' format.
> - Add header definitions for resets and power-domain cells.

You didn't add any reset definitions though?
