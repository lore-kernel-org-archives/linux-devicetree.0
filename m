From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: reset: pdc: Convert PDC Global
 bindings to yaml
Date: Mon, 2 Sep 2019 16:01:38 +0100
Message-ID: <20190902150138.GA29400@bogus>
References: <20190901174407.30756-1-sibis@codeaurora.org>
 <20190901174407.30756-3-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190901174407.30756-3-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sun,  1 Sep 2019 23:14:07 +0530, Sibi Sankar wrote:
> Convert PDC Global bindings to yaml and add SC7180 PDC global to the list
> of possible bindings.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
>  .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
>  2 files changed, 47 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
