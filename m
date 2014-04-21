From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH RFC v2 3/4] nand: pl353: Add driver for arm pl353 smc nand
 interface
Date: Mon, 21 Apr 2014 10:18:47 +0530
Message-ID: <CAGnW=BbvnimHEaOquoBgD3Y9BjWADiKKWZ3HyKMqOb5Ygg63rQ@mail.gmail.com>
References: <1397764720-29846-1-git-send-email-punnaia@xilinx.com>
 <b531e294-9b1f-475b-b4e1-c4bba429e2e2@VA3EHSMHS004.ehs.local>
 <20980858CB6D3A4BAE95CA194937D5E73EAC3AF2@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC3AF2@DBDE04.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "Gupta, Pekon" <pekon@ti.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, David Mosberger <davidm@egauge.net>, "joern@logfs.org" <joern@logfs.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 1:18 PM, Gupta, Pekon <pekon@ti.com> wrote:
>>From: Punnaiah Choudary Kalluri [mailto:punnaiah.choudary.kalluri@xilinx.com]
>>
>>Add driver for arm pl353 static memory controller nand interface.
>>This controller is used in xilinx zynq soc for interfacing the nand
>>flash memory.
>>
>>Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>>---
>>Changes in v2:
>> - use "depends on" rather than "select" option in kconfig
>> - remove unused variable parts
>> - remove dummy helper and use writel_relaxed directly
>>---
> [...]
>
>>+/* Define default oob placement schemes for large and small page devices */
>>+static struct nand_ecclayout nand_oob_16 = {
>>+      .eccbytes = 3,
>>+      .eccpos = {0, 1, 2},
>>+      .oobfree = {
>>+              {.offset = 8,
>>+               . length = 8} }
>>+};
>>+
>>+static struct nand_ecclayout nand_oob_64 = {
>>+      .eccbytes = 12,
>>+      .eccpos = {
>>+                 52, 53, 54, 55, 56, 57,
>>+                 58, 59, 60, 61, 62, 63},
>>+      .oobfree = {
>>+              {.offset = 2,
>>+               .length = 50} }
>>+};
>>+
>>+static struct nand_ecclayout ondie_nand_oob_64 = {
>>+      .eccbytes = 32,
>>+
>>+      .eccpos = {
>>+              8, 9, 10, 11, 12, 13, 14, 15,
>>+              24, 25, 26, 27, 28, 29, 30, 31,
>>+              40, 41, 42, 43, 44, 45, 46, 47,
>>+              56, 57, 58, 59, 60, 61, 62, 63
>>+      },
>>+
>>+      .oobfree = {
>>+              { .offset = 4, .length = 4 },
>>+              { .offset = 20, .length = 4 },
>>+              { .offset = 36, .length = 4 },
>>+              { .offset = 52, .length = 4 }
>>+      }
>>+};
>>+
>
> Preferably please don't hard-code ecclayout, as this constrains driver
> to be used with NAND devices which have oobsize=64 bytes.
> Instead you can make it generic for all types of devices by replicating
> replicating ecc-layout for every eccsize.
> (reference: drivers/mtd/nand/omap2.c +1958 : omap_nand_probe)

I agree with your point. But, zynq soc is already in market and the
internal bootrom uses the ecc layout as defined above, modifying this
will fails the
zynq nand boot. So, decided to maintain the compatibility with bootrom.
>
>
>>+/* Generic flash bbt decriptors */
>>+static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
>>+static uint8_t mirror_pattern[] = { '1', 't', 'b', 'B' };
>>+
>>+static struct nand_bbt_descr bbt_main_descr = {
>>+      .options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
>>+              | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
>>+      .offs = 4,
>>+      .len = 4,
>>+      .veroffs = 20,
>>+      .maxblocks = 4,
>>+      .pattern = bbt_pattern
>>+};
>>+
>>+static struct nand_bbt_descr bbt_mirror_descr = {
>>+      .options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
>>+              | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
>>+      .offs = 4,
>>+      .len = 4,
>>+      .veroffs = 20,
>>+      .maxblocks = 4,
>>+      .pattern = mirror_pattern
>>+};
>
> Just curious, why is there a need to introduce custom BBT descriptor ?
> default ones are already specified in drivers/mtd/nand/nand_bbt.c
> as " bbt_main_descr" and "bbt_mirror_descr".
> Do you need to be compatible with any existing tool | utility ?

