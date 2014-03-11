From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3 3/5] pinctrl: st: add pinctrl support for the STiH407
 SoC
Date: Tue, 11 Mar 2014 09:52:37 +0100
Message-ID: <531ECED5.1000405@st.com>
References: <1394203251-25361-1-git-send-email-maxime.coquelin@st.com> <1394203251-25361-4-git-send-email-maxime.coquelin@st.com> <20140310144429.GA13661@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310144429.GA13661@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 03/10/2014 03:44 PM, Lee Jones wrote:
>> From: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
>>
>> This patch adds the initial support for pinctrl based on H407 SoC.
>>
>> Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
>
> SOBs should be in order of submission flow and author's should only be
> kept if the patch is unchanged. If it's been adapted you will require
> a re-review and they Acked-by or Reviewed-by tag.
>
>> ---
>>   drivers/pinctrl/pinctrl-st.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
>> index 1721611..d1886b4 100644
>> --- a/drivers/pinctrl/pinctrl-st.c
>> +++ b/drivers/pinctrl/pinctrl-st.c
>> @@ -390,6 +390,19 @@ static const struct st_pctl_data  stih416_data = {
>>   	.alt = 0, .oe = 40, .pu = 50, .od = 60, .rt = 100,
>>   };
>>
>> +static const struct st_pctl_data  stih407_flashdata = {
>
> Nit: Double space.
Fixed in upcoming v4.

>
>> +	.rt_style	= st_retime_style_none,
>> +	.input_delays	= stih416_delays,
>> +	.ninput_delays	= 14,
>
> ARRAY_SIZE(stih416_delays)
>
>> +	.output_delays	= stih416_delays,
>> +	.noutput_delays = 14,
>
> ARRAY_SIZE(stih416_delays)
Fixed too.

V4 will contain one more patch to fix this also in stih416_data.

>
>> +	.alt = 0,
>> +	.oe = -1, /* Not Available */
>> +	.pu = -1, /* Not Available */
>> +	.od = 60,
>> +	.rt = 100,
>> +};
>> +
>>   /* Low level functions.. */
>>   static inline int st_gpio_bank(int gpio)
>>   {
>> @@ -1596,6 +1609,10 @@ static struct of_device_id st_pctl_of_match[] = {
>>   	{ .compatible = "st,stih416-rear-pinctrl", .data = &stih416_data},
>>   	{ .compatible = "st,stih416-fvdp-fe-pinctrl", .data = &stih416_data},
>>   	{ .compatible = "st,stih416-fvdp-lite-pinctrl", .data = &stih416_data},
>> +	{ .compatible = "st,stih407-sbc-pinctrl", .data = &stih416_data},
>> +	{ .compatible = "st,stih407-front-pinctrl", .data = &stih416_data},
>> +	{ .compatible = "st,stih407-rear-pinctrl", .data = &stih416_data},
>> +	{ .compatible = "st,stih407-flash-pinctrl", .data = &stih407_flashdata},
>>   	{ /* sentinel */ }
>>   };
>
> After the small changes above, feel free to add my:
>    Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Added.

Thanks,
Maxime
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
