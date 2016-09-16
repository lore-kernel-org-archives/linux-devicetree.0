From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm8996-pcie-phy: add support for
 msm8996 pcie phy
Date: Fri, 16 Sep 2016 17:45:43 +0100
Message-ID: <636dcd07-82a9-ddf4-9cd1-0b70dac88d8c@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-2-git-send-email-srinivas.kandagatla@linaro.org>
 <20160916135220.GA10405@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160916135220.GA10405@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 16/09/16 14:52, Rob Herring wrote:
> On Wed, Sep 07, 2016 at 11:55:32AM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings for pcie phy on MSM8996.
>>
>> This PHY has 3 Ports, including a common block. Each port is connected
>> to one root complex. Each port has dedicated reset control lines apart
>> from common reset and clocks for common block.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>  .../bindings/phy/qcom-msm8996-pcie-phy.txt         | 62 ++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>> new file mode 100644
>> index 0000000..51930ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>> @@ -0,0 +1,62 @@
>> +Qualcomm msm8996 pcie PHY
>> +------------------------
>> +
>> +Required properties:
>> +- compatible: compatible list, contains "qcom,msm8996-pcie-phy".
>
> 8994 has PCIe, this phy is completely different? And Archit mentioned
> another SoC, too.

Recently I too learned that this phy IP is used across USB, UFS and 
other SOCs, so Am planning to dump this patchset and write one common 
driver.

Thanks,
srini
>
> Rob
>
