From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v2 4/6] ARM: dts: qs600: remove unnecessary i2c pinctrl
 nodes in board file.
Date: Tue, 25 Aug 2015 16:24:09 -0500
Message-ID: <20150825212409.GB12349@qualcomm.com>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1439903419-20275-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439903419-20275-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2015 at 02:10:19PM +0100, Srinivas Kandagatla wrote:
> This patch removes unnecessary i2c pinctrl nodes in board file, these
> are already defined in the soc specific file qcom-apq8064.dtsi.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 9 ---------
>  1 file changed, 9 deletions(-)

Applied, thanks!

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
