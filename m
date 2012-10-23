From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 5/5] arm: mvebu: Added SMP support for Armada XP
Date: Tue, 23 Oct 2012 12:43:08 +0200
Message-ID: <508674BC.2070301@free-electrons.com>
References: <1350925368-24243-1-git-send-email-gregory.clement@free-electrons.com>
 <1350925368-24243-6-git-send-email-gregory.clement@free-electrons.com>
 <20121022184537.GN21046@lunn.ch> <50865F59.8000507@free-electrons.com>
 <20121023093029.GY11837@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121023093029.GY11837@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On 10/23/2012 11:30 AM, Andrew Lunn wrote:
> On Tue, Oct 23, 2012 at 11:11:53AM +0200, Gregory CLEMENT wrote:
>> On 10/22/2012 08:45 PM, Andrew Lunn wrote:
>>> Hi Gregory
>>>
>>>> +void __init set_secondary_cpus_clock(void)
>>>> +{
>>>> +	int cpu;
>>>> +	unsigned long rate;
>>>> +	struct clk *cpu_clk = NULL;
>>>> +	struct device_node *np = NULL;
>>>> +
>>>> +	cpu = smp_processor_id();
>>>> +	np = of_find_node_by_type(np, "cpu");
>>>> +	np = NULL;
>>>> +	while ((np = of_find_node_by_type(np, "cpu"))) {
>>>> +		const u32 *reg;
>>>> +		int len;
>>>> +		reg = of_get_property(np, "reg", &len);
>>>> +		if (!reg || len != 4) {
>>>> +			pr_err("%s missing reg property\n", np->full_name);
>>>> +			continue;
>>>> +		}
>>>> +		if (be32_to_cpup(reg) == cpu) {
>>>> +			cpu_clk = of_clk_get(np, 0);
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +	WARN_ON(IS_ERR(cpu_clk));
>>>> +	rate = clk_get_rate(cpu_clk);
>>>> +
>>>> +	/* set all the other CPU clk to the same rate than the boot CPU */
>>>> +	np = NULL;
>>>> +	while ((np = of_find_node_by_type(np, "cpu"))) {
>>>> +		const u32 *reg;
>>>> +		int len;
>>>> +		reg = of_get_property(np, "reg", &len);
>>>> +		if (!reg || len != 4) {
>>>> +			pr_err("%s missing reg property\n", np->full_name);
>>>> +			continue;
>>>> +		}
>>>> +		if (be32_to_cpup(reg) != cpu) {
>>>> +			cpu_clk = of_clk_get(np, 0);
>>>> +			clk_set_rate(cpu_clk, rate);
>>>> +		}
>>>
>>> Maybe its hiding somewhere, but where is the clk_prepare_enable() for
>>> this cpu_clk clock?
>>>
>>
>> Well the clocks are always enable. In the clock framework, the cpu clocks
>> don't provide an enable function.
> 
> Is it possible in the hardware to disable them? Turning them off might
> save some power. If these chips end up in some data center server, it
> might be that CPU hotplugging is used.

Well I didn't find anything about it. You can power off a CPU using the
PMSU but not the clock itself. I guess that once you have power off the
CPU the clock will be turned off as well.

> 
>> But maybe it is cleaner to call clk_prepare_enable() even if it does
>> nothing except update the usage count.
> 
> You also have to watch out for the late_initcall which will disable
> all clocks which are running but nobody has claimed. This will become
> an issue if you do have enable/disable function in later versions of
> the clock functions.

I don't think there will be enable/disable functions for the family
clock currently used (armada-xp-cpu-clockctrl). But in future if a new
version of mvebu SoC will use a new clock family which will have these
functions, then it will be an issue. So to be future proof I will ad
this call in the next version of the patch set.

> 
> 	Andrew
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
