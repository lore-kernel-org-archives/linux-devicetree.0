From: Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v1 3/6] phy: qcom-qusb2: Add QUSB2 PHY support for msm8998
Date: Mon, 7 Jan 2019 10:18:04 -0800
Message-ID: <20190107181749.GA23243@jackp-linux.qualcomm.com>
References: <1546620629-2426-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546620629-2426-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: kishon@ti.com, robh+dt@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jeff,

Spotted a typo below:

On Fri, Jan 04, 2019 at 09:50:29AM -0700, Jeffrey Hugo wrote:
> MSM8998 contains one QUSB2 PHY which is very similar to the existing
> sdm845 support.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c              | 41 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 03025d9..3976847 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,6 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>  	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> +	       "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8996,
                                                           ^^^^
should be 8998.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
