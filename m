From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 2/5] media: ov5695: add support for OV5695 sensor
Date: Wed, 10 Jan 2018 09:08:04 +0800
Message-ID: <155c9971-f5a5-b79e-4c32-70d2bfccd098@rock-chips.com>
References: <1515509304-15941-1-git-send-email-zhengsq@rock-chips.com>
 <1515509304-15941-3-git-send-email-zhengsq@rock-chips.com>
 <20180109165440.droexlfysvtyt6kl@tarshish>
Reply-To: zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109165440.droexlfysvtyt6kl@tarshish>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,


On 2018年01月10日 00:54, Baruch Siach wrote:
> Hi Shunqian Zheng,
>
> On Tue, Jan 09, 2018 at 10:48:21PM +0800, Shunqian Zheng wrote:
>> +static int ov5695_write_array(struct i2c_client *client,
>> +			      const struct regval *regs)
>> +{
>> +	u32 i;
>> +	int ret = 0;
>> +
>> +	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
>> +		ret = ov5695_write_reg(client, regs[i].addr,
>> +				       OV5695_REG_VALUE_08BIT, regs[i].val);
> This loop should stop on first failure, and return the error value. With
> current code a register write failure is masked by following writes.
This loop will stop once ret != 0 as in for loop condition

Thanks,
>
>> +
>> +	return ret;
>> +}
> baruch
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
