From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] mfd: sec-core: Add support for S2MPS13 device
Date: Tue, 18 Nov 2014 17:33:02 +0900
Message-ID: <546B043E.5040000@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-2-git-send-email-cw00.choi@samsung.com>
 <20141118082207.GU24004@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141118082207.GU24004@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Lee,

On 11/18/2014 05:22 PM, Lee Jones wrote:
> On Mon, 17 Nov 2014, Chanwoo Choi wrote:
> 
>> This patch adds the support for Samsung S2MPS13 PMIC device to the sec-core MFD
>> driver. The S2MPS13 is very similar with existing S2MPS14 and includes PMIC/
>> RTC/CLOCK devices.
>>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/mfd/sec-core.c           | 18 ++++++++++++++++++
>>  drivers/mfd/sec-irq.c            | 23 +++++++++++++++++------
>>  include/linux/mfd/samsung/core.h |  1 +
>>  3 files changed, 36 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
>> index 5993608..48c0d4a 100644
>> --- a/drivers/mfd/sec-core.c
>> +++ b/drivers/mfd/sec-core.c
>> @@ -73,6 +73,17 @@ static const struct mfd_cell s2mps11_devs[] = {
>>  	}
>>  };
>>  
>> +static const struct mfd_cell s2mps13_devs[] = {
>> +	{
>> +		.name = "s2mps13-pmic",
>> +	}, {
>> +		.name = "s2mps13-rtc",
>> +	}, {
>> +		.name = "s2mps13-clk",
>> +		.of_compatible = "samsung,s2mps13-clk",
>> +	}
>> +};
> 
> If you have to resubmit this for any reason, I'd like the one liners
> on one single line (curly braces and all).

OK, I'll modify it as following:

static const struct mfd_cell s2mps13_devs[] = {
	{ .name = "s2mps13-pmic", },
	{ .name = "s2mps13-rtc", },
	{
		.name = "s2mps13-clk",
		.of_compatible = "samsung,s2mps13-clk",
	},
};

Best Regards,
Chanwoo Choi

> 
> But for now, for my reference:
> 
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
