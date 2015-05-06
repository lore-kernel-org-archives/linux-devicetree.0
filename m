From: nick <xerofoify@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Wed, 06 May 2015 17:00:09 -0400
Message-ID: <554A80D9.9080103@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
 <7101952.uOJDgn7tgf@wuerfel> <20150506204910.GJ32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20150506204910.GJ32500@ld-irv-0074>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 2015-05-06 04:49 PM, Brian Norris wrote:
> On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
>> On Wednesday 06 May 2015 10:59:50 Brian Norris wrote:
>>> +       /*
>>> +        * Some SoCs integrate this controller (e.g., its interrupt bits) in
>>> +        * interesting ways
>>> +        */
>>> +       if (of_property_read_bool(dn, "brcm,nand-soc")) {
>>> +               struct device_node *soc_dn;
>>> +
>>> +               soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
>>> +               if (!soc_dn)
>>> +                       return -ENODEV;
>>> +
>>> +               ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
>>> +               if (!ctrl->soc) {
>>> +                       dev_err(dev, "could not probe SoC data\n");
>>> +                       of_node_put(soc_dn);
>>> +                       return -ENODEV;
>>> +               }
>>> +
>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
>>> +                                      DRV_NAME, ctrl);
>>> +
>>> +               /* Enable interrupt */
>>> +               ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
>>> +
>>> +               of_node_put(soc_dn);
>>> +       } else {
>>> +               /* Use standard interrupt infrastructure */
>>> +               ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
>>> +                                      DRV_NAME, ctrl);
>>> +       }
>>>
>>
>> It looks to me like this should be handled as a nested irqchip, so the node
>> you look up gets used as the "interrupt-parent" instead, making the behavior
>> of this SoC transparent to the nand driver.
> 
> You snipped the rest of the patch, which involves more than just IRQ
> handling. The same registers touch both interrupts and data bus endian
> configuration, so it can't possibly be done transparently to the NAND
> driver.
> 
>> We recently merged nested irqdomain support as well, which might help here,
>> or might not be needed.
> 
> I'm not familiar with nested irqdomains. Do they address anything like
> the above problem?
> 
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
Brian,
I don't known about them myself :). However always check the Documentation folder of the kernel 
root for things like this. Further more I already checked there and it appears there is a file 
explaining the basics entitled, IRQ-domain.txt.
Hope this helps,
Nick  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
