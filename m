From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 10:33:08 +0200
Message-ID: <4DABF744.4010209@monstr.eu>
References: <1302774106-32764-1-git-send-email-monstr@monstr.eu>
	<20110414165931.GA19228@pengutronix.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110414165931.GA19228-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

Wolfram Sang wrote:
> Hi Michal,
> 
> On Thu, Apr 14, 2011 at 11:41:46AM +0200, Michal Simek wrote:
>> Support OF support. "generic-uio" compatible property is used.
> 
> This description is not true anymore. Please also add a short paragrpah how it
> is intended to be used now.

ok.

> 
>> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> 
>> +		uioinfo->version = "dt";
> 
> Minor nit: "devicetree" is probably more descriptive.

no problem to change it

> 
>> +
>> +		/* Multiple IRQs are not supported */
>> +		if (pdev->num_resources > 1) {
>> +			struct resource *r = &pdev->resource[1];
> 
> Are you sure the irq-ressource is always [1]?  (Similar question for the
> if()-block above). Try platform_get_irq().

I wasn't aware about platform_get_irq. You are right.

What "if()-block above" are you talking about?
Above is kzalloc uioinfo allocation.
I am going to send v3 that's why please comment this there.

> 
>> +#ifdef CONFIG_OF
>> +/*
>> + * Empty match table for of_platform binding
> 
> While it probably doesn't make change to put every supported device in
> upstream, it still deosn't technically have to be empty. So, mabye drop this
> comment and add something like "/* empty for now */" to the table?

ok, done.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
