From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/6] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Mon, 10 Dec 2018 11:17:42 +0000
Message-ID: <afdeecc4-4ee9-e933-9917-9930ece85b00@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-2-srinivas.kandagatla@linaro.org>
 <20181207182327.64mtkfx6v4wlwccz@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207182327.64mtkfx6v4wlwccz@lakrids.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks for the review,

On 07/12/18 18:23, Mark Rutland wrote:
> On Fri, Dec 07, 2018 at 04:35:08PM +0000, Srinivas Kandagatla wrote:
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
>>   .../devicetree/bindings/misc/qcom,fastrpc.txt | 73 +++++++++++++++++++
>>   1 file changed, 73 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> new file mode 100644
>> index 000000000000..06e8c25839d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>> @@ -0,0 +1,73 @@
>> +Qualcomm Technologies, Inc. FastRPC Driver
>> +
>> +The FastRPC driver implements an IPC (Inter-Processor Communication)
>> +mechanism that allows for clients to transparently make remote method
>> +invocations across DSP and APPS boundaries. This enables developers
>> +to offload tasks to the DSP and free up the application processor for
>> +other tasks.
> 
> Which hardware does this node represent?
> 
This is hexagon dsp, remoteproc node represents this.

> If this is functionality provided by another block of hardware (i.e. the
> DSPs themselves), it would be better to have nodes for them.
Currently the dsp nodes are remoteproc nodes itself, all the services 
that dsp provides are child nodes of this.

Ex: Audio DSP nodes looks like this:

adsp-pil { /* remoteproc device */
	compatible = "qcom,msm8996-adsp-pil";
	...
	smd-edge { /* rpmsg device */
		...
		fastrpc { /* platform device */
			compatible = "qcom,fastrpc";
		};
	};
};


> 
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qcom,fastrpc"
>> +
>> +- reg
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: DSP Processor ID.
>> +	Possible values are :
>> +			0 - ADSP
>> +			1 - MDSP
>> +			2 - SDSP
>> +			3 - CDSP
> 
> Why is this in a reg?

This is to identify which type of dsp(Audio/Modem/Sensor/Compute) it is, 
This information is used to create device nodes for user-space access.

> 
> To be, a phandle to the relevant DSP would seem better.
> 
>> +
>> += COMPUTE BANKS
>> +Each subnode of the Fastrpc node represents compute context banks available
>> +on the dsp. The name of the nodes are not important. The properties of these
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
> In what sense?
> 
> Does this mean Secure / Non-secure in the TrustZone sense?

Yes, its secured in TZ sense, this context requires secure buffers to 
work with.

> 
>> +
>> +- nsessions:
>> +	Usage: Optional
>> +	Value type: <u32>
>> +	Defination: A value indicating how many sessions can share this
>> +		    context bank. Defaults to 'One' when this property
>> +		    is not specified.
> 
> Presumably the default is 1, rather than 'One'.
Yes!
> 
> What is a session? How do there share a context bank?

A Session is a running instance on a compute context bank.

The value here indicates how many sessions can run simultaneously on 
that compute context bank.

> 
>> +
>> +Example:
>> +
>> +fastrpc {
>> +	compatible = "qcom,fastrpc";
>> +	qcom,smd-channels = "fastrpcsmd-apps-dsp";
>> +	reg = <0>; /* DOMAIN_ADSP */
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	cb@1 {
>> +		compatible = "qcom,fastrpc-compute-cb";
>> +		reg = <1>;
>> +		iommus = <&lpass_q6_smmu 1>;
> 
> These iommus should be associated with the device (i.e. the DSP itself).

Currently the device model is via remoteproc bus followed by rpmsg bus 
(communication channel) and then each compute context banks instance is 
a platform device as children of the rpmsg channel device.


There are few practical issues though,

1> None of the parent buses (remoteproc/rpmsg) have ability to do a dma 
allocations or associate there child devices with iommus.

2> Each compute bank has its own iommu stream id associated with it. How 
can the parent bus associate this with each compute context bank 
instance? Given that we have more than one compute context banks in each 
dsp.
Are there any examples which already do this?

3> Are there already dt bindings which describe this parent bus handling 
all the iommu stream ids of child devices?



Thanks,
srini


> 
> Thanks,
> Mark.
> 
>> +	};
>> +
>> +	cb@2 {
>> +		compatible = "qcom,fastrpc-compute-cb";
>> +		reg = <2>;
>> +		iommus = <&lpass_q6_smmu 2>;
>> +	};
>> +	...
>> +};
>> -- 
>> 2.19.2
>>
