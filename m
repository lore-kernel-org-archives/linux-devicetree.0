Return-Path: <SRS0=IYfX=QC=martingkelly.com=martin@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: document open-drain property
References: <20190122020431.5338-1-martin@martingkelly.com>
 <20190122020431.5338-4-martin@martingkelly.com>
 <20190126201958.0448e660@archlinux>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <ef9a2b58-372f-c3e8-8ae8-86b5045e7b0c@martingkelly.com>
Date: Sat, 26 Jan 2019 15:31:51 -0800
MIME-Version: 1.0
In-Reply-To: <20190126201958.0448e660@archlinux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 1/26/19 12:19 PM, Jonathan Cameron wrote:
> On Mon, 21 Jan 2019 18:04:29 -0800
> Martin Kelly <martin@martingkelly.com> wrote:
> 
>> From: Martin Kelly <martin@martingkelly.com>
>>
>> We have added an optional boolean property for configuring a BMI160
>> interrupt pin as open-drain, as opposed to the default push-pull, so
>> document this.
>>
>> Signed-off-by: Martin Kelly <martin@martingkelly.com>
>> ---
>>   Documentation/devicetree/bindings/iio/imu/bmi160.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> index 1aec19997fb5..7eb4b6016404 100644
>> --- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
>> @@ -12,6 +12,8 @@ Optional properties:
>>    - interrupts : interrupt mapping for IRQ
>>    - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
>>      input, set to "INT2" if INT2 pin should be used instead
>> +- bmi160,open-drain : set if the specified interrupt pin should be configured as
>> +  open drain. If not set, defaults to push-pull.
> I missed this before, but normally we prefix with a manufacturer rather than
> a particular part number.  Maybe that changed when I wasn't looking though!
> 
> Anyhow, these DT binding changes all need devicetree maintainer reviews as they
> aren't totally trivial.
> 

Yep, devicetree is on this thread. Rob, should I prefix with device name 
("bmi160") or manufacturer ("bosch")?

> Thanks,
> 
> Jonathan
> 
>>   
>>   Examples:
>>   
> 
