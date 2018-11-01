From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PATCH] of: Fix cpu node iterator to not ignore disabled cpu
 nodes
Date: Thu, 1 Nov 2018 13:45:48 +0100
Message-ID: <1055f6ae-a25b-117a-e9e4-44dd4f978803@xenosoft.de>
References: <20181031144226.26747-1-robh@kernel.org>
 <87o9b9dphd.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9b9dphd.fsf@concordia.ellerman.id.au>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 01 November 2018 at 12:08PM, Michael Ellerman wrote:
> Rob Herring <robh@kernel.org> writes:
>
>> In most cases, nodes with 'status = "disabled";' are treated as if the
>> node is not present though it is a common bug to forget to check that.
>> However, cpu nodes are different in that "disabled" simply means offline
>> and the OS can bring the CPU core online. Commit f1f207e43b8a ("of: Add
>> cpu node iterator for_each_of_cpu_node()") followed the common behavior
>> of ignoring disabled cpu nodes. This breaks some powerpc systems (at
>> least NXP P50XX/e5500). Fix this by dropping the status check.
>>
>> Fixes: 651d44f9679c ("of: use for_each_of_cpu_node iterator")
>> Fixes: f1f207e43b8a ("of: Add cpu node iterator for_each_of_cpu_node()")
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>   drivers/of/base.c | 2 --
>>   1 file changed, 2 deletions(-)
> This fixes my machine, thanks.
>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au>
>
> It was actually originally reported to me by Christian, so also:
>
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>
>
> cheers
>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index cc62da278663..e47c5ce6cd58 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -776,8 +776,6 @@ struct device_node *of_get_next_cpu_node(struct device_node *prev)
>>   		if (!(of_node_name_eq(next, "cpu") ||
>>   		      (next->type && !of_node_cmp(next->type, "cpu"))))
>>   			continue;
>> -		if (!__of_device_is_available(next))
>> -			continue;
>>   		if (of_node_get(next))
>>   			break;
>>   	}
>> -- 
>> 2.19.1

Hi All,

Many thanks for your help! This patch fixes my P5020 board (dual core) 
and my virtual QEMU ppce500 machine (quad core).

Have a nice day!

Cheers,
Christian
