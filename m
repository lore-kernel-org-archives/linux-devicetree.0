From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 13/13] dt/bindings: drm/msm/hdmi: Add hdmi phy bindings
Date: Thu, 21 Jan 2016 17:26:54 -0600
Message-ID: <20160121232654.GA5138@rob-hp-laptop>
References: <1453360181-31738-1-git-send-email-architt@codeaurora.org>
 <1453360181-31738-14-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453360181-31738-14-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 21, 2016 at 12:39:41PM +0530, Archit Taneja wrote:
> Add hdmi phy bindings. Update the example to use hdmi phy.
> 
> Add a missing power-domains property in the hdmi core bindings.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/hdmi.txt       | 39 +++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
> index 379ee2e..21590ee 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
> @@ -11,6 +11,7 @@ Required properties:
>  - reg: Physical base address and length of the controller's registers
>  - reg-names: "core_physical"
>  - interrupts: The interrupt signal from the hdmi block.
> +- power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: device clocks
>    See ../clocks/clock-bindings.txt for details.
>  - qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
> @@ -18,6 +19,7 @@ Required properties:
>  - qcom,hdmi-tx-hpd-gpio: hpd pin
>  - core-vdda-supply: phandle to supply regulator
>  - hdmi-mux-supply: phandle to mux regulator
> +- qcom,dsi-phy: phandle to HDMI PHY device node

dsi?

Why does this not use the phy binding?

Rob
