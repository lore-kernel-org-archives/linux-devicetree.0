From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: introduce RPMH RSC bindings for
 Qualcomm SoCs
Date: Mon, 26 Mar 2018 17:22:46 -0500
Message-ID: <20180326222246.zjildcniv4lquxft@rob-hp-laptop>
References: <20180309232543.24636-1-ilina@codeaurora.org>
 <20180309232543.24636-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309232543.24636-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 04:25:35PM -0700, Lina Iyer wrote:
> Add device binding documentation for Qualcomm Technology Inc's RPMH RSC
> driver. The driver is used for communicating resource state requests for
> shared resources.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> 
> Changes in v3:
> 	- Move to soc/qcom
> 	- Amend text per Stephen's suggestions
> 
> Changes in v2:
> 	- Amend text to describe the registers in reg property
> 	- Add reg-names for the registers
> 	- Update examples to use GIC_SPI in interrupts instead of 0
> 	- Rephrase incorrect description
> 
> Changes in v3:
> 	- Fix unwanted capitalization
> 	- Remove clients from the examples, this doc does not describe
> 	  them
> 	- Rephrase introductory paragraph
> 	- Remove hardware specifics from DT bindings
> ---
>  .../devicetree/bindings/soc/qcom/rpmh-rsc.txt      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
