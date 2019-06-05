From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v2 2/2] irqchip: al-fic: Introduce Amazon's Annapurna Labs
 Fabric Interrupt Controller Driver
Date: Wed, 5 Jun 2019 17:38:13 +0300
Message-ID: <553d06a4-a6b6-816f-b110-6ef7f300dde4@amazon.com>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
 <1559731921-14023-3-git-send-email-talel@amazon.com>
 <fa6e5a95-d9dd-19f6-43e3-3046e0898bda@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa6e5a95-d9dd-19f6-43e3-3046e0898bda@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, nicolas.ferre@microchip.com, jason@lakedaemon.net, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, talel@amazon.com
List-Id: devicetree@vger.kernel.org

Thanks, will publish the fixes on v3.

On 6/5/2019 3:22 PM, Marc Zyngier wrote:
> Talel,
>
> On 05/06/2019 11:52, Talel Shenhar wrote:
>> The Amazon's Annapurna Labs Fabric Interrupt Controller has 32 inputs
>> lines. A FIC (Fabric Interrupt Controller) may be cascaded into another FIC
> Really? :-(

Cascading is used for control path events. For data path the HW is not 
cascaded (and usually even configured in MSI-X instead of wire interrupts)


>
> +}
> +
> +static int al_fic_irq_set_type(struct irq_data *data, unsigned int flow_type)
> +{
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
> +	struct al_fic *fic = gc->private;
> +	enum al_fic_state new_state;
> +	int ret = 0;
> +
> +	irq_gc_lock(gc);
> +
> +	if (!(flow_type & IRQ_TYPE_LEVEL_HIGH) &&
> +	    !(flow_type & IRQ_TYPE_EDGE_RISING)) {
> And what if this gets passed EDGE_BOTH?

FIC only support two sensing modes, rising-edge and level.

>
>> +	 * This is generally fixed depending on what pieces of HW it's wired up
>> +	 * to.
>> +	 *
>> +	 * We configure it based on the sensitivity of the first source
>> +	 * being setup, and reject any subsequent attempt at configuring it in a
>> +	 * different way.
> Is that a reliable guess? It also strikes me that the DT binding doesn't
> allow for the trigger type to be passed, meaning the individual drivers
> have to request the trigger as part of their request_irq() call. I'd
> rather you have a complete interrupt specifier in DT, and document the
> various limitations of the HW.

Indeed we use interrupt specifier that has the level type in it 
(dt-binding: "#interrupt-cells: must be 2.") which in turns causes to 
this irq_set_type callback.

Part of the FICs are connected to hws that generate pulse (for those, 
FIC shall be configured to rising-edge-triggered) and the others to hws 
that keep the line up (for those the FIC shall be configured to 
level-triggered).

>
>> +	 */
>> +	if (fic->state == AL_FIC_CLEAN) {
>> +		al_fic_set_trigger(fic, gc, new_state);
>> +	} else if (fic->state != new_state) {
>> +		pr_err("fic %s state already configured to %d\n",
>> +		       fic->name, fic->state);
>> +		ret = -EPERM;
> Same as above.

Those error messages are control path messages. if we return the same 
error value from here and from the previous error, how can we 
differentiate between the two error cases by looking at the log?

Having informative printouts seems like a good idea for bad 
configuration cases as such, wouldn't you agree?
