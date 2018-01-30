From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Tue, 30 Jan 2018 16:17:50 +0000
Message-ID: <20180130161750.GA20815@codeaurora.org>
References: <20180118220833.16616-3-ilina@codeaurora.org>
 <20180118222802.18161-1-ilina@codeaurora.org>
 <20180129190852.5ddcgdo3gkc2nw5r@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180129190852.5ddcgdo3gkc2nw5r@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, msivasub@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks Rob, for taking time to review these bindings.

On Mon, Jan 29 2018 at 19:08 +0000, Rob Herring wrote:
>On Thu, Jan 18, 2018 at 03:28:02PM -0700, Lina Iyer wrote:
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> Command DB provides information on shared resources like clocks,
>> regulators etc., probed at boot by the remote subsytem and made
>> available in shared memory.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>>  .../devicetree/bindings/arm/msm/cmd-db.txt         | 37 ++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/msm/cmd-db.txt b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> new file mode 100644
>> index 000000000000..b56e3e3604d3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> @@ -0,0 +1,37 @@
>> +Command DB
>> +---------
>
>Another strange QCom binding...
>
:)

>> +
>> +Command DB is a database that provides a mapping between resource key and the
>> +resource address for a system resource managed by a remote processor. The data
>> +is stored in a shared memory region and is loaded by the remote processor.
>
>Is said shared memory described in DT. If so, this should be a child
>node. Only 8 bytes seems kind of fine grained for putting in DT when it
>could be implied by the parent shared memory node.
>
I dont believe this memory will be described in DT for this chipset.
Will ask internally.

>> +
>> +Some of the Qualcomm Technologies Inc SoC's have hardware accelerators for
>> +controlling shared resources. Depending on the board configuration the shared
>> +resource properties may change. These properties are dynamically probed by the
>> +remote processor and made available in the shared memory.
>
>The table may change, but does the presence of it or shared memory
>location (of the pointer) change?
>
The location may change between different SoCs, but will be present in
all chipsets of this architecture.

Thanks,
Lina

>> +
>> +Command DB allows drivers to query resource parameters based on pre-determined
>> +key strings.
>> +
>> +The devicetree representation of the command DB driver should be:
>> +
>> +PROPERTIES:
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Should be "qcom,cmd-db"
>> +
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: First element is the base address of shared memory
>> +		Second element is the size of the shared memory region
>> +		Points to the dictionary address that houses the command DB
>> +		start address and the size of the command DB region
>> +
>> +Example:
>> +
>> +	qcom,cmd-db@c3f000c {
>> +		compatible = "qcom,cmd-db";
>> +		reg = <0xc3f000c 0x8>;
>> +	};
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
