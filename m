From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v1 4/6] phy: qcom-qmp: Add QMP V3 USB3 PHY support for
 msm8998
Date: Fri, 11 Jan 2019 12:48:50 -0700
Message-ID: <a5f38a7b-a761-c924-08ef-fc685f027561@codeaurora.org>
References: <1546620647-2467-1-git-send-email-jhugo@codeaurora.org>
 <20190111194513.GA13699@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111194513.GA13699@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon@ti.com, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/11/2019 12:45 PM, Rob Herring wrote:
> On Fri, Jan 04, 2019 at 09:50:47AM -0700, Jeffrey Hugo wrote:
>> MSM8998 contains a single QMP v3 USB3 phy similar to the existing sdm845
>> support, however MSM8998 does not have display port (DP) support.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   5 +
>>   drivers/phy/qualcomm/phy-qcom-qmp.c                | 142 +++++++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h                |   4 +
>>   3 files changed, 151 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> index 41a1074..6061b6f 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> @@ -9,6 +9,7 @@ Required properties:
>>   	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>>   	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>>   	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>> +	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
> 
> Please make bindings a separate patch. Combining patch 1 and 2
> binding changes is fine.
> 
> Rob
> 

Sure.  Planning on re-spinning early next week to address a few comments.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
