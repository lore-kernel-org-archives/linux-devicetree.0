From: Georgi Djakov <gdjakov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/5] clk: gcc: Add APQ8084 Global Clock Controller
 support
Date: Fri, 23 May 2014 17:18:40 +0300
Message-ID: <537F58C0.6090006@mm-sol.com>
References: <1400775885-10296-1-git-send-email-gdjakov@mm-sol.com> <1400775885-10296-4-git-send-email-gdjakov@mm-sol.com> <DB9EC1F3-CA2B-47C5-A677-CC1222F05614@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB9EC1F3-CA2B-47C5-A677-CC1222F05614-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/22/2014 07:38 PM, Kumar Gala wrote:
>
> On May 22, 2014, at 11:24 AM, Georgi Djakov <gdjakov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
>
>> This patch adds support for the global clock controller found on
>> the APQ8084 based devices.
>>
>> The APQ8084 and MSM8974 share a lot of clock data, so instead of
>> duplicating all the data, we add support to the MSM8974 code.
>>
>> Signed-off-by: Georgi Djakov <gdjakov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> ---
>> drivers/clk/qcom/Kconfig                     |    4 +-
>> drivers/clk/qcom/gcc-msm8974.c               |  151 +++++++++++++++++++++++++-
>> include/dt-bindings/clock/qcom,gcc-msm8974.h |    4 +
>> 3 files changed, 154 insertions(+), 5 deletions(-)
>
> What about differences in reset?

Oops, will add this too. Thanks!

BR,
Georgi



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
