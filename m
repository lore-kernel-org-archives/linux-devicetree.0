From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/6] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Tue, 11 Dec 2018 10:50:33 +0000
Message-ID: <72b8d2b7-b4ef-448f-4e2c-e4c555c1f908@linaro.org>
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



On 07/12/18 18:23, Mark Rutland wrote:
>> +	cb@1 {
>> +		compatible = "qcom,fastrpc-compute-cb";
>> +		reg = <1>;
>> +		iommus = <&lpass_q6_smmu 1>;
> These iommus should be associated with the device (i.e. the DSP itself).

Are you referring to implement this using "iommu-map" and 
"iommu-map-mask" bindings on remoteproc/rpmsg bus?

--srini
