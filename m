From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] of/platform: return error on of_platform_device_create_pdata
 failure
Date: Tue, 13 May 2014 13:32:51 -0700
Message-ID: <53728173.7050508@gmail.com>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com> <1399499298-8830-3-git-send-email-robherring2@gmail.com> <20140513175603.GA27173@quad.lixom.net>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140513175603.GA27173@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Josh Cartwright <joshc@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn@kryo.se>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/13/2014 10:56 AM, Olof Johansson wrote:
> On Wed, May 07, 2014 at 04:48:16PM -0500, Rob Herring wrote:
>> From: Rob Herring <robh@kernel.org>
>>
>> of_platform_populate does not return an error if creating the platform
>> device fails. This means almost any error from driver core cannot be
>> detected by the caller. Fix this.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  drivers/of/platform.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 404d1da..622aeb3 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -391,7 +391,9 @@ static int of_platform_bus_create(struct device_node *bus,
>>  	}
>>  
>>  	dev = of_platform_device_create_pdata(bus, bus_id, platform_data, parent);
>> -	if (!dev || !of_match_node(matches, bus))
>> +	if (!dev)
>> +		return -ENODEV;
>> +	if (!of_match_node(matches, bus))
>>  		return 0;
>>  
>>  	for_each_child_of_node(bus, child) {
> 
> This patch caused every single MMC driver to break on OF platforms, as far
> as I can tell.  Reverting it on last night's -next seems to resolve it.
> 
> The problem seems to be that of_platform_populate() will bail on the
> first device that fails this.
> 
> How did you test this code, Frank? On what platform? Practically all my
> targets here failed to mount rootfs from eMMC or SD card...

I tested on a dragonboard, but without a working sdhci driver.  Thus I would not
have hit the error.

> 
> Note that the below patch mostly undoes the original intent of letting an error
> percolate up, since only the last rc value is actually returned. So I doubt
> it's the right patch to pick up, but either this or a revert is needed right
> now.
> 
> 
> -Olof
> 
> 
>>From f4cdc90a500a339e5b96ca06d108e1be7a808d76 Mon Sep 17 00:00:00 2001
> From: Olof Johansson <olof@lixom.net>
> Date: Tue, 13 May 2014 10:51:30 -0700
> Subject: [PATCH] of/platform: Don't abort of_platform_populate() early
> 
> 52c75b64a374 ('of/platform: return error on
> of_platform_device_create_pdata failure') starts returning ENODEV on
> some calls now, and that will make of_platform_populate terminate the
> loop. Be tolerant of that particlar error return value instead.
> 
> Fixes: 52c75b64a374 ('of/platform: return error on of_platform_device_create_pdata failure')
> Cc: Frank Rowand <frank.rowand@sonymobile.com>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  drivers/of/platform.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 8a6de3c..310de38 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -524,7 +524,7 @@ int of_platform_populate(struct device_node *root,
>  
>  	for_each_child_of_node(root, child) {
>  		rc = of_platform_bus_create(child, matches, lookup, parent, true);
> -		if (rc)
> +		if (rc && rc != -ENODEV)
>  			break;
>  	}
>  
> 
