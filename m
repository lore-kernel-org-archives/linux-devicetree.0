From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Require #reset-cells in sdm845-videocc
Date: Fri, 30 Nov 2018 01:01:35 -0800
Message-ID: <154356849500.88331.9932899465368459791@swboyd.mtv.corp.google.com>
References: <20181127192443.136158-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127192443.136158-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-11-27 11:24:43)
> The #reset-cells was listed as optional in the bindings for
> qcom,sdm845-videocc.  There's no reason for it to be optional.  As per
> Stephen [1]:
> =

> > We should update the binding to make it a required property. It
> > doesn't make any sense why that property would be optional given
> > that the hardware either has support for resets or it doesn't.
> =

> sdm845 support is still in its infancy so we shouldn't be affecting
> any real device trees by modifying the bindings here.
> =

> [1] https://lkml.kernel.org/r/154330186815.88331.12720647562079303842@swb=
oyd.mtv.corp.google.com
> =

> Fixes: 84b66b211603 ("dt-bindings: clock: Introduce QCOM Video clock bind=
ings")
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
