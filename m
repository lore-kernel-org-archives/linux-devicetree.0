From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: atmel_nand: move the hsmc_clk from nfc node to nand node
Date: Thu, 26 Feb 2015 19:49:09 +0800
Message-ID: <C9CC8708-B99A-47F4-AC57-1A92B302E1C9@jcrosoft.com>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com> <20150226101857.59104e97@bbrezillon>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150226101857.59104e97@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On Feb 26, 2015, at 5:18 PM, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> Hi Josh,
> 
> On Tue, 10 Feb 2015 14:14:43 +0800
> Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> 
>> Also add a new sama5d3_nand compatiable string for sama5d3 nand.
>> 
>> For sama5d3, sama5d4 chip, the pmecc became part of HSMC, they need the
>> HSMC clock enabled to work.
>> The NFC is a sub feature for current nand driver, it can be disabled.
>> But if HSMC clock is controlled by NFC, so disable NFC will also disable
>> the HSMC clock. then, it will make the PMECC fail to work.
>> 
>> So the solution is move the HSMC clock out of NFC to nand node. When
>> nand driver probed, it will check whether the chip has HSMC, if yes then
>> it will require a HSMC clock.
> 
> Do you plan to use the NAND chip without the NFC (I mean, is there a
> reason for not using the NFC to access the NAND ?) ?
> If you don't, why don't you just wait for the NFC before probing the
> NAND chip it is attached to, so that the hmsc clk is properly claimed.
you can as you can have 2 Nand on the d3 but only 1 NFC

Best Regards,
J.
> 
> I'm not convinced that moving a clk reference out of the controller
> node can address the fact that the nand/nand-controller DT
> representation is inappropriate (your embedding controller specific
> information in your NAND chip definition).
> I think we should reconsider this problem with a controller/chip
> approach:
> - which parts are representing the NAND controller: the PMECC engine,
>  the NFC if available, ...
> - which parts are representing the NAND chip: the EBI mem range, the
>  R/B pin, the ALE/CLE information, ...
> 
> And of course, we should take the EBI/SMC rework into account ;-).
> 
> Best Regards,
> 
> Boris
> 
> 
> -- 
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
