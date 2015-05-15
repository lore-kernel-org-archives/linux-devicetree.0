From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] edac, altera: Addition of Arria10 EDAC
Date: Fri, 15 May 2015 12:57:56 +0200
Message-ID: <2896031.Yz7YCP9E71@wuerfel>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com> <1431553787-27741-4-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431553787-27741-4-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 16:49:46 tthayer@opensource.altera.com wrote:
> +static int a10_unmask_irq(struct platform_device *pdev, u32 mask)
> +{
> +       void __iomem  *sm_base;
> +
> +       if (!devm_request_mem_region(&pdev->dev, A10_SYMAN_INTMASK_CLR,
> +                                    sizeof(u32), dev_name(&pdev->dev))) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                           "Unable to request mem region\n");
> +               return -EBUSY;
> +       }
> +
> +       sm_base = devm_ioremap(&pdev->dev, A10_SYMAN_INTMASK_CLR,
> +                              sizeof(u32));
> +       if (!sm_base) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                           "Unable to ioremap device\n");
> +
> +               return -ENOMEM;
> +       }
> +
> +       iowrite32(mask, sm_base);
> +
> +       devm_iounmap(&pdev->dev, sm_base);
> +       devm_release_mem_region(&pdev->dev, A10_SYMAN_INTMASK_CLR,
> +                               sizeof(u32));
> +
> +       return 0;
> +}

If you always unmap right away, better use the normal request_mem_region
and ioremap functions rather than their devm counterparts.


>  
> +       /* Only the Arria10 has separate IRQs */
> +       if (irq2 > 0) {
> +               /* Arria10 specific initialization */
> +               res = a10_init(mc_vbase);
> +               if (res < 0)
> +                       goto err2;
> +
> +               res = a10_unmask_irq(pdev, A10_DDR0_IRQ_MASK);
> +               if (res < 0)
> +                       goto err2;
> +
> +               res = devm_request_irq(&pdev->dev, irq2,
> +                                      altr_sdram_mc_err_handler,
> +                                      IRQF_SHARED, dev_name(&pdev->dev), mci);
> +               if (res < 0) {
> +                       edac_mc_printk(mci, KERN_ERR,
> +                                      "Unable to request irq %d\n", irq2);
> +                       res = -ENODEV;
> +                       goto err2;
> +               }
> +               irqflags = IRQF_SHARED;
> +       }
> +
> 

Should the unmask be done after the request?

	Arnd
