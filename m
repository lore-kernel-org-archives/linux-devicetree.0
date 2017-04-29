From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-ccn: Add bindings info for CCN-502
 compatible string
Date: Fri, 28 Apr 2017 21:07:39 -0700
Message-ID: <1d697f53-8712-0378-b2ba-91537da5b56c@broadcom.com>
References: <1486759368-24067-1-git-send-email-velibor.markovski@broadcom.com>
 <1486759368-24067-2-git-send-email-velibor.markovski@broadcom.com>
 <20170214174833.GK23718@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170214174833.GK23718@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark/Pawel,

I think this patch series has been missed.

On 17-02-14 09:48 AM, Mark Rutland wrote:
> On Fri, Feb 10, 2017 at 12:42:47PM -0800, Velibor Markovski wrote:
>> Add CCN-502 to the list of supported devices by ARM CCN PMU driver.
>>
>> Signed-off-by: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> I assume Pawel will take this along with the driver patch.
Could you please pick up this patch series?

>
> Thanks,
> Mark.
>
>> ---
>>  Documentation/devicetree/bindings/arm/ccn.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/ccn.txt b/Documentation/devicetree/bindings/arm/ccn.txt
>> index b100d38..2980145 100644
>> --- a/Documentation/devicetree/bindings/arm/ccn.txt
>> +++ b/Documentation/devicetree/bindings/arm/ccn.txt
>> @@ -3,6 +3,7 @@
>>  Required properties:
>>
>>  - compatible: (standard compatible string) should be one of:
>> +	"arm,ccn-502"
>>  	"arm,ccn-504"
>>  	"arm,ccn-508"
>>
>> --
>> 1.9.1
>>

Thanks,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
