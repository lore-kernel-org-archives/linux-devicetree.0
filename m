From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Mon, 21 Apr 2014 15:17:06 -0400
Message-ID: <53556EB2.80503@ti.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>	<20140419182528.414b9b2e@skate>	<53551E9D.9080107@ti.com> <20140421201911.10783191@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140421201911.10783191@skate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?ISO-8859-1?Q?Gregory_Cl=E9ment?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 21 April 2014 02:19 PM, Thomas Petazzoni wrote:
> Dear Santosh Shilimkar,
> 
> On Mon, 21 Apr 2014 09:35:25 -0400, Santosh Shilimkar wrote:
> 
>>> In mach-mvebu, what we do is that we register a bus notifier on the
>>> platform bus, so that we can set our custom DMA operations for all
>>> platform devices in the system. Should this be done in a different way
>>> after your series?
>>>
>> Nope. Since you have a very custom SOC specific case, you can continue
>> what you are doing.
> 
> True, but as you said, the goal is to remove machine code. So instead
> of having just a 'dma-coherent' property, shouldn't we have a
> dma-method property, which could be dma-method = "coherent" or
> dma-method = "marvell,io-coherent" and therefore allow the DT binding
> to cover more use cases than just the default non-coherent and coherent
> DMA operations?
> 
Please remember the infrastructure we are adding is not really for machines
(sub arch's) but for architectures. I don't think its worth adding methods
The whole reason of dma_ops being exported is take care of cases like yours
so we are just fine with that. If we see more cases likes your, we can
think about that.

regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
