From: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] mtd:spi-nor: Add lock and unlock callback functions to
 struct spi_nor
Date: Fri, 20 Mar 2015 09:15:48 +0800
Message-ID: <CAN1oZWxzK_CuN-kHP-843X-zKQBFHo_UXgC+oZFUtfRYjNxCvg@mail.gmail.com>
References: <1426493714-3748-1-git-send-email-vndao@altera.com>
	<20150319174903.GT32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150319174903.GT32500@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Viet Nga Dao <vndao@altera.com>, David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Fri, Mar 20, 2015 at 1:49 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Viet,
>
> On Mon, Mar 16, 2015 at 01:15:14AM -0700, vndao@altera.com wrote:
>> From: VIET NGA DAO <vndao@altera.com>
>>
>> This patch introduces a properly-replaceable spi_nor callback that does
>> flash specific lock and unlock. The existing code for spi_nor_lock and
>> spi_nor_unlock is moved into their own functions which are stm_lock and
>> stm_unlock.
>
> I'm curious; is this a complete ripoff of my code [1]? You haven't
> credited my authorship at all. That's a big no-no. Typically you keep
> the 'From:' and Signed-off-by of the original author if you're going to
> modify/redistribute it. (Admittedly, I didn't provide the S-o-b on my
> informal patch.)
>
> Anyway, that's all fine this time, but please avoid doing this in the
> future; I can fix up the authorship, etc., and apply it, if it gets an
> Ack/Tested-by from one or more reviewers (e.g., you). BTW, I hope you at
> least tested this, right?
>
> Brian

Hi Brian,
I am so sorry for this mistake. it is not my intention. :(  I am new
to kernel driver and up-streaming thing, that is why i do not know the
proper way. Yes, please change the authorship to you.
Yes, i tested it.
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-March/058301.html
>
>> Signed-off-by: VIET NGA DAO <vndao@altera.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 56 ++++++++++++++++++++++++++++---------------
>>  include/linux/mtd/spi-nor.h   |  4 ++++
>>  2 files changed, 41 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index b6a5a0c..43bb552 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -369,17 +369,13 @@ erase_err:
>>       return ret;
>>  }
>>
>> -static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>  {
>> -     struct spi_nor *nor = mtd_to_spi_nor(mtd);
>> +     struct mtd_info *mtd = nor->mtd;
>>       uint32_t offset = ofs;
>>       uint8_t status_old, status_new;
>>       int ret = 0;
>>
>> -     ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
>> -     if (ret)
>> -             return ret;
>> -
>>       status_old = read_sr(nor);
>>
>>       if (offset < mtd->size - (mtd->size / 2))
>> @@ -402,26 +398,18 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>                               (status_old & (SR_BP2 | SR_BP1 | SR_BP0))) {
>>               write_enable(nor);
>>               ret = write_sr(nor, status_new);
>> -             if (ret)
>> -                     goto err;
>>       }
>>
>> -err:
>> -     spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>>       return ret;
>>  }
>>
>> -static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>  {
>> -     struct spi_nor *nor = mtd_to_spi_nor(mtd);
>> +     struct mtd_info *mtd = nor->mtd;
>>       uint32_t offset = ofs;
>>       uint8_t status_old, status_new;
>>       int ret = 0;
>>
>> -     ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
>> -     if (ret)
>> -             return ret;
>> -
>>       status_old = read_sr(nor);
>>
>>       if (offset+len > mtd->size - (mtd->size / 64))
>> @@ -444,15 +432,41 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>                               (status_old & (SR_BP2 | SR_BP1 | SR_BP0))) {
>>               write_enable(nor);
>>               ret = write_sr(nor, status_new);
>> -             if (ret)
>> -                     goto err;
>>       }
>>
>> -err:
>> +     return ret;
>> +}
>> +
>> +static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +{
>> +     struct spi_nor *nor = mtd_to_spi_nor(mtd);
>> +     int ret;
>> +
>> +     ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_LOCK);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = nor->flash_lock(nor, ofs, len);
>> +
>>       spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_UNLOCK);
>>       return ret;
>>  }
>>
>> +static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +{
>> +     struct spi_nor *nor = mtd_to_spi_nor(mtd);
>> +     int ret;
>> +
>> +     ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = nor->flash_unlock(nor, ofs, len);
>> +
>> +     spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>> +     return ret;
>> +}
>> +
>>  /* Used when the "_ext_id" is two bytes at most */
>>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)   \
>>       ((kernel_ulong_t)&(struct flash_info) {                         \
>> @@ -1045,6 +1059,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>
>>       /* nor protection support for STmicro chips */
>>       if (JEDEC_MFR(info) == CFI_MFR_ST) {
>> +             nor->flash_lock = stm_lock;
>> +             nor->flash_unlock = stm_unlock;
>> +     }
>> +     if (nor->flash_lock && nor->flash_unlock) {
>>               mtd->_lock = spi_nor_lock;
>>               mtd->_unlock = spi_nor_unlock;
>>       }
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 4720b86..e4e73d5 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -155,6 +155,8 @@ enum spi_nor_option_flags {
>>   * @write:           [DRIVER-SPECIFIC] write data to the SPI NOR
>>   * @erase:           [DRIVER-SPECIFIC] erase a sector of the SPI NOR
>>   *                   at the offset @offs
>> + * @lock:            [FLASH-SPECIFIC] lock a region of the SPI NOR
>> + * @unlock:          [FLASH-SPECIFIC] unlock a region of the SPI NOR
>>   * @priv:            the private data
>>   */
>>  struct spi_nor {
>> @@ -188,6 +190,8 @@ struct spi_nor {
>>       void (*write)(struct spi_nor *nor, loff_t to,
>>                       size_t len, size_t *retlen, const u_char *write_buf);
>>       int (*erase)(struct spi_nor *nor, loff_t offs);
>> +     int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>> +     int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>
>>       void *priv;
>>  };
>> --
>> 1.7.11.GIT
>>
