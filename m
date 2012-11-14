From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH V2 1/5] arm: mvebu: Added support for coherency fabric
 in mach-mvebu
Date: Wed, 14 Nov 2012 21:00:32 +0100
Message-ID: <50A3F860.5010601@free-electrons.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
 <20121105140258.GO3351@mudshark.cambridge.arm.com>
 <50A15A33.60405@free-electrons.com>
 <20121113104340.GD3940@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121113104340.GD3940@mudshark.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/13/2012 11:43 AM, Will Deacon wrote:
> On Mon, Nov 12, 2012 at 08:21:07PM +0000, Gregory CLEMENT wrote:
>> On 11/05/2012 03:02 PM, Will Deacon wrote:
>>> On Mon, Oct 29, 2012 at 09:11:44PM +0000, Gregory CLEMENT wrote:
>>>> +int set_cpu_coherent(unsigned int hw_cpu_id, int smp_group_id)
>>>> +{
>>>> +	int reg;
>>>> +
>>>> +	if (!coherency_base) {
>>>> +		pr_warn("Can't make CPU %d cache coherent.\n", hw_cpu_id);
>>>> +		pr_warn("Coherency fabric is not initialized\n");
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	/* Enable the CPU in coherency fabric */
>>>> +	reg = readl(coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
>>>> +	reg |= 1 << (24 + hw_cpu_id);
>>>> +	writel(reg, coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
>>>> +
>>>> +	/* Add CPU to SMP group */
>>>> +	reg = readl(coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
>>>> +	reg |= 1 << (16 + hw_cpu_id + (smp_group_id == 0 ? 8 : 0));
>>>> +	writel(reg, coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
>>>> +
>>>> +	return 0;
>>>> +}
>>>
>>> These writels may expand to code containing calls to outer_sync(), which
>>> will attempt to take a spinlock for the aurora l2. Given that the CPU isn't
>>> coherent, how does this play out with the exclusive store instruction in the
>>> lock?
>>
>> I dug a little this subject: and I am not sure there is problem. In SMP mode,
>> only the system cache mode of Aurora is used. In this mode, outer_cache.sync
>> is void then outer_sync() won't call any function, so there will be no
>> access to any spinlock.
> 
> Hmm, that is pretty subtle and it doesn't really solve the bigger picture.
> printk takes logbuf_lock, for example, and I'm sure that by the time you get
> to this code you will have relied on exclusives behaving correctly.
> 

Hi Will,
I get an answer from Marvell engineers:
"STREX on non-shareable and/or non-cacheable memory regions is supported."

Gregory
