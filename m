From: Florian Fainelli <fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Thu, 7 May 2015 11:51:21 -0700
Message-ID: <554BB429.7090009@broadcom.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074> <20781942.cIPodTiNzG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20781942.cIPodTiNzG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/05/15 03:01, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
>> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
>>> On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
>>>> +       /*
>>>> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
>>>> +        * interesting ways
>>>> +        */
>>>> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
>>>> +               struct device_node *soc_dn;
>>>> +
>>>> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
>>>> +               if (!soc_dn)
>>>> +                       return -ENODEV;
>>>> +
>>>> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
>>>> +               if (!ctrl->soc) {
>>>> +                       dev_err(dev, "could not probe SoC data\n");
>>>> +                       of_node_put(soc_dn);
>>>> +                       return -ENODEV;
>>>> +               }
>>>> +
>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
>>>> +                                      DRV_NAME, ctrl);
>>>> +
>>>> +               /* Enable interrupt */
>>>> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
>>>> +
>>>> +               of_node_put(soc_dn);
>>>> +       } else {
>>>> +               /* Use standard interrupt infrastructure */
>>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
>>>> +                                      DRV_NAME, ctrl);
>>>> +       }
>>>>
>>>
>>> It looks to me like this should be handled as a nested irqchip, so the node
>>> you look up gets used as the "interrupt-parent" instead, making the behavior
>>> of this SoC transparent to the nand driver.
>>
>> You snipped the rest of the patch, which involves more than just IRQ
>> handling. The same registers touch both interrupts and data bus endian
>> configuration, so it can't possibly be done transparently to the NAND
>> driver.
> 
> Anything else in there? The bus configuration would just involve writing
> a constant value in some register, right? Doing that in the irqchip
> is also a bit ugly, but may still be better overall than doing it the
> way you have above.

IMHO this is uglier, having a pseudo interrupt controller driver that
also takes care of preparing bus transfers, as opposed to an ad-hoc
piece of code that does not pretend to be an interrupt controller at all
sounds like the former is lying about what it is, while the latter is
pretty straight forward even though it may duplicate an existing subsystem.

I would definitively see some value in writing an irqchip driver if this
was remotely useful outside of the NAND block, e.g: the interrupt bits
would serve other peripherals than NAND, which is not the case for 63138
and 338x AFAICT, Cygnus is a special case.

I could very well imagine a near future where this controller gets added
more features in the DMA/data-path that may require bus/chip-level glue
code to be interfaced properly between Broadcom's different internal
buses. In which case, the interrupt controller portion of the code could
be much smaller than the bus/data-path logic, would it still make sense
to pretend this to be an interrupt controller?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
