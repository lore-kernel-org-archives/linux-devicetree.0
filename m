From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V7 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Wed, 5 Apr 2017 15:51:30 -0700
Message-ID: <20170405225130.GN7065@codeaurora.org>
References: <1491395558-16902-1-git-send-email-vivek.gautam@codeaurora.org>
 <1491395558-16902-5-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491395558-16902-5-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: kishon@ti.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

On 04/05, Vivek Gautam wrote:
> Qualcomm SOCs have QMP phy controller that provides support
> to a number of controller, viz. PCIe, UFS, and USB.
> Add a new driver, based on generic phy framework, for this
> phy controller.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