These descriptors are for micron ondie ecc enabled devices and also as stated
in above comment, the zynq bootrom also using these values. So,
decided to maintain
compatibility
>
>
>>+/**
>>+ * pl353_nand_calculate_hwecc - Calculate Hardware ECC
>>+ * @mtd:      Pointer to the mtd_info structure
>>+ * @data:     Pointer to the page data
>>+ * @ecc_code: Pointer to the ECC buffer where ECC data needs to be stored
>>+ *
>>+ * This function retrieves the Hardware ECC data from the controller and returns
>>+ * ECC data back to the MTD subsystem.
>>+ *
>>+ * Return:    0 on success or error value on failure
>>+ */
>>+static int pl353_nand_calculate_hwecc(struct mtd_info *mtd,
>>+                              const u8 *data, u8 *ecc_code)
>>+{
>>+      u32 ecc_value, ecc_status;
>>+      u8 ecc_reg, ecc_byte;
>>+      unsigned long timeout = jiffies + PL353_NAND_ECC_BUSY_TIMEOUT;
>>+
>>+      /* Wait till the ECC operation is complete or timeout */
>>+      do {
>>+              if (pl353_smc_ecc_is_busy())
>>+                      cpu_relax();
>>+              else
>>+                      break;
>>+      } while (!time_after_eq(jiffies, timeout));
>>+
>>+      if (time_after_eq(jiffies, timeout)) {
>>+              pr_err("%s timed out\n", __func__);
>>+              return -ETIMEDOUT;
>>+      }
>>+
>>+      for (ecc_reg = 0; ecc_reg < 4; ecc_reg++) {
>>+              /* Read ECC value for each block */
>>+              ecc_value = pl353_smc_get_ecc_val(ecc_reg);
>>+              ecc_status = (ecc_value >> 24) & 0xFF;
>>+              /* ECC value valid */
>>+              if (ecc_status & 0x40) {
>>+                      for (ecc_byte = 0; ecc_byte < 3; ecc_byte++) {
>>+                              /* Copy ECC bytes to MTD buffer */
>>+                              *ecc_code = ecc_value & 0xFF;
>>+                              ecc_value = ecc_value >> 8;
>>+                              ecc_code++;
>>+                      }
>>+              } else {
>>+                      pr_warn("%s status failed\n", __func__);
>>+                      return -1;
>
> Please use some valid error-code.

Ok.
>
>>+              }
>>+      }
>>+      return 0;
>>+}
>
>>+
>>+/**
>>+ * onehot - onehot function
>>+ * @value:    Value to check for onehot
>>+ *
>>+ * This function checks whether a value is onehot or not.
>>+ * onehot is if and only if onebit is set.
>>+ *
>>+ * Return:    1 if it is onehot else 0
>>+ */
>>+static int onehot(unsigned short value)
>>+{
>>+      return (value & (value - 1)) == 0;
>>+}
>>+
>>+/**
>>+ * pl353_nand_correct_data - ECC correction function
>>+ * @mtd:      Pointer to the mtd_info structure
>>+ * @buf:      Pointer to the page data
>>+ * @read_ecc: Pointer to the ECC value read from spare data area
>>+ * @calc_ecc: Pointer to the calculated ECC value
>>+ *
>>+ * This function corrects the ECC single bit errors & detects 2-bit errors.
>>+ *
>>+ * Return:    0 if no ECC errors found
>>+ *            1 if single bit error found and corrected.
>>+ *            -1 if multiple ECC errors found.
>>+ */
>>+static int pl353_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
>>+                              unsigned char *read_ecc,
>>+                              unsigned char *calc_ecc)
>>+{
>>+      unsigned char bit_addr;
>>+      unsigned int byte_addr;
>>+      unsigned short ecc_odd, ecc_even, read_ecc_lower, read_ecc_upper;
>>+      unsigned short calc_ecc_lower, calc_ecc_upper;
>>+
>>+      read_ecc_lower = (read_ecc[0] | (read_ecc[1] << 8)) & 0xfff;
>>+      read_ecc_upper = ((read_ecc[1] >> 4) | (read_ecc[2] << 4)) & 0xfff;
>>+
>>+      calc_ecc_lower = (calc_ecc[0] | (calc_ecc[1] << 8)) & 0xfff;
>>+      calc_ecc_upper = ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) & 0xfff;
>>+
>>+      ecc_odd = read_ecc_lower ^ calc_ecc_lower;
>>+      ecc_even = read_ecc_upper ^ calc_ecc_upper;
>>+
>>+      if ((ecc_odd == 0) && (ecc_even == 0))
>>+              return 0;       /* no error */
>>+
>>+      if (ecc_odd == (~ecc_even & 0xfff)) {
>>+              /* bits [11:3] of error code is byte offset */
>>+              byte_addr = (ecc_odd >> 3) & 0x1ff;
>>+              /* bits [2:0] of error code is bit offset */
>>+              bit_addr = ecc_odd & 0x7;
>>+              /* Toggling error bit */
>>+              buf[byte_addr] ^= (1 << bit_addr);
>>+              return 1;
>>+      }
>>+
>>+      if (onehot(ecc_odd | ecc_even) == 1)
>>+              return 1; /* one error in parity */
>>+
>>+      return -1; /* Uncorrectable error */
>
> Please return something like -EBADMSG.

