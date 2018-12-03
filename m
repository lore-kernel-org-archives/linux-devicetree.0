From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v11 3/3] clk: qcom: Add lpass clock controller driver for SDM845
Date: Mon, 03 Dec 2018 09:46:22 -0800
Message-ID: <154385918289.88331.2422777226771408623@swboyd.mtv.corp.google.com>
References: <1543602089-21086-1-git-send-email-tdas@codeaurora.org>
 <1543602089-21086-4-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543602089-21086-4-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-30 10:21:29)
> Add support for the lpass clock controller found on SDM845 based devices.
> This would allow lpass peripheral loader drivers to control the clocks to
> bring the subsystem out of reset.
> LPASS clocks present on the global clock controller would be registered
> with the clock framework based on the protected-clock flag. Also do not
> gate these clocks if they are left unused, as the lpass clocks require
> the global clock controller lpass clocks to be enabled before they are
> accessed. Mark the GCC lpass clocks as CRITICAL, for the LPASS clock
> access.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next + added another #ifdef around unused clks to silence
unused warning.
