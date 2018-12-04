From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: opp: Introduce qcom-opp bindings
Date: Tue, 04 Dec 2018 15:06:45 -0800
Message-ID: <154396480574.88331.6841986331162089237@swboyd.mtv.corp.google.com>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-12-03 21:21:12)
> On Qualcomm Technologies, Inc. platforms, an OPP node needs
> to describe an additional level/corner value that is then communicated
> to a remote microprocessor by the CPU, which then takes some
> actions (like adjusting voltage values across various rails)
> based on the value passed.
> =

> Describe these bindings in the qcom-opp bindings document.
> =

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
