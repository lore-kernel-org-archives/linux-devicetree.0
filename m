From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] qcom: ipq4019: add wifi nodes to ipq4019 SoC device
 tree
Date: Wed, 13 Apr 2016 10:56:32 -0700
Message-ID: <570E8850.9030506@codeaurora.org>
References: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: tamizhchelvam@codeaurora.org, agross@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, c_traja@qti.qualcomm.com, Raja Mani <rmani@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 04/11/2016 09:18 PM, tamizhchelvam@codeaurora.org wrote:
> +			qcom,msi_addr = <0x0b006040>;
> +			qcom,msi_base = <0x50>;

Are these properties used? I couldn't find any usage in the driver but I
may have missed it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
