From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] rtc: add support for NXP PCF85363 real-time clock
Date: Wed, 11 Oct 2017 08:08:31 -0700
Message-ID: <cc764cec-0f83-5d8f-d4b8-02f4b2cd8627@nelint.com>
References: <1507578100-2148-1-git-send-email-eric@nelint.com>
 <CAOMZO5C_boginn88C7zgXSBaikx==5FHJrgaE1ewYUyUgGfnFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5C_boginn88C7zgXSBaikx==5FHJrgaE1ewYUyUgGfnFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Otavio Salvador <otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 10/10/2017 06:31 AM, Fabio Estevam wrote:
> Hi Eric,
> 
> On Mon, Oct 9, 2017 at 4:41 PM, Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> +config RTC_DRV_PCF85363
>> +       tristate "NXP PCF85363"
>> +       depends on I2C
> 
> It seems you missed a dependency on REGMAP_I2C.
> 

Nice catch. Thanks.

>> +static const struct i2c_device_id pcf85363_id[] = {
>> +       { "pcf85363", 0 },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, pcf85363_id);
> 
> Even though the driver can probe via the i2c device id, it is
> recommended to explicitly pass the compatible string:
> 
> static const struct of_device_id pcf85363_dt_match[] = {
> { .compatible = "nxp,pcf85363" },
> { },
> 
> See this previous discussion:
> https://www.spinics.net/lists/devicetree/msg195176.html
> 
Thanks for that, too.

I'll fix this up in V2.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
