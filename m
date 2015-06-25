From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v4 3/3] mfd: devicetree: bindings: Add new 88pm800 mfd
 binding
Date: Thu, 25 Jun 2015 16:52:14 +0530
Message-ID: <558BE466.3090408@linaro.org>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org> <1435217189-19578-4-git-send-email-vaibhav.hiremath@linaro.org> <20150625102823.GD15013@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150625102823.GD15013@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thursday 25 June 2015 03:58 PM, Lee Jones wrote:
> On Thu, 25 Jun 2015, Vaibhav Hiremath wrote:
>
>> With addition of DT support to 88pm800 mfd driver, this patch
>> adds new DT binding documentation along with respective properties.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/88pm800.txt | 54 +++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Documentation/devicetree/bindings/mfd/88pm800.txt
>> new file mode 100644
>> index 0000000..f56b751
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
>> @@ -0,0 +1,54 @@
>> +* Marvell 88PM8xx Power Management IC
>> +
>> +Required parent device properties:
>> +- compatible : "marvell,88pm800", "marvell,88pm805", "marvell,88pm860"
>> +- reg : the I2C slave address for the 88pm8xx chip
>> +- interrupts : IRQ line for the 88pm8xx chip
>> +- interrupt-controller: describes the 88pm8xx as an interrupt controller
>> +- #interrupt-cells : should be 1.
>> +		- The cell is the 88pm8xx local IRQ number
>
> Might just be a personal thing, but I would line up the ':', it's much
> easier on the eyes that way.

Ok,

>
>> +88pm8xx family of devices consists of varied group of sub-devices:
>> +
>> +Device		 	Supply Names	 Description
>> +------		 	------------	 -----------
>> +88pm80x-onkey		:		: On key
>> +88pm80x-rtc		:		: RTC
>> +88pm80x-regulator	:		: Regulators
>> +
>> +Note: More device list will follow
>
> No real need for this.
>

I deliberately added it, as I was sure i would get comment if I only
put e devices in the list. And guess what, as expected I got comment.

Anyway, I agree and Will remove it.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
