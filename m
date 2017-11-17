From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] omapdrm: hdmi4: Correct the SoC revision matching
Date: Fri, 17 Nov 2017 15:23:24 +0200
Message-ID: <9e104766-d224-f98b-8234-139f1280e63f@ti.com>
References: <20171117080043.19010-1-peter.ujfalusi@ti.com>
 <6b859419-62fa-a7ff-d3da-0a7dd03ddc11@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6b859419-62fa-a7ff-d3da-0a7dd03ddc11-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, jsarha-l0cyMroinI0@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2017-11-17 14:55, Tomi Valkeinen wrote:
> On 17/11/17 10:00, Peter Ujfalusi wrote:
>> I believe the intention of the commit 2c9fc9bf45f8
>> ("drm: omapdrm: Move FEAT_HDMI_* features to hdmi4 driver")
>> was to identify omap4430 ES1.x, omap4430 ES2.x and other OMAP4 revisions,
>> like omap4460.
>>
>> By using family=OMAP4 in the match the code will treat omap4460 ES1.x in a
>> same way as it would treat omap4430 ES1.x
>>
>> This breaks HDMI audio on OMAP4460 devices (PandaES for example).
>>
>> Correct the match rule so we are not going to get false positive match.
>>
>> Fixes: 2c9fc9bf45f8 ("drm: omapdrm: Move FEAT_HDMI_* features to hdmi4 driver")
>>
>> CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.14
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> index 62e451162d96..07945a40c33a 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> @@ -902,9 +902,20 @@ static const struct hdmi4_features hdmi4_es3_features = {
>>  };
>>  
>>  static const struct soc_device_attribute hdmi4_soc_devices[] = {
>> -	{ .family = "OMAP4", .revision = "ES1.?", .data = &hdmi4_es1_features },
>> -	{ .family = "OMAP4", .revision = "ES2.?", .data = &hdmi4_es2_features },
>> -	{ .family = "OMAP4",			  .data = &hdmi4_es3_features },
>> +	{
>> +		.machine = "OMAP4430",
>> +		.revision = "ES1.?",
>> +		.data = &hdmi4_es1_features,
>> +	},
>> +	{
>> +		.machine = "OMAP4430",
>> +		.revision = "ES2.?",
>> +		.data = &hdmi4_es2_features,
>> +	},
>> +	{
>> +		.family = "OMAP4",
>> +		.data = &hdmi4_es3_features,
>> +	},
>>  	{ /* sentinel */ }
>>  };
>>  
>>
> 
> Looks good to me.
> 
> Was there are reason to change the format from single-line to multi-line?

in one line it would beyond 80 and just breaking the .data to new line
looked ugly.

> While at it, I think it would make sense to rename hdmi4_es3_features
> to... hdmi4_features? It's not "ES3" in any way.

Yes, that would make sense, but then the hdmi4_es1/2 is not really
correct either as it should be omap4430_es1/2 ...

I'll resend it on Monday with this change.

> 
>  Tomi
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
