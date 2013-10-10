From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: s5m8767: Modify parse_dt function to parse
 data related to ramp
Date: Thu, 10 Oct 2013 20:10:53 +0900
Message-ID: <52568B3D.7020209@samsung.com>
References: <1381369296-17101-1-git-send-email-cw00.choi@samsung.com>
 <20131010102826.GG26954@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131010102826.GG26954-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/2013 07:28 PM, Mark Rutland wrote:
> On Thu, Oct 10, 2013 at 02:41:35AM +0100, Chanwoo Choi wrote:
>> This patch parse 'buck[2-4]_ramp_enable and buck_ramp_delay' platform data
>> from dts file.
> 
> Why?
> 
> What do these describe? Why do we need them?

Turn on ramp control of buck2/3/4.

> 
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/regulator/s5m8767.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
>> index c24448b..cb6cdb3 100644
>> --- a/drivers/regulator/s5m8767.c
>> +++ b/drivers/regulator/s5m8767.c
>> @@ -640,6 +640,22 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
>>  		return -EINVAL;
>>  	}
>>  
>> +	if (of_get_property(pmic_np, "s5m8767,pmic-buck2-ramp-enable", NULL))
>> +		pdata->buck2_ramp_enable = true;
> 
> Please describe what this is and why we need it.

buck2/3/4_ramp_enable is used to protect the chip from the in-rush current.

> 
> For reading boolean proeprties, use of_property_read_bool.

I'll fix it.

> 
>> +
>> +	if (of_get_property(pmic_np, "s5m8767,pmic-buck3-ramp-enable", NULL))
>> +		pdata->buck3_ramp_enable = true;
>> +
>> +	if (of_get_property(pmic_np, "s5m8767,pmic-buck4-ramp-enable", NULL))
>> +		pdata->buck4_ramp_enable = true;
>> +
>> +	if (pdata->buck2_ramp_enable || pdata->buck3_ramp_enable
>> +			|| pdata->buck4_ramp_enable) {
>> +		if (of_property_read_u32(pmic_np, "s5m8767,pmic-buck-ramp-delay",
>> +				&pdata->buck_ramp_delay))
>> +			pdata->buck_ramp_delay = 0;
> 
> Why not initialise pdata->buck_ramp_delay to 0 beforehand?
> 
> That way you don't need to check the return value of
> of_property_read_u32 here.
> 
> I note that pdata->buck_ramp_delay is an int, not a u32. Please use a
> u32 temporary variable.

I'll fix it

> 
>> +	}
>> +
> 
> NAK. None of these seem to be documented in mainline's
> Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt, nor
> does documentation seem to be added here. Until there's some description
> of what these are and why they're needed, I don't think they're
> suitable.

I'll add description about this patch.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
