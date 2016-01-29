From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V6 2/8] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Fri, 29 Jan 2016 16:29:54 +0530
Message-ID: <56AB462A.8090307@nvidia.com>
References: <1453988274-28052-1-git-send-email-ldewangan@nvidia.com> <1453988274-28052-3-git-send-email-ldewangan@nvidia.com> <20160129090632.GS3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160129090632.GS3368@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Lee for review.
I will take care of most of stuff on next version of patch.

However, I have some query form your comment.
On Friday 29 January 2016 02:36 PM, Lee Jones wrote:
> On Thu, 28 Jan 2016, Laxman Dewangan wrote:
>
>
>> +	}
>> +
>> +#define MAX20024_SUB_MODULE_NO_RES(_name, _id)			\
>> +	[_id] = {						\
>> +		.name = "max20024-"#_name,			\
>> +		.id = _id,					\
>> +	}
> I don't want people hand-rolling this stuff.  If it's useful to you,
> it's useful to others, so great a generic implementation that lives in
> the kernel headers directory.

yaah, generic implementation possible. I can put the new defines in the 
mfd/core.h.

This will be similar to
+/* Define mfd cells with name and resource */
+#define DEFINE_MFD_CELL_NAME_RESOURCE(_name, _res)             \
+       {                                                       \
+               .name = (_name),                                \
+               .num_resources = ARRAY_SIZE((res)),             \
+               .resources = (_res),                            \
+       }
+
+/* Define mfd cells with name */
+#define DEFINE_MFD_CELL_NAME(_name)                            \
+       {                                                       \
+               .name = (_name),                                \
+       }
+

This will be separate patch and should be applied before this series.
Does it look fine?


>
>> +static const struct i2c_device_id max77620_id[] = {
>> +	{"max77620", MAX77620},
>> +	{"max20024", MAX20024},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(i2c, max77620_id);
>> +
>> +static const struct of_device_id max77620_of_match[] = {
>> +	{
>> +		.compatible = "maxim,max77620",
>> +		.data = &max77620_cells,
>> +	}, {
>> +		.compatible = "maxim,max20024",
>> +		.data = &max20024_cells,
>> +	}, {
>> +	},
>> +};
>> +MODULE_DEVICE_TABLE(of, max77620_of_match);
> This is not acceptable.  EITHER use DT OR MFD methods of registering
> devices, do not mix the two.

You mean I need to either provide the i2c_device_id table or the 
of_device_id table, not both?
Do I need to protect it by CONFIG_OF?

This only support the DT method of registration. So do I need to remove 
i2c_device_id?





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
