From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: clk: Introduce 'protected-clocks' property
Date: Wed, 21 Nov 2018 01:00:16 -0800
Message-ID: <154279081676.88331.1516496381312386439@swboyd.mtv.corp.google.com>
References: <20181105194011.43770-1-swboyd@chromium.org>
 <20181105194011.43770-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105194011.43770-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2018-11-05 11:40:10)
> Add a generic clk property for clks which are not intended to be used by
> the OS due to security restrictions put in place by firmware. For
> example, on some Qualcomm firmwares reading or writing certain clk
> registers causes the entire system to reboot, but on other firmwares
> reading and writing those same registers is required to make devices
> like QSPI work. Rather than adding one-off properties each time a new
> set of clks appears to be protected, let's add a generic clk property to
> describe any set of clks that shouldn't be touched by the OS. This way
> we never need to register the clks or use them in certain firmware
> configurations.
> =

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next
