From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Date: Mon, 09 Sep 2019 04:42:05 -0700
Message-ID: <20190909114206.B1355218AF@mail.kernel.org>
References: <20190826173120.2971-1-vkoul@kernel.org> <20190826173120.2971-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826173120.2971-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-26 10:31:18)
> Convert the rpmh clock driver to use the new parent data scheme by
> specifying the parent data for board clock.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
