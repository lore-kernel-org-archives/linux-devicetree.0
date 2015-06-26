From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v4 3/3] mfd: devicetree: bindings: Add new 88pm800 mfd
 binding
Date: Fri, 26 Jun 2015 11:43:41 +0530
Message-ID: <558CED95.8020903@linaro.org>
References: <1435217189-19578-1-git-send-email-vaibhav.hiremath@linaro.org> <1435217189-19578-4-git-send-email-vaibhav.hiremath@linaro.org> <20150626060520.GB32687@yizhang>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150626060520.GB32687@yizhang>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Friday 26 June 2015 11:35 AM, Yi Zhang wrote:
> On Thu, Jun 25, 2015 at 03:26:29PM +0800, Vaibhav Hiremath wrote:
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
>> +
>> +88pm8xx family of devices consists of varied group of sub-devices:
>    what about using "88pm80x family of devices..."?
>    for we also have another series of chip, with the name of 88pm88x..

I renamed it after Rob's suggestion, but at that time we didn't see
88pm88x coming.
But I think now, I should stick to 88pm800 only, as it doesn't make
match with both 88pm822 and 88pm860.

Rob, let me know if you think otherwise.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
