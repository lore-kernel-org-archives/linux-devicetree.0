From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 09/14] irqchip/irq-mvebu-icu: add support for System
 Error Interrupts (SEI)
Date: Tue, 21 Aug 2018 10:19:04 +0100
Message-ID: <07e90507-1d51-6435-b006-c46f865a636c@arm.com>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-10-miquel.raynal@bootlin.com>
 <a88f62c0-7d7c-71da-fa45-487f7573dbb1@arm.com>
 <20180821110825.2fbec982@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180821110825.2fbec982@xps13>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 21/08/18 10:08, Miquel Raynal wrote:
> Hi Marc,
> 
> I'm fine with the rest of the comments, please find just one last
> question below.
> 
> [...]
> 
>>> @@ -133,12 +164,36 @@ mvebu_icu_irq_domain_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	/* Mask the type to prevent wrong DT configuration */
>>> -	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
>>> +	/*
>>> +	 * The ICU receives level-interrupts. MSI SEI are
>>> +	 * edge-interrupts while MSI NSR are level-interrupts. Update the type
>>> +	 * accordingly for the parent irqchip.
>>> +	 */
>>> +	if (msi_data->subset_data->icu_group == ICU_GRP_SEI)
>>> +		*type = IRQ_TYPE_EDGE_RISING;  
>>
>> That's interesting. How is the resampling done here?
> 
> I'm not sure to understand the question. What does 'resampling' means
> in such context? MSI SEIs are of type "edge" and use the traditional
> MSI signalling infrastructure. I'm asking to be sure not to ignore
> something wrong in my code.

You seems to be turning a level interrupt into an edge. You can do that,
but only if you resample the level on EOI (and regenerate the
corresponding edge if the level is still high).

Or am I reading it the wrong way?

	M.
-- 
Jazz is not dead. It just smells funny...
