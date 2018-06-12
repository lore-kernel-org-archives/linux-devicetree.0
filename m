From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/2] nvmem: Add Spreadtrum SC27XX efuse support
Date: Tue, 12 Jun 2018 13:41:27 +0800
Message-ID: <CAMz4kuKmDYBgtqNfWtbB+vLAufR1r7oXtEZGp76H8cyWONyxfg@mail.gmail.com>
References: <0a5444dd0646f4e1f1d8ce51870afe6cc864219e.1528780670.git.baolin.wang@linaro.org>
 <0ebf526fa755231c8871a57baab641cebaed7820.1528780670.git.baolin.wang@linaro.org>
 <70fffa09-5c70-be61-49b8-e78015fff547@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70fffa09-5c70-be61-49b8-e78015fff547@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, freeman.liu@spreadtrum.com, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Randy,

On 12 June 2018 at 13:27, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 06/11/2018 10:24 PM, Baolin Wang wrote:
>> From: Freeman Liu <freeman.liu@spreadtrum.com>
>>
>> This patch add the efuse driver which is embeded in Spreadtrum SC27XX
>> series PMICs. The sc27xx efuse contains 32 blocks and each block's
>> data width is 16 bits.
>>
>> Signed-off-by: Freeman Liu <freeman.liu@spreadtrum.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>>  drivers/nvmem/Kconfig        |   11 ++
>>  drivers/nvmem/Makefile       |    3 +-
>>  drivers/nvmem/sc27xx-efuse.c |  263 ++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 276 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/nvmem/sc27xx-efuse.c
>>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index 54a3c29..3dca608 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -181,4 +181,15 @@ config RAVE_SP_EEPROM
>>       help
>>         Say y here to enable Rave SP EEPROM support.
>>
>> +config SC27XX_EFUSE
>> +     tristate "Spreadtrum SC27XX eFuse Support"
>> +     depends on MFD_SC27XX_PMIC || COMPILE_TEST
>> +     depends on HAS_IOMEM
>> +     help
>> +       This is a simple drive to dump specified values of Spreadtrum
>
>                            driver

Sorry for the typo and will fix in next version. Thanks.

-- 
Baolin.wang
Best Regards
