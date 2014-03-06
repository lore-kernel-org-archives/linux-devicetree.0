From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH] ARM: kernel: respect device tree status
 of cpu nodes
Date: Thu, 06 Mar 2014 10:00:10 +0000
Message-ID: <5318472A.5060700@codethink.co.uk>
References: <1393240960-31846-1-git-send-email-j@bitron.ch> <53178A03.3090004@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53178A03.3090004-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzon Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/03/14 20:33, Stephen Boyd wrote:
> +Lorenzo
>
> On 02/24/14 03:22, J=C3=BCrg Billeter wrote:
>> Skip 'disabled' cpu nodes when building the cpu logical map. This av=
oids
>> booting cpus that have been disabled in the device tree.
>>
>> Signed-off-by: J=C3=BCrg Billeter <j@bitron.ch>
>> Reviewed-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
>> ---
>>   arch/arm/kernel/devtree.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
>> index 739c3df..9aed299 100644
>> --- a/arch/arm/kernel/devtree.c
>> +++ b/arch/arm/kernel/devtree.c
>> @@ -95,6 +95,10 @@ void __init arm_dt_init_cpu_maps(void)
>>   		if (of_node_cmp(cpu->type, "cpu"))
>>   			continue;
>>
>> +		/* Check if CPU is enabled */
>> +		if (!of_device_is_available(cpu))
>> +			continue;
>> +
>>   		pr_debug(" * %s...\n", cpu->full_name);
>>   		/*
>>   		 * A device tree containing CPU nodes with missing "reg"
>
> This doesn't follow the ePAPR spec. According to ePAPR status=3D"disa=
bled"
> in a cpu node means "the cpu is in a quiescent state" and one can ena=
ble
> it by using the "enable-method". At the least, we should document thi=
s
> in bindings/arm/cpus.txt if we can all agree that we want this
> definition of disabled.

My view was that disabled should be the same as for the device case
as it makes sense that way.

We have a position where we want to use the .dtsi files but not all
cpus are available to the Linux. If we cannot use disabled then we
need some other method to say this cpu node is not available, so
please do not try and bring it online (saves boot time waiting for
CPU nodes that cannot online)

--=20
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
