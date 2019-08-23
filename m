From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 09/14] dt-bindings: opp: Add qcom-opp bindings with
 properties needed for CPR
Date: Fri, 23 Aug 2019 07:34:50 -0500
Message-ID: <CAL_JsqJ=nH3a9Jmj_Syrg0dmx3gB9vFgbMmZ4=ew_Pcz4EDrYw@mail.gmail.com>
References: <20190725104144.22924-10-niklas.cassel@linaro.org> <20190819101238.17335-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819101238.17335-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 5:12 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> Add qcom-opp bindings with properties needed for Core Power Reduction
> (CPR).
>
> CPR is included in a great variety of Qualcomm SoCs, e.g. msm8916 and
> msm8996. CPR was first introduced in msm8974.
>
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
> Changes since V2:
> qcom,opp-fuse-level is really a required property and not an optional
> property, so properly define it as such.
>
>  .../devicetree/bindings/opp/qcom-opp.txt      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt

Reviewed-by: Rob Herring <robh@kernel.org>
