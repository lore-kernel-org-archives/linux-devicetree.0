From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] mfd: add MAX8907 core driver
Date: Thu, 26 Jul 2012 15:14:21 -0600
Message-ID: <5011B32D.1080102@wwwdotorg.org>
References: <1343331630-27126-1-git-send-email-swarren@wwwdotorg.org>
 <20120726203526.GD4560@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120726203526.GD4560-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-4qAbB/aHxuBWk0Htik3J/w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/26/2012 02:35 PM, Mark Brown wrote:
> On Thu, Jul 26, 2012 at 01:40:30PM -0600, Stephen Warren wrote:

>> +		if (!irqd_irq_disabled(d) && (value & irq_data->offs)) {
> 
> This looks very suspicious...  why do we need to call 
> irqd_irq_disabled() here?

I believe the status register reflects the unmasked status, it's just
the interrupt signal that's affected by the mask.

>> +static void max8907_irq_enable(struct irq_data *data) +{ +	/*
>> Everything happens in max8907_irq_sync_unlock */ +}
> 
>> +static void max8907_irq_disable(struct irq_data *data) +{ +	/*
>> Everything happens in max8907_irq_sync_unlock */ +}
> 
> The fact that these functions are empty is the second part of the
> above suspicous check for disabled IRQs.  We're just completely
> ignoring the caller here.  What would idiomatically happen is that
> we'd update a variable here then write it out in the unmask.
> 
> If these functions really should be empty then they should be
> omitted.
> 
>> +static int max8907_irq_set_wake(struct irq_data *data, unsigned
>> int on) +{ +	/* Everything happens in max8907_irq_sync_unlock */ 
>> + +	return 0; +}
> 
> Again, this doesn't look clever at all.

So the idea here was that the IRQ core is already maintaining state
which describes which IRQs are enabled/disabled and wake/not. Rather
than have irq_enable/irq_disable/set_wake do nothing but save the same
state to irq_chip-specific structures, I removed the body of those
functions and instead just call irqd_irq_disabled() etc. wherever I
would have accessed the "local" state. Is that not a legitimate design
then?
