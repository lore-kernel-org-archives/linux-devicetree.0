From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to 95 degrees
Date: Wed, 09 Jan 2019 16:29:43 -0800
Message-ID: <154708018331.15366.11574628155253134835@swboyd.mtv.corp.google.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org> <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2019-01-09 16:00:55)
> 75 degrees is too aggressive for throttling the CPU. After speaking to
> Qualcomm engineers, increase it to 95 degrees.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++--------

Is the plan that these are some defaults that would be adjusted by board
variants? Just curious why we have anything in here and don't punt it
all to each board dts file.
