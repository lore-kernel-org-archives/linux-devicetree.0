From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add pshold node
Date: Mon, 3 Dec 2018 17:13:20 +0530
Message-ID: <20181203114320.GV3175@vkoul-mobl.Dlink>
References: <20181130073400.28100-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130073400.28100-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 29-11-18, 23:34, Bjorn Andersson wrote:
> The pshold block is used to drive pshold towards the PMIC, which is used
> to trigger a configurable event, such as reboot or poweroff of the
> QCS404 platform. Add the necessary node to enable this functionality.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
