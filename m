From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v2 2/6] Documentation: DT: Add optional 'timeout-sec'
 property for sp805
Date: Wed, 23 May 2018 16:51:12 -0700
Message-ID: <48dfe138-7bf5-3f91-0108-5b0ce3811ab7@broadcom.com>
References: <1527107527-8093-1-git-send-email-ray.jui@broadcom.com>
 <1527107527-8093-3-git-send-email-ray.jui@broadcom.com>
 <20180523222915.GA16779@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180523222915.GA16779@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 5/23/2018 3:29 PM, Guenter Roeck wrote:
> On Wed, May 23, 2018 at 01:32:03PM -0700, Ray Jui wrote:
>> Update the SP805 binding document to add optional 'timeout-sec'
>> devicetree property
>>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   Documentation/devicetree/bindings/watchdog/arm,sp805.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>> index de93a4d..9cd7470 100644
>> --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>> @@ -18,6 +18,8 @@ Required properties:
>>   
>>   Optional properties:
>>   - interrupts : Should specify WDT interrupt number.
>> +timeout-sec : Should specify default WDT timeout in seconds. If unset, the
>> +              default timeout in the driver is 30 seconds
> 
> That looks odd, with the changed indentation and the missing '-'
> in front of 'timeout-sec' >

My bad. Will fix this in v3. Thanks.

> Guenter
> 
