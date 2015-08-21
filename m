From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Fri, 21 Aug 2015 06:04:30 +0200
Message-ID: <201508210604.30272.marex@denx.de>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55D299CD.2070809-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, August 18, 2015 at 04:34:53 AM, vikas wrote:
> Hi Marek,

Hi,

[...]

> > +#define CQSPI_POLL_IDLE_RETRY                  3
> > +
> > +#define CQSPI_REG_SRAM_RESV_WORDS              2
> > +#define CQSPI_REG_SRAM_PARTITION_WR            1
> 
> remove unused macros.
> 
> > +#define CQSPI_REG_SRAM_THRESHOLD_BYTES         50
> 
> the macro is used only for write sram watermark, something like
> ...WR_THRESH_BYTES would be better. Infact instead of magic number like
> 50, it should be based on sram_depth similar to read watermark
> configuration.

I suppose if the fifo falls below 1/8, that might be a sensible time to
trigger an underflow interrupt.

> > +
> > +/* Instruction type */
> > +#define CQSPI_INST_TYPE_SINGLE                 0
> > +#define CQSPI_INST_TYPE_DUAL                   1
> > +#define CQSPI_INST_TYPE_QUAD                   2
> > +
> > +#define CQSPI_DUMMY_CLKS_MAX                   31
> > +
> > +#define CQSPI_STIG_DATA_LEN_MAX                        8
> > +
> > +/* Register map */
> > +#define CQSPI_REG_CONFIG                       0x00
> > +#define CQSPI_REG_CONFIG_ENABLE_MASK           BIT(0)
> > +#define CQSPI_REG_CONFIG_DECODE_MASK           BIT(9)
> > +#define CQSPI_REG_CONFIG_CHIPSELECT_LSB                10
> > +#define CQSPI_REG_CONFIG_DMA_MASK              BIT(15)
> > +#define CQSPI_REG_CONFIG_BAUD_LSB              19
> > +#define CQSPI_REG_CONFIG_IDLE_LSB              31
> 
> To be consistent, it would be good to use BIT(nr) for all bit positions.

You don't use BIT() macro for bitfields and the above are bitfields.
Thus, this is not applicable.

> > +#define CQSPI_REG_CONFIG_CHIPSELECT_MASK       0xF
> > +#define CQSPI_REG_CONFIG_BAUD_MASK             0xF

[...]

> > +#define CQSPI_REG_CMDADDRESS                   0x94
> > +#define CQSPI_REG_CMDREADDATALOWER             0xA0
> > +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
> > +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
> > +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC
> 
> I am not sure if there is any recommended way but instread of register
> macros with offset, isn't it better to use something like struct cdns_qspi
> {
> 					u32 config,
> 					u32 rd_instn,
> 					....
> 				};
> & then configuring the pointer to this structure to the peripheral's (qspi
> controller in this case) base address.

U-Boot is slowly abolishing this practice as it turned out to be a horrible
mistake, which is annoying to deal with . No, I will not do this.

> It helps in debugging also as you can have all registers under one
> structure, easy/clean access of register like cdsn_qspi_ptr->config
> instead of adding offset for every access & also clean picture of all
> peripheral registers.

Once you have three similar controllers with only one register mapped
elsewhere, you'd need three such structures. This approach does look
nice at first, but certainly does not scale.

> > +
> > +/* Interrupt status bits */
> > +#define CQSPI_REG_IRQ_MODE_ERR                 BIT(0)
> > +#define CQSPI_REG_IRQ_UNDERFLOW                        BIT(1)
> > +#define CQSPI_REG_IRQ_IND_COMP                 BIT(2)
> > +#define CQSPI_REG_IRQ_IND_RD_REJECT            BIT(3)
> > +#define CQSPI_REG_IRQ_WR_PROTECTED_ERR         BIT(4)
> > +#define CQSPI_REG_IRQ_ILLEGAL_AHB_ERR          BIT(5)
> > +#define CQSPI_REG_IRQ_WATERMARK                        BIT(6)
> > +#define CQSPI_REG_IRQ_IND_RD_OVERFLOW          BIT(12)

[...]

> > +
> > +static unsigned int cqspi_check_timeout(const unsigned long timeout)
> > +{
> > +       return time_before(jiffies, timeout);
> > +}
> 
> try to replace using blocking jiffies check using kernel timeout function.
> 

What function do you refer to ?

[...]

> > +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> > +                                      u8 *rxbuf, const unsigned n_rx)
> > +{
> > +       struct cqspi_flash_pdata *f_pdata = nor->priv;
> > +       struct cqspi_st *cqspi = f_pdata->cqspi;
> > +       void __iomem *reg_base = cqspi->iobase;
> > +       void __iomem *ahb_base = cqspi->ahb_base;
> > +       unsigned int remaining = n_rx;
> > +       unsigned int reg = 0;
> > +       unsigned int bytes_to_read = 0;
> > +       unsigned int timeout;
> > +       int ret = 0;
> > +
> > +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> > +
> > +       /* Clear all interrupts. */
> > +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> > +
> > +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
> > +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
> 
> here interrupt mask is being configured for every read, better would be to
> move it in init.

It certainly would not, it is configured differently for READ and WRITE.

> > +
> > +       reinit_completion(&cqspi->transfer_complete);
> > +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
> > +              reg_base + CQSPI_REG_INDIRECTRD);
> > +
> > +       while (remaining > 0) {
> > +               ret =

[...]

> > +static void cqspi_controller_init(struct cqspi_st *cqspi)
> > +{
> > +       cqspi_controller_disable(cqspi);
> > +
> > +       /* Configure the remap address register, no remap */
> > +       writel(0, cqspi->iobase + CQSPI_REG_REMAP);
> > +
> > +       /* Disable all interrupts. */
> > +       writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
> > +
> > +       /* Configure the SRAM split to 1:1 . */
> > +       writel(cqspi->fifo_depth / 2, cqspi->iobase +
> > CQSPI_REG_SRAMPARTITION); +
> > +       /* Load indirect trigger address. */
> 
> almost all comments of this function seems unnecessary.

I disagree, having sensible comments in code makes my life easier after
I have to revisit the code a few years later.

> > +       writel(cqspi->trigger_address,
> > +              cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
> > +
> > +       /* Program read and write watermark. */
> > +       writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
> > +              cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
> > +       writel(CQSPI_REG_SRAM_THRESHOLD_BYTES,
> > +              cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);

[...]

Best regards,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
