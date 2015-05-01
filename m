From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: vexpress: Add interrupt-affinity
Date: Fri, 01 May 2015 14:44:45 +0100
Message-ID: <5543834D.6040506@arm.com>
References: <1430416448-25203-1-git-send-email-r.schwebel@pengutronix.de> <20150430175541.GL15254@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430175541.GL15254-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 30/04/15 18:55, Robert Schwebel wrote:
> On Thu, Apr 30, 2015 at 07:54:08PM +0200, Robert Schwebel wrote:
>> Without this property, we get this boot warning:
>>
>> [    0.459361] CPU PMU: Failed to parse <no-node>/interrupt-affinity[0]
>>
>> Signed-off-by: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

May be you can also mention the commit introducing the change in the log
something like:

"
Commit 9fd85eb502a7 ("ARM: pmu: add support for interrupt-affinity
property") added optional optional "interrupt-affinity" property, to
specify CPU affinity for each SPI listed in the interrupts property.

Without this property, we get this boot warning:
	CPU PMU: Failed to parse <no-node>/interrupt-affinity[0]

This patch add interrupt-affinity to the PMU node in CA9x4 device tree.
"

Otherwise:
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

>
> However, with this patch applied, the messages above disappear, but I
> still get this:
>
> [    0.495280] CPU PMU: Failed to find logical CPU for cpu
>
> on a kernel configured with CONFIG_SMP=n. nr_cpu_ids is 1 there, while
> the loop still loops over all available cores. Ths makes the logic fail.

This is a different issue. You must also see warning from devtree.c when
parsing CPUs complaining about more CPU nodes found in DT. IIUC the
functionality still works fine.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
