From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: [PATCH v2 6/7] i2c: pxa: support i2c controller from DT
Date: Sat, 30 Jul 2011 04:29:50 -1000
Message-ID: <4E34155E.8010606@firmworks.com>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-5-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-6-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-7-git-send-email-haojian.zhuang@marvell.com>
	<20110729165222.GN11164@ponder.secretlab.ca>
	<20110729165547.GB30298@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110729165547.GB30298@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On 7/29/2011 6:55 AM, Russell King - ARM Linux wrote:
> On Fri, Jul 29, 2011 at 10:52:22AM -0600, Grant Likely wrote:
>> On Thu, Jul 28, 2011 at 02:41:32PM +0800, Haojian Zhuang wrote:
>>> -	/*
>>> -	 * If "dev->id" is negative we consider it as zero.
>>> -	 * The reason to do so is to avoid sysfs names that only make
>>> -	 * sense when there are multiple adapters.
>>> -	 */
>>> -	i2c->adap.nr = dev->id;
>>> -	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "pxa_i2c-i2c.%u",
>>> -		 i2c->adap.nr);
>>>
>>> -	i2c->clk = clk_get(&dev->dev, NULL);
>>> +	if (np) {
>>> +		i2c->adap.nr = idx++;
>>
>> Use this so that a bus number gets dynamically assigned:
>> 		i2c->adap.nr = -1;
>>
>>> +		snprintf(i2c->adap.name, sizeof(i2c->adap.name),
>>> +			"pxa2xx-i2c.%u", i2c->adap.nr);
>>> +		i2c->clk = clk_get_sys(i2c->adap.name, NULL);
>>
>> Missing i2c->adap.dev.of_node = dev->dev.of_node;
>
> And here we go again.  Is it really the case that this DT stuff doesn't
> have stable device names?

Device tree names are completely stable, based on hardware addresses 
that don't change from boot to boot.  Even for buses where access 
addresses are dynamically assigned, the device tree "reg property" 
address is based on a stable addressing form.  For example, PCI devices 
use the (stable) configuration address as the reg property and USB 
devices use the (stable) hub port number.

People's tendency to want to assign sequential small integers in Linux 
has nothing to do with the device tree.  I suspect that it's a carryover 
from the historical Unix major/minor device numbering model, but in any 
case, there's nothing unstable about the device tree naming model. 
Quite the opposite - stable naming was a fundamental criterion when I 
designed Open Firmware.

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
