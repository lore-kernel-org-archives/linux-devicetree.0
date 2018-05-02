From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add video clock controller driver for SDM845
Date: Wed, 02 May 2018 11:47:07 -0700
Message-ID: <152528682776.138124.2183943878215041610@swboyd.mtv.corp.google.com>
References: <1524576771-31096-1-git-send-email-anischal@codeaurora.org>
 <1524576771-31096-3-git-send-email-anischal@codeaurora.org>
 <152521087780.138124.7623601052057968460@swboyd.mtv.corp.google.com>
 <d311e4d7-7ba8-0b26-93c7-5ee06db466ef@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d311e4d7-7ba8-0b26-93c7-5ee06db466ef@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Nischal, Amit" <anischal@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Nischal, Amit (2018-05-02 00:56:35)
> =

> =

> Thanks for the review.
> As of now, there are no resets defined for VIDEOCC. So I will move
> the #reset-cells tooptional property in the dt-binding.
> Same will be updated in the next patch series.

Please don't make it optional. It should be required in the binding,
because there are resets in the hardware. If you don't want to add them
into the driver, that's ok, but it isn't really that hard to add them so
why not add them?
