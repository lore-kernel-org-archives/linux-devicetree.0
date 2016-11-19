From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Fixup smp2p node
Date: Fri, 18 Nov 2016 17:53:40 -0800
Message-ID: <e729b75a-3e0c-2462-67a7-d3a0f4b3368c@codeaurora.org>
References: <1479499609-13336-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1479499609-13336-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/18/2016 12:06 PM, Bjorn Andersson wrote:
> The SMEM state property name changes between the integration branch and
> mainline, update to use the correct one.
>
> Fixes: 2f45d9fcd531 ("arm64: dts: msm8996: Add SMP2P and APCS nodes")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the change and sorry for missing it earlier.

Reviewed-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
