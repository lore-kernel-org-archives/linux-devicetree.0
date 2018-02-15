From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Thu, 15 Feb 2018 18:46:17 +0000
Message-ID: <20180215184617.GB23714@codeaurora.org>
References: <20180208195154.3580-1-ilina@codeaurora.org>
 <20180208195154.3580-3-ilina@codeaurora.org>
 <20180214193419.GE93895@bjorns-mbp-2.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180214193419.GE93895@bjorns-mbp-2.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, rnayak@codeaurora.org, msivasub@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14 2018 at 19:34 +0000, Bjorn Andersson wrote:
>On Thu 08 Feb 11:51 PST 2018, Lina Iyer wrote:
>
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
>>  .../devicetree/bindings/arm/msm/cmd-db.txt         | 38 ++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/msm/cmd-db.txt b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> new file mode 100644
>> index 000000000000..e21666e40ebf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
>> @@ -0,0 +1,38 @@
>> +Command DB
>> +---------
>> +
>> +Command DB is a database that provides a mapping between resource key and the
>> +resource address for a system resource managed by a remote processor. The data
>> +is stored in a shared memory region and is loaded by the remote processor.
>> +
>> +Some of the Qualcomm Technologies Inc SoC's have hardware accelerators for
>> +controlling shared resources. Depending on the board configuration the shared
>> +resource properties may change. These properties are dynamically probed by the
>> +remote processor and made available in the shared memory.
>> +
>> +The devicetree representation of the command DB driver should be:
>> +
>> +PROPERTIES:
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Should be "qcom,cmd-db"
>> +
>> +- memory-region:
>> +	Usage: required
>> +	Value type: <phandle>
>> +	Definition: The phandle to the reserved memory region.
>> +
>> +Example:
>> +
>> +	reserved-memory {
>> +		[...]
>> +		cmd_db_mem: qcom,cmd-db@c3f000c {
>> +			reg = <0x0 0xc3f000c 0x0 0x8>;
>
>I was hoping that we can describe the actual memory here, as I got the
>impression that it will also be a chunk of memory carved out from System
>RAM.
>
Yes, it can be described. But, the location should always be read from
the address above. Generally, the CMD DB memory would not change, but it
is not always guaranteed.

>If not it would seem unlikely that there's a 8 byte carveout in the
>middle of DDR, what else is here?
>
>> +		};
>> +	};
>> +
>> +	qcom,cmd-db@c3f000c {
>> +		compatible = "qcom,cmd-db";
>
>Add "qcom,cmd-db" to "reserved_mem_matches" in drivers/of/platform.c,
>use of_reserved_mem_lookup(pdev->dev.of_node) to get the reserved_mem
>and you can just put the compatible directly on the reserved-memory
>node.
>
>That way you don't need this separate node that doesn't really represent
>anything.
>
Oh okay. I can take care of that.

Thanks,
Lina
>> +		memory-region = <&cmd_db_mem>;
>> +	};
