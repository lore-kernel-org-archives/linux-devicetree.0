From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH v2] qcom: ipq4019: add wifi nodes to ipq4019 SoC device
 tree
Date: Mon, 18 Apr 2016 17:25:22 +0530
Message-ID: <f6a444f96a6f602c170b8886f2f9fe9d@codeaurora.org>
References: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
 <570E8850.9030506@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <570E8850.9030506@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: agross@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, c_traja@qti.qualcomm.com, Raja Mani <rmani@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 2016-04-13 23:26, Stephen Boyd wrote:
> On 04/11/2016 09:18 PM, tamizhchelvam@codeaurora.org wrote:
>> +			qcom,msi_addr = <0x0b006040>;
>> +			qcom,msi_base = <0x50>;
> 
> Are these properties used? I couldn't find any usage in the driver but 
> I
> may have missed it.

As of now it is not used in the driver. But it will be needed in the 
future to enable msi in ipq4019 platform.

Thanks,
Tamizh.
