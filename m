From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: scm: Refactor compatibles and clocks
Date: Thu, 30 Aug 2018 18:06:46 -0700
Message-ID: <153567760668.93865.10990310466407439634@swboyd.mtv.corp.google.com>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
 <20180829231505.22660-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Sricharan R <sricharan@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-08-29 16:15:03)
> When the binding was written all "future" platforms required three
> clocks, so the default compatible (qcom,scm) was defined to require
> this. But as history shows all "future" platforms actually lack required
> clocks. Given how the binding is written these compatibles have to be
> added as an exception to the default.
> =

> Refactor the description of compatible to define that a platform
> compatible should be given, followed by the fallback of qcom,scm. Also
> refactor the description of the clocks in a way that this does not need
> to be updated as new platform specific compatibles are added.
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
