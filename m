From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH v5 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Tue, 20 Jun 2017 07:01:32 +0200
Message-ID: <5023d338-f845-b8a6-c4a0-d414c75f841c@pengutronix.de>
References: <20170619050245.2632-1-o.rempel@pengutronix.de>
 <20170619050245.2632-4-o.rempel@pengutronix.de>
 <1497872109.5380.10.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497872109.5380.10.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org



On 19.06.2017 13:35, Leonard Crestez wrote:
> On Mon, 2017-06-19 at 07:02 +0200, Oleksij Rempel wrote:
>> Export pm_power_off_prepare. It is needed to implement power off on
>> Freescale/NXP iMX6 based boards with external power management
>> integrated circuit (PMIC).
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  kernel/reboot.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index bd30a973fe94..a6903bf772c7 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -49,6 +49,7 @@ int reboot_force;
>>   */
>>
>>  void (*pm_power_off_prepare)(void);
>> +EXPORT_SYMBOL(pm_power_off_prepare);
>>
> Could you register a reboot notifier in the pfuze driver instead? Right
> now the only user of pm_power_off_prepare is ACPI so this alternative
> seems less intrusive.

hm... in this case i will need to make sure that reboot handler is not 
executed on reboot. This will make code looks strange. Which is opposite 
of your comment in other email about strange standby code for power off :)
Should i really do this?
