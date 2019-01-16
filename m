From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/5] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Wed, 16 Jan 2019 09:44:57 +0000
Message-ID: <113dc31e-c17d-4df0-b275-9f2d09591037@linaro.org>
References: <20190114194112.32567-1-srinivas.kandagatla@linaro.org>
 <20190114194112.32567-2-srinivas.kandagatla@linaro.org>
 <20190115202206.GA4849@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115202206.GA4849@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks for the review!

On 15/01/2019 20:22, Rob Herring wrote:
> On Mon, Jan 14, 2019 at 07:41:08PM +0000, Srinivas Kandagatla wrote:
>> The FastRPC driver implements an IPC (Inter-Processor Communication)
>> mechanism that allows for clients to transparently make remote method
>> invocations across DSP and APPS boundaries. This enables developers
>> to offload tasks to the DSP and free up the application processor for
>> other tasks.
>>
>> Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
>> Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.txt | 84 +++++++++++++++++++
>>   1 file changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> new file mode 100644
>> index 000000000000..004e636b4133
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> @@ -0,0 +1,84 @@
>> +Qualcomm Technologies, Inc. FastRPC Driver
>> +
>> +The FastRPC driver implements an IPC (Inter-Processor Communication)
> 
> driver or this is a h/w block?

This is a software/firmware block in Hexagon DSP.

> 
>> +mechanism that allows for clients to transparently make remote method
>> +invocations across DSP and APPS boundaries. This enables developers
>> +to offload tasks to the DSP and free up the application processor for
>> +other tasks.
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qcom,fastrpc"
>> +
>> +- label
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: should specify the dsp domain name this fastrpc
>> +	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
>> +
>> +- #address-cells
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: Must be 1
>> +
>> +- #size-cells
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: Must be 0
>> +
>> += COMPUTE BANKS
>> +Each subnode of the Fastrpc node represents compute context banks available
>> +on the dsp. The name of the nodes are not important. The properties of these
> 
> Please specify what the node names are.

Sure, these are compute context banks, will reword this accordingly.

> 
>> +nodes are defined by the individual bindings for the specific service
>> +- All Compute context banks MUST contain the following property:
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qcom,fastrpc-compute-cb"
>> +
>> +- reg
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: Context Bank ID.
>> +
>> +- secured:
>> +	Usage: Optional
>> +	Value type: <boolean>
>> +	Defination: Indicating context bank is secured
> 
> What does 'secured' mean here?
> 
secured in TZ sense, this context requires secure buffers to work with.


>> +
>> +- nsessions:
>> +	Usage: Optional
>> +	Value type: <u32>
>> +	Defination: A value indicating how many sessions can share this
>> +		    context bank. Defaults to 1 when this property
>> +		    is not specified.
> 
> Needs a vendor prefix.
> 
Sure, will do that in next version!

>> +
>> +Example:
>> +
>> +adsp-pil {
>> +	compatible = "qcom,msm8996-adsp-pil";
>> +	...
>> +	smd-edge {
>> +		label = "lpass";
>> +		fastrpc {
>> +			compatible = "qcom,fastrpc";
>> +			qcom,smd-channels = "fastrpcsmd-apps-dsp";
>> +			lable = "adsp";
> 
> typo.

Thanks for spotting this.. will fix this!

--srini
