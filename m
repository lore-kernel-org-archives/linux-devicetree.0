From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3] rtc: add support for NXP PCF85363 real-time clock
Date: Mon, 6 Nov 2017 07:32:19 -0700
Message-ID: <597958de-7ef0-d715-450c-384cfe2dedd0@nelint.com>
References: <CAL_Jsq+QQK=NTMBwk=h0uszLW0uSiEd1fmF09USRNFM-2VgiSQ@mail.gmail.com>
 <1509548480-29472-1-git-send-email-eric@nelint.com>
 <20171104160836.bah5su2ld5ckycr3@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171104160836.bah5su2ld5ckycr3-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/04/2017 09:08 AM, Alexandre Belloni wrote:
> On 01/11/2017 at 08:01:20 -0700, Eric Nelson wrote:

<snip>

>>
>> V3 adds interrupts as an optional property in device tree bindings
>>
>>   drivers/rtc/Kconfig                                |  13 ++
>>   drivers/rtc/Makefile                               |   1 +
>>   drivers/rtc/rtc-pcf85363.c                         | 221 +++++++++++++++++++++
>>   4 files changed, 252 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/pcf85363.txt
>>   create mode 100644 drivers/rtc/rtc-pcf85363.c
>>
> 
> I've tested it (thanks to Fabio, I received one a few weeks ago)
> 
> Applied with the following change:
> 
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -194,7 +194,6 @@ static int pcf85363_probe(struct i2c_client *client,
>          pcf85363->nvmem_cfg.reg_write = pcf85363_nvram_write;
>          pcf85363->nvmem_cfg.priv = pcf85363;
>          pcf85363->rtc->nvmem_config = &pcf85363->nvmem_cfg;
> -       pcf85363->rtc->nvram_old_abi = true;
>          pcf85363->rtc->ops = &rtc_ops;
>   
>          return rtc_register_device(pcf85363->rtc);
> 
> nvram_old_abi must not be used for new drivers and will generate warning
> when the (undocumented) ABI is used anyway.
> 

Thanks Alexandre (and Fabio).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
