From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: memreserve first 4KB for SMP code
Date: Thu, 14 Aug 2014 15:56:53 -0500
Message-ID: <53ED2295.3020700@opensource.altera.com>
References: <1408031491-15609-1-git-send-email-dinguyen@opensource.altera.com> <1408031491-15609-4-git-send-email-dinguyen@opensource.altera.com> <20140814185432.GE11558@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140814185432.GE11558-tWAi6jLit6GreWDznjuHag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, vbridger-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 8/14/14, 1:54 PM, Pavel Machek wrote:
> On Thu 2014-08-14 10:51:31, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> The SOCFPGA's SMP code uses 0x0 for as the location for the trampoline to
>> bring secondary cores online. This patch adds a /memreserve/ section to
>> reserve the first 4K for the SMP trampoline code.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/socfpga_arria5.dtsi   | 1 +
>>  arch/arm/boot/dts/socfpga_cyclone5.dtsi | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_arria5.dtsi b/arch/arm/boot/dts/socfpga_arria5.dtsi
>> index 468fc4c..73b939e 100644
>> --- a/arch/arm/boot/dts/socfpga_arria5.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_arria5.dtsi
>> @@ -15,6 +15,7 @@
>>   */
>>  
>>  /dts-v1/;
>> +/memreserve/ 0x00000000 0x0001000;
> 
> Actually, comment here explaining that ROM code uses 0x0 for the
> trampoline would be nice here... if I understand it correctly.

Sure...I'll add a single line comment.

Dinh
> 
> Thanks,
> 									Pavel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
