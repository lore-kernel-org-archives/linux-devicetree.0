From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/17] dt-bindings: phy-qcom-qmp: Update bindings for
 QMP V3 USB PHY
Date: Thu, 5 Oct 2017 17:14:05 -0500
Message-ID: <20171005221405.pnxoskfxtfvygrgm@rob-hp-laptop>
References: <1506502753-27408-1-git-send-email-mgautam@codeaurora.org>
 <1506502753-27408-13-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506502753-27408-13-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 27, 2017 at 02:29:08PM +0530, Manu Gautam wrote:
> Update compatible string and clock names for QMP version V3
> USB PHY.
> 
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index b6a9f2b..dcf1b8f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -8,7 +8,8 @@ Required properties:
>   - compatible: compatible list, contains:
>  	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>  	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
> -	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
> +	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
> +	       "qcom,qmp-v3-usb3-phy" for USB3 QMP V3 phy.

This is fine, but you will still need an SoC specific compatible in 
addition to this.

Acked-by: Rob Herring <robh@kernel.org>

Rob
