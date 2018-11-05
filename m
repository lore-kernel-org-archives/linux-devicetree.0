From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add videocc node
Date: Mon, 05 Nov 2018 15:21:34 -0800
Message-ID: <154146009460.88331.6359450184767946173@swboyd.mtv.corp.google.com>
References: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-05 02:35:17)
> This adds the video clock controller node to sdm845 based on the examples
> in the bindings.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Did you mean to send "To:" Andy? Clk tree doesn't take these sorts of
dts patches.
