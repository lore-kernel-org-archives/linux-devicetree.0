From: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND
 flash controller driver
Date: Wed, 7 Nov 2018 12:08:58 +0100
Message-ID: <70f99d79-a9d8-0651-d464-2d81b334dbfb@st.com>
References: <1538732520-2800-1-git-send-email-christophe.kerello@st.com>
 <1538732520-2800-3-git-send-email-christophe.kerello@st.com>
 <20181105173905.385dd06e@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105173905.385dd06e@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Boris,


On 11/5/18 5:39 PM, Boris Brezillon wrote:
> Hi Christophe,
> 
> On Fri, 5 Oct 2018 11:41:59 +0200
> <christophe.kerello@st.com> wrote:
> 
> A few more comments.
> 
>> +/* Sequencer read/write configuration */
>> +static void stm32_fmc2_rw_page_init(struct nand_chip *chip, int page,
>> +				    int raw, bool write_data)
>> +{
>> +	struct stm32_fmc2 *fmc2 = nand_get_controller_data(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	u32 csqcfgr1, csqcfgr2, csqcfgr3;
>> +	u32 csqar1, csqar2;
>> +	u32 ecc_offset = mtd->writesize + FMC2_BBM_LEN;
>> +	u32 pcr = readl_relaxed(fmc2->io_base + FMC2_PCR);
>> +
>> +	if (write_data)
>> +		pcr |= FMC2_PCR_WEN;
>> +	else
>> +		pcr &= ~FMC2_PCR_WEN;
>> +	writel_relaxed(pcr, fmc2->io_base + FMC2_PCR);
>> +
>> +	/*
>> +	 * - Set Program Page/Page Read command
>> +	 * - Enable DMA request data
>> +	 * - Set timings
>> +	 */
>> +	csqcfgr1 = FMC2_CSQCFGR1_DMADEN | FMC2_CSQCFGR1_CMD1T;
>> +	if (write_data)
>> +		csqcfgr1 |= FMC2_CSQCFGR1_CMD1(NAND_CMD_SEQIN);
>> +	else
>> +		csqcfgr1 |= FMC2_CSQCFGR1_CMD1(NAND_CMD_READ0) |
>> +			    FMC2_CSQCFGR1_CMD2EN |
>> +			    FMC2_CSQCFGR1_CMD2(NAND_CMD_READSTART) |
>> +			    FMC2_CSQCFGR1_CMD2T;
>> +
>> +	/*
>> +	 * - Set Random Data Input/Random Data Read command
>> +	 * - Enable the sequencer to access the Spare data area
>> +	 * - Enable  DMA request status decoding for read
>> +	 * - Set timings
>> +	 */
>> +	if (write_data)
>> +		csqcfgr2 = FMC2_CSQCFGR2_RCMD1(NAND_CMD_RNDIN);
>> +	else
>> +		csqcfgr2 = FMC2_CSQCFGR2_RCMD1(NAND_CMD_RNDOUT) |
>> +			   FMC2_CSQCFGR2_RCMD2EN |
>> +			   FMC2_CSQCFGR2_RCMD2(NAND_CMD_RNDOUTSTART) |
>> +			   FMC2_CSQCFGR2_RCMD1T |
>> +			   FMC2_CSQCFGR2_RCMD2T;
>> +	if (!raw) {
>> +		csqcfgr2 |= write_data ? 0 : FMC2_CSQCFGR2_DMASEN;
>> +		csqcfgr2 |= FMC2_CSQCFGR2_SQSDTEN;
>> +	}
>> +
>> +	/*
>> +	 * - Set the number of sectors to be written
>> +	 * - Set timings
>> +	 */
>> +	csqcfgr3 = FMC2_CSQCFGR3_SNBR(chip->ecc.steps - 1);
>> +	if (write_data) {
>> +		csqcfgr3 |= FMC2_CSQCFGR3_RAC2T;
>> +		if (chip->chipsize > SZ_128M)
>> +			csqcfgr3 |= FMC2_CSQCFGR3_AC5T;
>> +		else
>> +			csqcfgr3 |= FMC2_CSQCFGR3_AC4T;
>> +	}
>> +
>> +	/*
>> +	 * Set the fourth first address cycles
>> +	 * Byte 1 and byte 2 => column, we start at 0x0
>> +	 * Byte 3 and byte 4 => page
>> +	 */
>> +	csqar1 = FMC2_CSQCAR1_ADDC3(page);
>> +	csqar1 |= FMC2_CSQCAR1_ADDC4(page >> 8);
>> +
>> +	/*
>> +	 * - Set chip enable number
>> +	 * - Set ecc byte offset in the spare area
>> +	 * - Calculate the number of address cycles to be issued
>> +	 * - Set byte 5 of address cycle if needed
>> +	 */
>> +	csqar2 = FMC2_CSQCAR2_NANDCEN(fmc2->cs_sel);
>> +	if (chip->options & NAND_BUSWIDTH_16)
>> +		csqar2 |= FMC2_CSQCAR2_SAO(ecc_offset >> 1);
>> +	else
>> +		csqar2 |= FMC2_CSQCAR2_SAO(ecc_offset);
>> +	if (chip->chipsize > SZ_128M) {
> 
> Can you use
> 
> 	if (chip->options & NAND_ROW_ADDR_3)
> 
> instead?
> 

Yes, it will part of v3.

>> +		csqcfgr1 |= FMC2_CSQCFGR1_ACYNBR(5);
>> +		csqar2 |= FMC2_CSQCAR2_ADDC5(page >> 16);
>> +	} else {
>> +		csqcfgr1 |= FMC2_CSQCFGR1_ACYNBR(4);
>> +	}
> 
> [...]
> 
>> +
>> +void stm32_fmc2_write_data(struct nand_chip *chip, const void *buf,
>> +			   unsigned int len, bool force_8bit)
>> +{
>> +	struct stm32_fmc2 *fmc2 = nand_get_controller_data(chip);
>> +	void __iomem *io_addr_w = fmc2->data_base[fmc2->cs_sel];
>> +	const u8 *p = buf;
>> +	unsigned int i;
>> +
>> +	if (force_8bit)
>> +		goto write_8bit;
>> +
>> +	if (IS_ALIGNED(len, sizeof(u32))) {
>> +		const u32 *p = buf;
> 
> I'm pretty sure the framework provides no alignment guarantee on buf.
> You'd better assume buf might not be aligned on 32 or 16 bits.
> 
>> +
>> +		len /= sizeof(u32);
>> +		for (i = 0; i < len; i++)
>> +			writel_relaxed(p[i], io_addr_w);
>> +		return;
>> +	}
>> +
>> +	if (chip->options & NAND_BUSWIDTH_16) {
>> +		const u16 *p = buf;
>> +
>> +		len /= sizeof(u16);
>> +		for (i = 0; i < len; i++)
>> +			writew_relaxed(p[i], io_addr_w);
>> +		return;
>> +	}
>> +
>> +write_8bit:
>> +	for (i = 0; i < len; i++)
>> +		writeb_relaxed(p[i], io_addr_w);
> 
> Is 8bit access really enforced by the byte accessor? In this case, how
> can you be sure 32-bit accesses are doing the right thing? Isn't there
> a bit somewhere in the config reg to configure the bus width?
> 

I have checked the framework after Miquèl comment sent on v1 => "If you 
selected BOUNCE_BUFFER in the options, buf is supposedly
aligned, or am I missing something?".

After checking the framework, my understanding was:
  - In case of 8-bit access is requested, the framework provides no 
guarantee on buf. To avoid any issue, I write byte per byte.
  - In case of 8-bit access is not requested, it means that the 
framework will try to write data in the page or in the oob. When writing 
to oob, chip->oob_poi will be used and this buffer is aligned. When 
writing to the page, as the driver enables NAND_USE_BOUNCE_BUFFER 
option, buf is guarantee aligned.

But, I agree that it would be safe to reconfigure the bus width in 8-bit 
before writing byte per byte in case of a 16-bit NAND is used.

write_8bit:
     if (chip->options & NAND_BUSWIDTH_16) {
         /* Reconfigure bus width to 8-bit */
         pcr = readl_relaxed(fmc2->io_base + FMC2_PCR);
         pcr &= ~FMC2_PCR_PWID_MASK;
         writel_relaxed(pcr, fmc2->io_base + FMC2_PCR);
     }

     for (i = 0; i < len; i++)
         writeb_relaxed(p[i], io_addr_w);

     if (chip->options & NAND_BUSWIDTH_16) {
         /* Reconfigure bus width to 16-bit */
         pcr = readl_relaxed(fmc2->io_base + FMC2_PCR);
         pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
         writel_relaxed(pcr, fmc2->io_base + FMC2_PCR);
     }

Regards,
Christophe Kerello.

>> +}
> 
> Regards,
> 
> Boris
> 
