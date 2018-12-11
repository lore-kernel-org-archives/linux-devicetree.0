From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/6] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Tue, 11 Dec 2018 09:27:02 +0000
Message-ID: <3533d3d6-d60f-452f-87bf-d5e89ac1a2bb@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-2-srinivas.kandagatla@linaro.org>
 <20181207182327.64mtkfx6v4wlwccz@lakrids.cambridge.arm.com>
 <afdeecc4-4ee9-e933-9917-9930ece85b00@linaro.org>
 <20181211001050.GA1578@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211001050.GA1578@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org



On 11/12/18 00:10, Bjorn Andersson wrote:
> [..]
>>>> +- reg
>>>> +	Usage: required
>>>> +	Value type: <u32>
>>>> +	Definition: DSP Processor ID.
>>>> +	Possible values are :
>>>> +			0 - ADSP
>>>> +			1 - MDSP
>>>> +			2 - SDSP
>>>> +			3 - CDSP
>>> Why is this in a reg?
>> This is to identify which type of dsp(Audio/Modem/Sensor/Compute) it is,
>> This information is used to create device nodes for user-space access.
>>
> But it does not represent FastRPC's address on the rpmsg bus. How about
> replacing it with a "label" (or "qcom,domain" perhaps?) of type string?

Yes, we could replace reg with label in this case. I don't have any 
particular preference TBH.

I did try to something similar to "qcom,domain" for apr and Rob H 
suggested to use reg instead during review!

thanks,
srini
