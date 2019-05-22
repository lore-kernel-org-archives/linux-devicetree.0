Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10060 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbfEVHVX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 May 2019 03:21:23 -0400
Subject: Re: [PATCH] of: resered-memory: ignore disabled memory-region nodes
References: <1558503353-13179-1-git-send-email-puneets@nvidia.com>
 <1558503353-13179-2-git-send-email-puneets@nvidia.com>
 <20190522063812.GA24329@ulmo>
From: puneet saxena <puneets@nvidia.com>
Message-ID: <2f89938b-7795-3d93-b23f-4eca2b678483@nvidia.com>
Date: Wed, 22 May 2019 12:51:10 +0530
MIME-Version: 1.0
In-Reply-To: <20190522063812.GA24329@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, vdumpa@nvidia.com, snikam@nvidia.com
List-ID: <devicetree@vger.kernel.org>

Yes, of_device_is_available() will work here. Will incorporate in next PS.

Thanks.

On 22/05/19 12:08 PM, Thierry Reding wrote:
> On Wed, May 22, 2019 at 11:05:53AM +0530, Puneet Saxena wrote:
>> From: Krishna Reddy <vdumpa@nvidia.com>
>>
>> Ignore disabled nodes in the memory-region nodes list and continue
>> to initialize the rest of enabled nodes.
>>
>> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 1977ee0adcb1..58d95d774e3b 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -314,6 +314,7 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
>>   	struct device_node *target;
>>   	struct reserved_mem *rmem;
>>   	int ret;
>> +	const char *status;
>>   
>>   	if (!np || !dev)
>>   		return -EINVAL;
>> @@ -322,6 +323,10 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
>>   	if (!target)
>>   		return -ENODEV;
>>   
>> +	status = of_get_property(target, "status", NULL);
>> +	if (status && strcmp(status, "okay") != 0 && strcmp(status, "ok") != 0)
>> +		return 0;
>> +
> Does of_device_is_available() not work? Other than that, looks fine to
> me.
>
> Thierry

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
