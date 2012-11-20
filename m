From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V4 1/5] arm: mvebu: Added support for coherency fabric
 in mach-mvebu
Date: Tue, 20 Nov 2012 17:44:52 +0100
Message-ID: <50ABB384.4020106@free-electrons.com>
References: <1353357360-7242-1-git-send-email-gregory.clement@free-electrons.com>
 <1353357360-7242-2-git-send-email-gregory.clement@free-electrons.com>
 <20121120163243.GA27765@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121120163243.GA27765-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
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
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <Leif.Lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWOunwaRDDq4rA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/20/2012 05:32 PM, Will Deacon wrote:
> Hi Gregory,
> 
> Thanks for turning this around so quickly! I still have a few comments on
> your assembly, but you've got the right idea:

I was a little too quick I think: I have just passed
a few hours to fix a bug which appeared when I have added the HWIOCC
patches. But I see that you have already found it!

> 
> On Mon, Nov 19, 2012 at 08:35:55PM +0000, Gregory CLEMENT wrote:
>> From: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>>
>> Signed-off-by: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> [...]
> 
>> +/* Function defined in coherncy_ll.S */
>> +extern void ll_set_cpu_coherent(void __iomem *base_addr,
>> +				unsigned int hw_cpu_id);
>> +
>> +int set_cpu_coherent(unsigned int hw_cpu_id, int smp_group_id)
>> +{
>> +	if (!coherency_base) {
>> +		pr_warn("Can't make CPU %d cache coherent.\n", hw_cpu_id);
>> +		pr_warn("Coherency fabric is not initialized\n");
>> +		return 1;
>> +	}
>> +	ll_set_cpu_coherent(coherency_base, hw_cpu_id);
>> +	return 0;
>> +}
> 
> Yup, something like this is neater I reckon. You could even make
> ll_set_cpu_coherent return 0 if you wanted, but it's up to you.
> 
>> +#include <linux/linkage.h>
>> +#define ARMADA_XP_CFB_CTL_REG_OFFSET 0x0
>> +#define ARMADA_XP_CFB_CFG_REG_OFFSET 0x4
>> +
>> +	.text
>> +/*
>> + * r0: CFB base adresse register
> 
> address
> 
>> + * r1: HW CPU id
>> + */
>> +ENTRY(ll_set_cpu_coherent)
>> +	/* Create bit by cpu index */
>> +	add     r1,r1,#24
>> +	mov     r3, #1
> 
> Can you instead mov r3, #(1 << 24) and get rid of these two instructions?

I guess

> 
>> +	lsl     r1, r3, r1
>> +
>> +
>> +	/* Add CPU to SMP group - Atomic */
>> +	 orr	r0, r0, #ARMADA_XP_CFB_CTL_REG_OFFSET
> 
> An add might be clearer here, despite the address alignment.

Yes I have change it already, and I don't change r0 any more
as it is the base register: I was lucky that ARMADA_XP_CFB_CFG_REG_OFFSET
was equal to 0!

> 
>> +	ldr     r4, [r0]
>> +	orr     r4 , r4, r1
>> +	str	r4,[r0]
> 
> You haven't saved r4, so you can't use it here. It looks like you have r2
> spare -- why not use that instead?

True! And it was a bug in fact.
When I read the datasheet on PCS I stuck on the expression register 4,
which is r3 and not r4! :(
Now it's fixed and of course now I use r2
> 
>> +	/* Enable coherency on CPU - Atomic*/
>> +	orr	r0, r0, #ARMADA_XP_CFB_CFG_REG_OFFSET
> 
> add

yes I have already fixed it too.

> 
>> +	ldr     r4, [r0]
>> +	orr     r4 , r4, r1
>> +	str     r4,[r0]
> 
> mov	r0, #0 here if you want to return 0.

Well, why not.

> 
>> +	mov	pc, lr
>> +ENDPROC(ll_set_cpu_coherent)
> 
> Will
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
