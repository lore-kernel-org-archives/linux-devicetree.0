From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 1/7] ARM: davinci,
 intc: Add OF support for TI interrupt controller
Date: Tue, 29 May 2012 15:07:50 +0200
Message-ID: <4FC4CA26.8000403@denx.de>
References: <1330945804-3379-1-git-send-email-hs@denx.de>
 <1330945804-3379-2-git-send-email-hs@denx.de>
 <20120526010518.C82F03E2164@localhost>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120526010518.C82F03E2164@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Grant,

Am 26.05.2012 03:05, schrieb Grant Likely:
> On Mon,  5 Mar 2012 12:09:58 +0100, Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>  wrote:
>> Add a function to initialize the Common Platform Interrupt Controller
>> (cp_intc) from TI used on OMAP-L1x SoCs using a device tree node.
>>
>> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
>> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>
>> Cc: Sergei Shtylyov<sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> - changes for v2:
>> - add comment from Grant Likely:
>>    - migrate the whole interrupt controller to natively use an
>>      irq_domain. Rebased complete patchserie to:
>>      git://git.secretlab.ca/git/linux-2.6.git irqdomain/next
>>
>>      commit 3a806bfcde2cc3e4853f2807b2e3c94e7ccaf450
>>      Author: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>      Date:   Fri Jan 27 06:44:34 2012 -0700
>>
>>      irq_domain: mostly eliminate slow-path revmap lookups
>> - changes for v3:
>>    - add comments from Sergei Shtylyov:
>>      - rename compatible" prop to "ti,cp_intc"
>
> Nit: DT preference is to use '-' instead of '_'

fixed.

[...]
>> diff --git a/Documentation/devicetree/bindings/arm/davinci/intc.txt b/Documentation/devicetree/bindings/arm/davinci/intc.txt
>> new file mode 100644
>> index 0000000..dfd6a560
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/davinci/intc.txt
>> @@ -0,0 +1,27 @@
[...]
>> +- compatible : should be:
>> +	"ti,cp_intc"
>> +- interrupt-controller : Identifies the node as an interrupt controller
>> +- #interrupt-cells : Specifies the number of cells needed to encode an
>> +  interrupt source. The type shall be a<u32>  and the value shall be 1.
>
> Is there any configuration for irq inputs (edge/level) or are they
> fixed mode?  If configurable, then you'll want another cell for flags.

As I know, they are fixed...

[...]
>> diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
>> index f83152d..585114a 100644
>> --- a/arch/arm/mach-davinci/cp_intc.c
>> +++ b/arch/arm/mach-davinci/cp_intc.c
>> @@ -9,9 +9,14 @@
[...]
>> +		/* create a legacy host */
>> +		cp_intc_domain = irq_domain_add_legacy(node, num_irq,
>> +					irq_base, 0,&cp_intc_host_ops, NULL);
>> +		if (cp_intc_domain == NULL) {
>> +			pr_err("CP INTC: failed to allocate irq host!\n");
>> +			return -EINVAL;
>> +		}
>> +	} else {
>> +		/* Set up genirq dispatching for cp_intc */
>> +		for (i = 0; i<  num_irq; i++) {
>> +			irq_set_chip(i,&cp_intc_irq_chip);
>> +			set_irq_flags(i, IRQF_VALID | IRQF_PROBE);
>> +			irq_set_handler(i, handle_edge_irq);
>> +		}
>
> Instead of the else clause here, even the non-DT mode should still
> call irq_domain_add.  irq_domain is not just for DT.  It gets the
> driver away from manually managing its irq mappings.

Ok, I try this.

>>   	/* Enable global interrupt */
>>   	cp_intc_write(1, CP_INTC_GLOBAL_ENABLE);
>> +
>> +	return 0;
>> +}
>> +
>> +#ifdef CONFIG_OF
>> +static struct of_device_id irq_match[] __initdata = {
>> +	{ .compatible = "ti,cp_intc", .data = __cp_intc_init, },
>> +	{ }
>> +};
>> +
>> +void __init cp_intc_init(void)
>> +{
>> +	of_irq_init(irq_match);
>> +}
>> +#else
>> +void __init cp_intc_init(void)
>> +{
>> +	__cp_intc_init(NULL, NULL);
>>   }
>> +#endif
>
> Nack on this hunk because it means you have either a DT kernel or a
> non-DT kernel.  Turning on CONFIG_OF must not break booting on a
> non-DT platform.  This is a policy decision to improve test coverage.
> Instead the init hook should check at runtime if a DT is available,
> and if it is call of_irq_init.  Otherwise call __cp_initc_init()
> directly.

fixed in v4

Thanks for the review!

bye,
Heiko

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
