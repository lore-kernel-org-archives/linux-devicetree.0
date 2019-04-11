From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: qcom: branch: Add AON clock ops
Date: Thu, 11 Apr 2019 13:36:00 -0700
Message-ID: <155501496005.20095.2471820248377711302@swboyd.mtv.corp.google.com>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org> <20190306174758.22462-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306174758.22462-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-03-06 09:47:57)
> Some clocks can only be turned on by resetting the block containing
> them, provide a clock type that allow us to reference these clocks and
> have the client drivers enable and "disable" them.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
