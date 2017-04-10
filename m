From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Date: Mon, 10 Apr 2017 18:52:19 +0200
Message-ID: <f9b4b8b0-4987-7f67-df3b-d32d6c130818@st.com>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-3-git-send-email-ludovic.Barre@st.com>
 <5ec38e39-661d-8a83-4168-b9f3d986bcd1@gmail.com>
 <601e2aa5-7cd3-34fb-660e-359f2a016b65@st.com>
 <9a0c5f8e-01dc-3d2b-5ebb-069752594e8e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <9a0c5f8e-01dc-3d2b-5ebb-069752594e8e@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

hi Marek

tomorrow, I send a v3 with your/Rob reviews.

BR

Ludo


On 04/10/2017 06:15 PM, Marek Vasut wrote:
> On 04/10/2017 11:08 AM, Ludovic BARRE wrote:
>> On 04/07/2017 01:55 AM, Marek Vasut wrote:
>>> On 03/31/2017 07:02 PM, Ludovic Barre wrote:
>>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>>
>>>> The quadspi is a specialized communication interface targeting single,
>>>> dual or quad SPI Flash memories.
>>>>
>>>> It can operate in any of the following modes:
>>>> -indirect mode: all the operations are performed using the quadspi
>>>>    registers
>>>> -read memory-mapped mode: the external Flash memory is mapped to the
>>>>    microcontroller address space and is seen by the system as if it was
>>>>    an internal memory
>>>>
>>>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>>>> ---
>>>>    drivers/mtd/spi-nor/Kconfig         |   7 +
>>>>    drivers/mtd/spi-nor/Makefile        |   1 +
>>>>    drivers/mtd/spi-nor/stm32-quadspi.c | 690
>>>> ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 698 insertions(+)
>>>>    create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
>>>>
>>> [...]
>>>
>>>> +struct stm32_qspi_flash {
>>>> +    struct spi_nor nor;
>>>> +    u32 cs;
>>>> +    u32 fsize;
>>>> +    u32 presc;
>>>> +    struct stm32_qspi *qspi;
>>>> +};
>>> [...]
>>>
>>>> +struct stm32_qspi_cmd {
>>>> +    struct {
>>>> +        u8 addr_width;
>>>> +        u8 dummy;
>>>> +        u8 data;
>>>> +    } conf;
>>> Is there any benefit in having this structure here or could you just
>>> make the struct stm32_qspi_cmd flat ?
>> no benefit, it was just to regroup,  so I can do a flat structure
> Well, as you like, but I think it does make sense to just make it flat.
>
>>>> +    u8 opcode;
>>>> +    u32 framemode;
>>>> +    u32 qspimode;
>>>> +    u32 addr;
>>>> +    size_t len;
>>>> +    void *buf;
>>>> +};
>>> [...]
>>>
>>>> +static ssize_t stm32_qspi_read(struct spi_nor *nor, loff_t from,
>>>> size_t len,
>>>> +                   u_char *buf)
>>>> +{
>>>> +    struct stm32_qspi_flash *flash = nor->priv;
>>>> +    struct stm32_qspi *qspi = flash->qspi;
>>>> +    struct stm32_qspi_cmd cmd;
>>>> +    int err;
>>>> +
>>>> +    dev_dbg(qspi->dev, "read(%#.2x): buf:%p from:%#.8x len:%#x\n",
>>>> +        nor->read_opcode, buf, (u32)from, len);
>>>> +
>>>> +    memset(&cmd, 0, sizeof(cmd));
>>>> +    cmd.opcode = nor->read_opcode;
>>>> +    cmd.conf.addr_width = nor->addr_width;
>>>> +    cmd.addr = (u32)from;
>>> loff_t (from) can be 64bit ... how do we handle this ?
>> I'm surprise by the question,
>> the SPI NOR device uses 3 Bytes or 4 bytes address mode.
>> So, the stm32 qspi controller has a 32 bit register for NOR address.
>> On the other hand the framework and other drivers used this variable
>> (from) like
>> a 32 bits.
> Hmmm, (rhetorical question) then why do we even use loff_t in the
> framework ?
>
> Anyway, this is no problem then.
In fact, the loff_t 64 bit come from mtd interface
(needed to address biggest device constraint) but not needed for spi-nor 
devices.
>>>> +    cmd.conf.data = 1;
>>>> +    cmd.conf.dummy = nor->read_dummy;
>>>> +    cmd.len = len;
>>>> +    cmd.buf = buf;
>>>> +    cmd.qspimode = qspi->read_mode;
>>>> +
>>>> +    stm32_qspi_set_framemode(nor, &cmd, true);
>>>> +    err = stm32_qspi_send(flash, &cmd);
>>>> +
>>>> +    return err ? err : len;
>>>> +}
>>> [...]
>>>
>>>> +static irqreturn_t stm32_qspi_irq(int irq, void *dev_id)
>>>> +{
>>>> +    struct stm32_qspi *qspi = (struct stm32_qspi *)dev_id;
>>>> +    u32 cr, sr, fcr = 0;
>>>> +
>>>> +    cr = readl_relaxed(qspi->io_base + QUADSPI_CR);
>>>> +    sr = readl_relaxed(qspi->io_base + QUADSPI_SR);
>>>> +
>>>> +    if ((cr & CR_TCIE) && (sr & SR_TCF)) {
>>>> +        /* tx complete */
>>>> +        fcr |= FCR_CTCF;
>>>> +        complete(&qspi->cmd_completion);
>>>> +    } else {
>>>> +        dev_info(qspi->dev, "spurious interrupt\n");
>>> You probably want to ratelimit this one ...
>> yes it's better if there is an issue.
> Yep
>
>>>> +    }
>>>> +
>>>> +    writel_relaxed(fcr, qspi->io_base + QUADSPI_FCR);
>>>> +
>>>> +    return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static int stm32_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>>> +{
>>>> +    struct stm32_qspi_flash *flash = nor->priv;
>>>> +    struct stm32_qspi *qspi = flash->qspi;
>>>> +
>>>> +    mutex_lock(&qspi->lock);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void stm32_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops
>>>> ops)
>>>> +{
>>>> +    struct stm32_qspi_flash *flash = nor->priv;
>>>> +    struct stm32_qspi *qspi = flash->qspi;
>>>> +
>>>> +    mutex_unlock(&qspi->lock);
>>>> +}
>>>> +
>>>> +static int stm32_qspi_flash_setup(struct stm32_qspi *qspi,
>>>> +                  struct device_node *np)
>>>> +{
>>>> +    u32 width, flash_read, presc, cs_num, max_rate = 0;
>>>> +    struct stm32_qspi_flash *flash;
>>>> +    struct mtd_info *mtd;
>>>> +    int ret;
>>>> +
>>>> +    of_property_read_u32(np, "reg", &cs_num);
>>>> +    if (cs_num >= STM32_MAX_NORCHIP)
>>>> +        return -EINVAL;
>>>> +
>>>> +    of_property_read_u32(np, "spi-max-frequency", &max_rate);
>>>> +    if (!max_rate)
>>>> +        return -EINVAL;
>>>> +
>>>> +    presc = DIV_ROUND_UP(qspi->clk_rate, max_rate) - 1;
>>>> +
>>>> +    if (of_property_read_u32(np, "spi-rx-bus-width", &width))
>>>> +        width = 1;
>>>> +
>>>> +    if (width == 4)
>>>> +        flash_read = SPI_NOR_QUAD;
>>>> +    else if (width == 2)
>>>> +        flash_read = SPI_NOR_DUAL;
>>>> +    else if (width == 1)
>>>> +        flash_read = SPI_NOR_NORMAL;
>>>> +    else
>>>> +        return -EINVAL;
>>>> +
>>>> +    flash = &qspi->flash[cs_num];
>>>> +    flash->qspi = qspi;
>>>> +    flash->cs = cs_num;
>>>> +    flash->presc = presc;
>>>> +
>>>> +    flash->nor.dev = qspi->dev;
>>>> +    spi_nor_set_flash_node(&flash->nor, np);
>>>> +    flash->nor.priv = flash;
>>>> +    mtd = &flash->nor.mtd;
>>>> +    mtd->priv = &flash->nor;
>>>> +
>>>> +    flash->nor.read = stm32_qspi_read;
>>>> +    flash->nor.write = stm32_qspi_write;
>>>> +    flash->nor.erase = stm32_qspi_erase;
>>>> +    flash->nor.read_reg = stm32_qspi_read_reg;
>>>> +    flash->nor.write_reg = stm32_qspi_write_reg;
>>>> +    flash->nor.prepare = stm32_qspi_prep;
>>>> +    flash->nor.unprepare = stm32_qspi_unprep;
>>>> +
>>>> +    writel_relaxed(LPTR_DFT_TIMEOUT, qspi->io_base + QUADSPI_LPTR);
>>>> +
>>>> +    writel_relaxed(CR_PRESC(presc) | CR_FTHRES(3) | CR_TCEN | CR_SSHIFT
>>>> +               | CR_EN, qspi->io_base + QUADSPI_CR);
>>>> +
>>>> +    /*
>>>> +     * in stm32 qspi controller, QUADSPI_DCR register has a fsize field
>>>> +     * which define the size of nor flash.
>>>> +     * if fsize is NULL, the controller can't sent spi-nor command.
>>>> +     * set a temporary value just to discover the nor flash with
>>>> +     * "spi_nor_scan". After, the right value (mtd->size) can be set.
>>>> +     */
>>> Is 25 the smallest value ? Use a macro for this ...
>> 25 is an arbitrary choice, I will define a smallest value
> Cool, thanks!
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
