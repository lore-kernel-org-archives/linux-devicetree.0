From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/9] clk: actions: Cache regmap info in private clock
 descriptor
Date: Tue, 16 Oct 2018 23:02:23 -0700
Message-ID: <153975614377.5275.13892464901714156121@swboyd.mtv.corp.google.com>
References: <20180810095113.25292-1-manivannan.sadhasivam@linaro.org>
 <20180810095113.25292-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810095113.25292-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br, sravanhome@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2018-08-10 02:51:05)
> In order to support the reset controller, regmap info needs to
> be cached in the private clock descriptor, owl_clk_desc. Hence,
> save that and also make the clock descriptor struct non const.
> =

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
