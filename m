Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50878 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbeLJQM7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 11:12:59 -0500
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com> <20181210154426.GB6707@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
Date: Mon, 10 Dec 2018 18:14:36 +0200
MIME-Version: 1.0
In-Reply-To: <20181210154426.GB6707@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Tony,

On 10/12/2018 17.44, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [181210 14:49]:
>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 09:52]:
>>> On 10/12/2018 9.05, Peter Ujfalusi wrote:
>>>> Works fine on bbb + audio cape.
>>>> For some reason my am335x-evm-sk is not booting up at all w/ linux-next,
>>>> but I believe it is not related to this (disabled audio and still not
>>>> booting).
>>>
>>> bisect on next-20181207 (am335x-evm-sk) points to:
>>> Author: Tony Lindgren <tony@atomide.com>
>>> 87fc89ced3a78f7f0845afab1934d509ef4ad0f2
>>> ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc
>>>
>>> when looking for the non booting of am335x-evm-sk (nothing printed on
>>> serial after stating kernel).
>>
>> OK I'm pretty sure this is because we now need to move the gpio1
>> ti,no-reset-on-init up to the module level because of the DDR being
>> GPIO controlled. I'll send a patch out shortly for that.
>>
>> It might be also worth adding a check for having ti,no-reset-on-init
>> at the child level to ti-sysc driver too.
> 
> Looks like we have quite a few boards variants with probably
> DDR powered by a gpio1 pin. So let's fix the ti-sysc driver first,
> care to try the following patch?

am335x-evmsk is still not booting with this patch on top of next-20181210.

Fwiw 'git grep ti,no-reset-on-idle' yields no results...
Where it should be?

> 
> Regards,
> 
> Tony
> 
> 8< ---------------------------
> From tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Mon, 10 Dec 2018 07:26:04 -0800
> Subject: [PATCH] bus: ti-sysc: Check for no-reset and no-idle flags at the
>  child level
> 
> With ti-sysc, we need to now have the device tree properties for
> ti,no-reset-on-idle and ti,no-idle-on-init at the module level instead
> of the child device level.
> 
> Let's check for these properties at the child device level to enable
> quirks, and warn about moving the properties to the module level.
> 
> Otherwise am335x-evm based boards tagging gpio1 with ti,no-reset-on-init
> will have their DDR power disabled if wired up in such a tricky way.
> 
> Note that this should not be an issue for earlier kernels as we don't
> rely on this until the dts files have been updated to probe with ti-sysc
> interconnect target driver.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -91,6 +91,9 @@ struct sysc {
>  	struct delayed_work idle_work;
>  };
>  
> +static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
> +				  bool is_child);
> +
>  void sysc_write(struct sysc *ddata, int offset, u32 value)
>  {
>  	writel_relaxed(value, ddata->module_va + offset);
> @@ -379,6 +382,7 @@ static int sysc_check_one_child(struct sysc *ddata,
>  		dev_warn(ddata->dev, "really a child ti,hwmods property?");
>  
>  	sysc_check_quirk_stdout(ddata, np);
> +	sysc_parse_dts_quirks(ddata, np, true);
>  
>  	return 0;
>  }
> @@ -1279,23 +1283,37 @@ static const struct sysc_dts_quirk sysc_dts_quirks[] = {
>  	  .mask = SYSC_QUIRK_NO_RESET_ON_INIT, },
>  };
>  
> -static int sysc_init_dts_quirks(struct sysc *ddata)
> +static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
> +				  bool is_child)
>  {
> -	struct device_node *np = ddata->dev->of_node;
>  	const struct property *prop;
> -	int i, len, error;
> -	u32 val;
> -
> -	ddata->legacy_mode = of_get_property(np, "ti,hwmods", NULL);
> +	int i, len;
>  
>  	for (i = 0; i < ARRAY_SIZE(sysc_dts_quirks); i++) {
> -		prop = of_get_property(np, sysc_dts_quirks[i].name, &len);
> +		const char *name = sysc_dts_quirks[i].name;
> +
> +		prop = of_get_property(np, name, &len);
>  		if (!prop)
>  			continue;
>  
>  		ddata->cfg.quirks |= sysc_dts_quirks[i].mask;
> +		if (is_child) {
> +			dev_warn(ddata->dev,
> +				 "dts flag should be at module level for %s\n",
> +				 name);
> +		}
>  	}
> +}
> +
> +static int sysc_init_dts_quirks(struct sysc *ddata)
> +{
> +	struct device_node *np = ddata->dev->of_node;
> +	int error;
> +	u32 val;
> +
> +	ddata->legacy_mode = of_get_property(np, "ti,hwmods", NULL);
>  
> +	sysc_parse_dts_quirks(ddata, np, false);
>  	error = of_property_read_u32(np, "ti,sysc-delay-us", &val);
>  	if (!error) {
>  		if (val > 255) {
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
