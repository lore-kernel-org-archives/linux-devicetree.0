From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] device-tree: nexus7-flo: Remove power gpio key entry and
 use pmic8xxx-pwrkey
Date: Wed, 13 Apr 2016 10:34:48 -0700
Message-ID: <CALAqxLU79bGTGUZbB+yu=k4Pf2d8KaEyNkaWJ8SRewXu+7SQ4Q@mail.gmail.com>
References: <1460567784-28017-1-git-send-email-john.stultz@linaro.org>
	<570E80CA.3080100@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570E80CA.3080100-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 10:24 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 13/04/16 18:16, John Stultz wrote:
>>
>> Since the pmic8xxx-pwrkey driver is already supported in the
>> qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
>> configure proper device shutdown when ps_hold goes low, it is
>> better to use that driver then a generic gpio button.
>>
>> Thus this patch remove the gpio power key entry here, so we
>> don't get double input events from having two drivers enabled.
>>
>> The one gotcha with the pmic8xxx-pwrkey is it has a fairly
>> long debounce delay, which we shorten here to make the button
>> behave as expected.
>>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
>> b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
>> index c535b3f..7ac1c65 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
>> @@ -29,12 +29,6 @@
>>
>>         gpio-keys {
>>                 compatible = "gpio-keys";
>> -               power {
>> -                       label = "Power";
>> -                       gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
>> -                       linux,code = <KEY_POWER>;
>> -                       gpio-key,wakeup;
>
>
> You are dropping wakeup with this change. Is that intentional ?
>
> If not, while you are at this, replace it with "wakeup-source"
> which is standard binding.

Thanks for catching this. Its not intentional, but I don't have
suspend/resume working yet on the n7 so I've never really tested it.

I'll add wakeup-source to the pwrkey entry for the next version.

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
