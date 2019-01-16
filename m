From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy-qcom: Add support for msm8998 usb
Date: Wed, 16 Jan 2019 14:27:43 +0530
Message-ID: <899dbd3d-2ce2-9a31-aca3-0ca936bdd2dd@ti.com>
References: <1547483771-5334-1-git-send-email-jhugo@codeaurora.org>
 <20190115180839.GC28907@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115180839.GC28907@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 15/01/19 11:38 PM, Bjorn Andersson wrote:
> On Mon 14 Jan 08:36 PST 2019, Jeffrey Hugo wrote:
> 
>> USB on msm8998 utilizes the QUSB2 and QMP phys, similar to sdm845.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   | 5 +++++
>>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 1 +
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> index 41a1074..6061b6f 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> @@ -9,6 +9,7 @@ Required properties:
>>  	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>>  	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>> +	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
>>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>>  	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
>>  	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
>> @@ -42,6 +43,8 @@ Required properties:
>>  			"aux", "cfg_ahb", "ref".
>>  		For "qcom,msm8996-qmp-usb3-phy" must contain:
>>  			"aux", "cfg_ahb", "ref".
>> +		For "qcom,msm8998-qmp-usb3-phy" must contain:
>> +			"aux", "cfg_ahb", "ref".
>>  		For "qcom,sdm845-qmp-usb3-phy" must contain:
>>  			"aux", "cfg_ahb", "ref", "com_aux".
>>  		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
>> @@ -60,6 +63,8 @@ Required properties:
>>  		For "qcom,msm8996-qmp-pcie-phy" must contain:
>>  			"phy", "common", "cfg".
>>  		For "qcom,msm8996-qmp-usb3-phy" must contain
>> +		 "phy", "common".
> 
> Odd indentation.
> 
> 
> Apart from this, you have my
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Fixed the indentation and merged it.

Thanks
Kishon