Ok.
>>+}
>
>
> [...]
>
>
>>+/**
>>+ * nand_write_page_hwecc - Hardware ECC based page write function
>>+ * @mtd:              Pointer to the mtd info structure
>>+ * @chip:             Pointer to the NAND chip info structure
>>+ * @buf:              Pointer to the data buffer
>>+ * @oob_required:     Caller requires OOB data read to chip->oob_poi
>>+ *
>>+ * This functions writes data and hardware generated ECC values in to the page.
>>+ *
>>+ * Return:    Always return zero
>>+ */
>>+static int pl353_nand_write_page_hwecc(struct mtd_info *mtd,
>>+                                  struct nand_chip *chip, const uint8_t *buf,
>>+                                  int oob_required)
>>+{
>>+      int i, eccsize = chip->ecc.size;
>>+      int eccsteps = chip->ecc.steps;
>>+      uint8_t *ecc_calc = chip->buffers->ecccalc;
>>+      const uint8_t *p = buf;
>>+      uint32_t *eccpos = chip->ecc.layout->eccpos;
>>+      unsigned long data_phase_addr;
>>+      uint8_t *oob_ptr;
>>+
>>+      for ( ; (eccsteps - 1); eccsteps--) {
>>+              chip->write_buf(mtd, p, eccsize);
>>+              p += eccsize;
>>+      }
>>+      chip->write_buf(mtd, p, (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH));
>>+      p += (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      /* Set ECC Last bit to 1 */
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_W;
>>+      data_phase_addr |= PL353_NAND_ECC_LAST;
>>+      chip->IO_ADDR_W = (void __iomem * __force)data_phase_addr;
>>+      chip->write_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      /* Wait for ECC to be calculated and read the error values */
>>+      p = buf;
>>+      chip->ecc.calculate(mtd, p, &ecc_calc[0]);
>>+
> Your 'pl353_nand_calculate_hwecc' does return with errors like -ETIMEDOUT and '-1'
> but those aren't handled here ..

I will fix this.
>
>>+      for (i = 0; i < chip->ecc.total; i++)
>>+              chip->oob_poi[eccpos[i]] = ~(ecc_calc[i]);
>>+
>>+      /* Clear ECC last bit */
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_W;
>>+      data_phase_addr &= ~PL353_NAND_ECC_LAST;
>>+      chip->IO_ADDR_W = (void __iomem * __force)data_phase_addr;
>>+
>>+      /* Write the spare area with ECC bytes */
>>+      oob_ptr = chip->oob_poi;
>>+      chip->write_buf(mtd, oob_ptr,
>>+                      (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH));
>>+
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_W;
>>+      data_phase_addr |= PL353_NAND_CLEAR_CS;
>>+      data_phase_addr |= (1 << END_CMD_VALID_SHIFT);
>>+      chip->IO_ADDR_W = (void __iomem * __force)data_phase_addr;
>>+      oob_ptr += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
>>+      chip->write_buf(mtd, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      return 0;
>>+}
>>+
>>+/**
>>+ * pl353_nand_write_page_swecc - [REPLACABLE] software ecc based page write function
>>+ * @mtd:              Pointer to the mtd info structure
>>+ * @chip:             Pointer to the NAND chip info structure
>>+ * @buf:              Pointer to the data buffer
>>+ * @oob_required:     Caller requires OOB data read to chip->oob_poi
>>+ *
>>+ * Return:    Always return zero
>>+ */
>>+static int pl353_nand_write_page_swecc(struct mtd_info *mtd,
>>+                                  struct nand_chip *chip, const uint8_t *buf,
>>+                                  int oob_required)
>>+{
>>+      int i, eccsize = chip->ecc.size;
>>+      int eccbytes = chip->ecc.bytes;
>>+      int eccsteps = chip->ecc.steps;
>>+      uint8_t *ecc_calc = chip->buffers->ecccalc;
>>+      const uint8_t *p = buf;
>>+      uint32_t *eccpos = chip->ecc.layout->eccpos;
>>+
>>+      /* Software ecc calculation */
>>+      for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
>>+              chip->ecc.calculate(mtd, p, &ecc_calc[i]);
>>+
>>+      for (i = 0; i < chip->ecc.total; i++)
>>+              chip->oob_poi[eccpos[i]] = ecc_calc[i];
>>+
>>+      chip->ecc.write_page_raw(mtd, chip, buf, 1);
>>+
>>+      return 0;
>>+}
>>+
>>+/**
>>+ * pl353_nand_read_page_hwecc - Hardware ECC based page read function
>>+ * @mtd:              Pointer to the mtd info structure
>>+ * @chip:             Pointer to the NAND chip info structure
>>+ * @buf:              Pointer to the buffer to store read data
>>+ * @oob_required:     Caller requires OOB data read to chip->oob_poi
>>+ * @page:             Page number to read
>>+ *
>>+ * This functions reads data and checks the data integrity by comparing hardware
>>+ * generated ECC values and read ECC values from spare area.
>>+ *
>>+ * Return:    0 always and updates ECC operation status in to MTD structure
>>+ */
>>+static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
>>+                                   struct nand_chip *chip,
>>+                                   uint8_t *buf, int oob_required, int page)
>>+{
>>+      int i, stat, eccsize = chip->ecc.size;
>>+      int eccbytes = chip->ecc.bytes;
>>+      int eccsteps = chip->ecc.steps;
>>+      uint8_t *p = buf;
>>+      uint8_t *ecc_calc = chip->buffers->ecccalc;
>>+      uint8_t *ecc_code = chip->buffers->ecccode;
>>+      uint32_t *eccpos = chip->ecc.layout->eccpos;
>>+      unsigned long data_phase_addr;
>>+      uint8_t *oob_ptr;
>>+
>>+      for ( ; (eccsteps - 1); eccsteps--) {
>>+              chip->read_buf(mtd, p, eccsize);
>>+              p += eccsize;
>>+      }
>>+      chip->read_buf(mtd, p, (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH));
>>+      p += (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      /* Set ECC Last bit to 1 */
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_R;
>>+      data_phase_addr |= PL353_NAND_ECC_LAST;
>>+      chip->IO_ADDR_R = (void __iomem * __force)data_phase_addr;
>>+      chip->read_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      /* Read the calculated ECC value */
>>+      p = buf;
>>+      chip->ecc.calculate(mtd, p, &ecc_calc[0]);
>
> Same here.. return error codes from 'pl353_nand_calculate_hwecc' are
> not handled here..

i will fix this.
>
>>+
>>+      /* Clear ECC last bit */
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_R;
>>+      data_phase_addr &= ~PL353_NAND_ECC_LAST;
>>+      chip->IO_ADDR_R = (void __iomem * __force)data_phase_addr;
>>+
>>+      /* Read the stored ECC value */
>>+      oob_ptr = chip->oob_poi;
>>+      chip->read_buf(mtd, oob_ptr,
>>+                      (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH));
>>+
>>+      /* de-assert chip select */
>>+      data_phase_addr = (unsigned long __force)chip->IO_ADDR_R;
>>+      data_phase_addr |= PL353_NAND_CLEAR_CS;
>>+      chip->IO_ADDR_R = (void __iomem * __force)data_phase_addr;
>>+
>>+      oob_ptr += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
>>+      chip->read_buf(mtd, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH);
>>+
>>+      for (i = 0; i < chip->ecc.total; i++)
>>+              ecc_code[i] = ~(chip->oob_poi[eccpos[i]]);
>>+
>>+      eccsteps = chip->ecc.steps;
>>+      p = buf;
>>+
>>+      /* Check ECC error for all blocks and correct if it is correctable */
>>+      for (i = 0 ; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
>>+              stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
>>+              if (stat < 0)
>>+                      mtd->ecc_stats.failed++;
>>+              else
>>+                      mtd->ecc_stats.corrected += stat;
>>+      }
>>+      return 0;
>>+}
>
>
> [...]
>
>
>>+/**
>>+ * pl353_nand_detect_ondie_ecc - Get the flash ondie ecc state
>>+ * @mtd:      Pointer to the mtd_info structure
>>+ *
>>+ * This function enables the ondie ecc for the Micron ondie ecc capable devices
>>+ *
>>+ * Return:    1 on detect, 0 if fail to detect
>>+ */
>>+static int pl353_nand_detect_ondie_ecc(struct mtd_info *mtd)
>>+{
> There is already some work done by 'David Mosberger <davidm@egauge.net>'
> on this please see if you can re-use or add to his patches [1]

Ok. I will check this.
>
>
>>+
>>+/**
>>+ * pl353_nand_ecc_init - Initialize the ecc information as per the ecc mode
>>+ * @mtd:      Pointer to the mtd_info structure
>>+ * @ondie_ecc_state:  ondie ecc status
>>+ *
>>+ * This function initializes the ecc block and functional pointers as per the
>>+ * ecc mode
>>+ */
>>+static void pl353_nand_ecc_init(struct mtd_info *mtd, int ondie_ecc_state)
>>+{
>>+      struct nand_chip *nand_chip = mtd->priv;
>>+
>>+      nand_chip->ecc.mode = NAND_ECC_HW;
>>+      nand_chip->ecc.read_oob = pl353_nand_read_oob;
>>+      nand_chip->ecc.read_page_raw = pl353_nand_read_page_raw;
>>+      nand_chip->ecc.strength = 1;
>>+      nand_chip->ecc.write_oob = pl353_nand_write_oob;
>>+      nand_chip->ecc.write_page_raw = pl353_nand_write_page_raw;
>>+
>>+      if (ondie_ecc_state) {
>>+              /* bypass the controller ECC block */
>>+              pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_BYPASS);
>>+
>>+              /*
>>+               * The software ECC routines won't work with the
>>+               * SMC controller
>>+               */
>>+              nand_chip->ecc.bytes = 0;
>>+              nand_chip->ecc.layout = &ondie_nand_oob_64;
> Here's the problem, this will work only with pagesize=2K | oobsize=64B NAND devices.
> It's better to make it generic.
> OR
> Add the check for specific NAND device.

Ok.
>
>>+              nand_chip->ecc.read_page = pl353_nand_read_page_raw;
>>+              nand_chip->ecc.write_page = pl353_nand_write_page_raw;
>>+              nand_chip->ecc.size = mtd->writesize;
>>+              /*
>>+               * On-Die ECC spare bytes offset 8 is used for ECC codes
>>+               * Use the BBT pattern descriptors
>>+               */
>>+              nand_chip->bbt_td = &bbt_main_descr;
>>+              nand_chip->bbt_md = &bbt_mirror_descr;
>
> You can do use NAND_BBT_NO_OOB as done in
> 'David Mosberger <davidm@egauge.net>' patch
> lists.infradead.org/pipermail/linux-mtd/2014-March/053040.html
>         +               /* nand_bbt attempts to put Bbt marker at offset 8 in
>         +                  oob, which is used for ECC by Micron
>         +                  MT29F4G16ABADAWP, for example.  Fixed by not using
>         +                  OOB for BBT marker.  */
>         +               chip->bbt_options |= NAND_BBT_NO_OOB;
>

Thanks, i will try this one.
>
>>+      } else {
>>+              /* Hardware ECC generates 3 bytes ECC code for each 512 bytes */
>>+              nand_chip->ecc.bytes = 3;
>>+              nand_chip->ecc.calculate = pl353_nand_calculate_hwecc;
>>+              nand_chip->ecc.correct = pl353_nand_correct_data;
>>+              nand_chip->ecc.hwctl = NULL;
>>+              nand_chip->ecc.read_page = pl353_nand_read_page_hwecc;
>>+              nand_chip->ecc.size = PL353_NAND_ECC_SIZE;
>>+              nand_chip->ecc.write_page = pl353_nand_write_page_hwecc;
>>+
>>+              pl353_smc_set_ecc_pg_size(mtd->writesize);
>>+              switch (mtd->writesize) {
>>+              case 512:
>>+              case 1024:
>>+              case 2048:
>>+                      pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_APB);
>>+                      break;
>>+              default:
>>+                      /*
>>+                       * The software ECC routines won't work with the
>>+                       * SMC controller
>>+                       */
>
> Would be good if you define three different ecc.modes | ecc_schemes..
> (1) ondie_ecc: if on-die ECC is supported by Micron device
> (2) hw_ecc: if (!ondie_ecc && mtd->writesize <= 2048)
> (3) sw_ecc:  in all other cases..
> This will help to cleanly segredate your  nand_chip->ecc.xx configurations,
> And not switch back and forth as in this default statement.

Ok. Since, the controller expects that chip select clear bit should be
set while performing
the last data transfer (i.e 4 bytes) , because of this requirement,
the existing functions in
nand_base.c for sw_ecc are not working for this controller. So, in
this case though driver using
sw ecc, it updates ecc mode as hw_ecc to the nand_base framework to
avoid registering the
nad base sw ecc routines.
>
>>+                      nand_chip->ecc.calculate = nand_calculate_ecc;
>>+                      nand_chip->ecc.correct = nand_correct_data;
>>+                      nand_chip->ecc.read_page = pl353_nand_read_page_swecc;
>>+                      nand_chip->ecc.write_page = pl353_nand_write_page_swecc;
>>+                      nand_chip->ecc.size = 256;
>>+                      break;
>>+              }
>>+
>>+              if (mtd->oobsize == 16)
>>+                      nand_chip->ecc.layout = &nand_oob_16;
>>+              else if (mtd->oobsize == 64)
>>+                      nand_chip->ecc.layout = &nand_oob_64;
>
> else, How do you handle other NAND devices ?
> at-least return with some error-code like -ENOTSUPP  | -EINVAL.

Ok.
>>+      }
>>+}
>
>
> [...]
>
>
>>+MODULE_AUTHOR("Xilinx, Inc.");
> This at-least should contain some long term valid email so that
> driver's Author can be traced to get some Ack | Naks in future.

This i will check internally and update accordingly
>
>>+MODULE_ALIAS("platform:" PL353_NAND_DRIVER_NAME);
>>+MODULE_DESCRIPTION("ARM PL353 NAND Flash Driver");
>>+MODULE_LICENSE("GPL");
> Shouldn't this be GPL v2 ?

Yes. I will fix this.
>
>>--
>>1.7.4
>>
>
> Also, request you to break this patch in at-least following sets, for
> ease of review and faster acceptance..
> - [PATCH 1/5] introduction of basic nand interfaces like nand_command ..
> - [PATCH 2/5] introduction of sw_ecc (default ECC mode)
> - [PATCH 3/5] introduction of hw_ecc (non ondie-ecc)
> - [PATCH 4/5] introduction of ondie_ecc (may be re-using David's patches)
> - [PATCH 5/5] some write-up about this driver | controller kernel_docs.

Ok.

Thanks.
Punnaiah
>
> Also may be have separate series for
> - drivers/memory/... and
> - drivers/mtd/nand/...
> because I think the two trees get merged separately. Brain ??
>
>
> [1]
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/053036.html
> And,
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053329.html
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053328.html
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053326.html
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053327.html
>
>
> with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
