From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 1/5] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Fri, 8 Feb 2019 12:28:58 +0000
Message-ID: <6d3b6d2f-8ba1-fe87-ffbe-7a82c4a680db@linaro.org>
References: <20190201130925.27066-1-srinivas.kandagatla@linaro.org>
 <20190201130925.27066-2-srinivas.kandagatla@linaro.org>
 <20190208122113.GG23483@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208122113.GG23483@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org



On 08/02/2019 12:21, Greg KH wrote:
> On Fri, Feb 01, 2019 at 01:09:21PM +0000, Srinivas Kandagatla wrote:
>> The FastRPC driver implements an IPC (Inter-Processor Communication)
>> mechanism that allows for clients to transparently make remote method
>> invocations across DSP and APPS boundaries. This enables developers
>> to offload tasks to the DSP and free up the application processor for
>> other tasks.
>>
>> Co-developed-by: Thierry Escande<thierry.escande@linaro.org>
>> Signed-off-by: Thierry Escande<thierry.escande@linaro.org>
>> Signed-off-by: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
>> Reviewed-by: Rob Herring<robh@kernel.org>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.txt | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> What changed from v4?  v2?  v3?
> 
I have done that in cover letter w.r.t previous versions,

Changes since v4(https://patchwork.kernel.org/cover/10779341/) :
- collected acks for DT from Rob.
- Removed unnecessary list safe iteration spotted by Greg KH.
- Removed unnecessary syslog spams.
- Added more checks to input validity.


> That needs to be somewhere in here, below the --- line or in the 00
> email at the least to give us some idea of what is different.
> 
> v6 please?
Sure, I can send v6 with full change log from RFC in cover letter along 
with some minor fixes.


thanks,
srini
