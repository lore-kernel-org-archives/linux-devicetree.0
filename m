From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: opp: Introduce qcom-opp bindings
Date: Fri, 7 Dec 2018 11:29:48 -0600
Message-ID: <20181207172948.GA4284@bogus>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204052119.806-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue,  4 Dec 2018 10:51:12 +0530, Rajendra Nayak wrote:
> On Qualcomm Technologies, Inc. platforms, an OPP node needs
> to describe an additional level/corner value that is then communicated
> to a remote microprocessor by the CPU, which then takes some
> actions (like adjusting voltage values across various rails)
> based on the value passed.
> 
> Describe these bindings in the qcom-opp bindings document.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/opp/qcom-opp.txt      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
