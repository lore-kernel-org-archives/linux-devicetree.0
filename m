From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] iio: adc: meson-saradc: mark all
 meson_sar_adc_data static and const
Date: Fri, 5 May 2017 23:17:14 +0200
Message-ID: <CAFBinCCQ=rhB9xrv7uPQhNFGHOCgSwEBFuCj1Xu-hVivdxu-Ng@mail.gmail.com>
References: <20170504180136.27025-1-martin.blumenstingl@googlemail.com>
 <20170504180136.27025-2-martin.blumenstingl@googlemail.com> <0DAF21CFE1B20740AE23D6AF6E54843F1E8BCDB2@IRSMSX101.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0DAF21CFE1B20740AE23D6AF6E54843F1E8BCDB2-kPTMFJFq+rF9qrmMLTLiibfspsVTdybXVpNB7YpNyf8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Langer, Thomas" <thomas.langer-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "knaack.h-Mmb7MZpHnFY@public.gmane.org" <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org" <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, "khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Thu, May 4, 2017 at 9:07 PM, Langer, Thomas <thomas.langer-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hello Martin,
>
>>
>> These are only passed as of_device_id.data and never modified. Thus we
>> can mark them as static const, just like the of_device_id instances
>> where they are used.
>
> Here you talk about static const, but in the code below the const is missing.
indeed - excellent catch, thank you! I'll fix this in v4

>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  drivers/iio/adc/meson_saradc.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iio/adc/meson_saradc.c
>> b/drivers/iio/adc/meson_saradc.c
>> index dd4190b50df6..1cb5df306001 100644
>> --- a/drivers/iio/adc/meson_saradc.c
>> +++ b/drivers/iio/adc/meson_saradc.c
>> @@ -834,17 +834,17 @@ static const struct iio_info meson_sar_adc_iio_info
>> = {
>>       .driver_module = THIS_MODULE,
>>  };
>>
>> -struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
>> +static struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
>>       .resolution = 10,
>>       .name = "meson-gxbb-saradc",
>>  };
>>
>> -struct meson_sar_adc_data meson_sar_adc_gxl_data = {
>> +static struct meson_sar_adc_data meson_sar_adc_gxl_data = {
>>       .resolution = 12,
>>       .name = "meson-gxl-saradc",
>>  };
>>
>> -struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>> +static struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>>       .resolution = 12,
>>       .name = "meson-gxm-saradc",
>>  };
>> --
>> 2.12.2
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
