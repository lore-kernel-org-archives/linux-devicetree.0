From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: Refactor clock handling
Date: Thu, 30 Aug 2018 18:06:57 -0700
Message-ID: <153567761732.93865.5048429917627072848@swboyd.mtv.corp.google.com>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
 <20180829231505.22660-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-08-29 16:15:04)
> At one point in time all "future" platforms required three clocks, so
> the binding and driver was written to treat this as the default case.
> But new platforms has no clock requirements, which currently makes them
> all a special case, causing the need for a patch in the binding and
> driver for each new platform added.
> =

> This patch reworks the driver logic so that it will attempt to acquire
> all three clocks and fail based on the given compatible. This allow us
> to drop the clock requirement from "qcom,scm", in a way that will remain
> backwards compatible with existing DT files.
> =

> Specific compatibles are added for apq8084, msm8916 and msm8974 to match
> the updated binding and although equivalent to qcom,scm both ipq4019 and
> msm8996 are kept as these have been used without fallback to qcom,scm.
> =

> The result of this patch is that new platforms, that require no clocks,
> can be use the fallback compatible of "qcom,scm".
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
