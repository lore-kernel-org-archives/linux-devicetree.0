From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-binding: soc: qcom: Add binding for RFSA
Date: Thu, 10 Aug 2017 11:50:37 -0500
Message-ID: <20170810165037.gbed5bacykbzftgr@rob-hp-laptop>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170803025754.19101-4-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 07:57:52PM -0700, Bjorn Andersson wrote:
> This adds the binding for describing shared memory used to exchange file
> system blocks between the RMTFS client and service.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changed since v1:
> - Memory described in a single reserved-memory node, rather than by reference
>   from a "dummy" node
> - qcom,vmdid added
> 
>  .../bindings/reserved-memory/qcom,rfsa.txt         | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt

Acked-by: Rob Herring <robh@kernel.org>
