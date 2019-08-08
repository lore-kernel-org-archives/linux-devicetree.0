From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: gcc: Add global clock controller driver for SM8150
Date: Wed, 07 Aug 2019 21:30:43 -0700
Message-ID: <20190808043043.EEBD321743@mail.kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-6-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722074348.29582-6-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Deepak Katragadda <dkatraga@codeaurora.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:48)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up
>         port to new parent scheme
>         Add comments for critical clocks]]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
