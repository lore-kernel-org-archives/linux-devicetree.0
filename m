From: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [RFC PATCH 02/13] misc: atmel_ssc: keep the count of pdev->id
Date: Fri, 5 Jul 2013 17:16:03 +0200
Message-ID: <CACQ1gAj9bY9Tw2-Ps7-Bm2-gS0PY=hocRPvXCQhmcQ9-sKg1kQ@mail.gmail.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com>
 <1372667978-4718-3-git-send-email-richard.genoud@gmail.com> <51D24318.40908@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51D24318.40908@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

2013/7/2 Bo Shen <voice.shen@atmel.com>:
> Hi Richard,
>
>
> On 7/1/2013 16:39, Richard Genoud wrote:
>>
>> With device tree, pdev->id is always -1, so we introduce a local
>> counter.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>>   drivers/misc/atmel-ssc.c |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
>> index 3afbd82..d1ec5ab 100644
>> --- a/drivers/misc/atmel-ssc.c
>> +++ b/drivers/misc/atmel-ssc.c
>> @@ -173,6 +173,12 @@ out:
>>         return err;
>>   }
>>
>> +/* counter of ssc devive instances.
>> + * With device tree pdev->id is always -1, so we have to keep the
>> + * count ourselves
>> + */
>> +static int ssc_device_id;
>
>
> Do we really need this? If Yes, would it better to get from device through
> of_alias_get_id?

you're right, it seems that we don't need that anymore.

thanks !

Richard.
