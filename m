From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: Add support for S2MPA01 device
Date: Wed, 8 Jan 2014 14:51:15 +0530
Message-ID: <CAK9yfHyDNfRcn4J6N5u=CbVHsRqCp5LSgUavsD1p7Gjp+m9dfQ@mail.gmail.com>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
	<20140108090208.GD19974@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108090208.GD19974@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

Thanks for the review.

On 8 January 2014 14:32, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Add the necessary entries required for S2MPA01 multi-function
>> device. While at it also convert whitespaces to tabs in core.h.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/mfd/sec-core.c              |   39 +++++++
>>  include/linux/mfd/samsung/core.h    |   16 ++-
>>  include/linux/mfd/samsung/irq.h     |   50 +++++++++
>>  include/linux/mfd/samsung/s2mpa01.h |  192 +++++++++++++++++++++++++++++++++++
>>  4 files changed, 292 insertions(+), 5 deletions(-)
>>  create mode 100644 include/linux/mfd/samsung/s2mpa01.h
>>
>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
>> index a139798b8065..d2e890d50a36 100644
>> --- a/drivers/mfd/sec-core.c
>> +++ b/drivers/mfd/sec-core.c
>> @@ -26,6 +26,7 @@
>>  #include <linux/mfd/samsung/core.h>
>>  #include <linux/mfd/samsung/irq.h>
>>  #include <linux/mfd/samsung/rtc.h>
>> +#include <linux/mfd/samsung/s2mpa01.h>
>>  #include <linux/mfd/samsung/s2mps11.h>
>>  #include <linux/mfd/samsung/s5m8763.h>
>>  #include <linux/mfd/samsung/s5m8767.h>
>> @@ -69,6 +70,13 @@ static const struct mfd_cell s2mps11_devs[] = {
>>       }
>>  };
>>
>> +static const struct mfd_cell s2mpa01_devs[] = {
>> +     {
>> +             .name = "s2mpa01-pmic",
>> +     },
>> +};
>> +
>> +
>
> Extra '/n' here.

Right. Will remove it.

>
>>  #ifdef CONFIG_OF
>>  static struct of_device_id sec_dt_match[] = {
>>       {       .compatible = "samsung,s5m8767-pmic",
>> @@ -77,10 +85,25 @@ static struct of_device_id sec_dt_match[] = {
>>       {       .compatible = "samsung,s2mps11-pmic",
>>               .data = (void *)S2MPS11X,
>>       },
>> +     {       .compatible = "samsung,s2mpa01-pmic",
>> +             .data = (void *)S2MPA01,
>> +     },
>
> Can you use the same format at the rest of the file.
>
> I'm happy for you to fix the entire struct in this patch.
>
> Rest of the file uses overlapping format:

Sure. I formatted it as per the current structure without noticing the others.
Will change it.

>
>         }, {
>                 .compatible = "samsung,s2mpa01-pmic",
>         },
>
>
> <snip>
>
>> @@ -92,7 +93,7 @@ struct sec_platform_data {
>>       int                             buck3_default_idx;
>>       int                             buck4_default_idx;
>>
>> -     int                             buck_ramp_delay;
>> +     int                             buck_ramp_delay;
>
> What's this? Are you fixing (or breaking) white space here?

I didn't get you. I have converted spaces to tabs here. See some problem?


-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
