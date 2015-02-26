From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH 01/12] ARM: dts: apq8064: add RPM regulators support
Date: Thu, 26 Feb 2015 13:20:17 -0800
Message-ID: <CAJAp7OjYicY2dZ3V9n_dGS_V3EPjH4SrniqOUBxdZn+EmyW7gw@mail.gmail.com>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1424678093-12966-1-git-send-email-srinivas.kandagatla@linaro.org>
	<54EF748B.3090404@codeaurora.org>
	<54EF7D74.7060906@linaro.org>
	<54EF7DFD.9020609@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54EF7DFD.9020609-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 26, 2015 at 12:11 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 02/26/15 12:09, Srinivas Kandagatla wrote:
>>
>>
>> On 26/02/15 19:31, Stephen Boyd wrote:
>>> On 02/22/15 23:54, Srinivas Kandagatla wrote:
>>>> +            pm8921_s5: pm8921-s5 {
>>>> +                compatible    = "qcom,rpm-pm8921-ftsmps";
>>>> +                reg        = <QCOM_RPM_PM8921_SMPS5>;
>>>> +            };
>>>> +
>>>> +            pm8921_s6: pm8921-s6 {
>>>> +                compatible    = "qcom,rpm-pm8921-ftsmps";
>>>> +                reg        = <QCOM_RPM_PM8921_SMPS6>;
>>>> +            };
>>>> +
>>>
>>> There's no RPM control for S5 and S6. Please remove. Also, has this been
>>> tested?
>>>
>> Ahh. these are SAW regulators, I will remove it from the list.
>> Obviously, I did not test all the regulators.
>
> There are some more that don't seem to match what we have downstream.
> L26 is also SAW related, and the usb and hdmi switches are "locally"
> controlled via ssbi pmic writes.
>

According to msm-3.4 all three are controlled by pm8xxx-regulator, but
they are also exposed through the RPM - which I think I tested (a year
ago or so).

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
