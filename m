From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Wed, 1 Nov 2017 17:33:12 +0800
Message-ID: <CAMz4kuKapkdcJLy_i2=xQ4pB8XAKp4Ld14Dmzi0rb5aWjC3V=w@mail.gmail.com>
References: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1509503569.git.baolin.wang@spreadtrum.com>
 <0806380ab2674f78f925b9015e558ffb634f11f1.1509503569.git.baolin.wang@spreadtrum.com>
 <20171101092703.i5t7ejuhcs45cchw@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171101092703.i5t7ejuhcs45cchw@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 1 November 2017 at 17:27, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 01 Nov 2017, Baolin Wang wrote:
>
>> This patch adds support for Spreadtrum SC27xx series PMIC MFD core, and It
>> provides communication through the SPI interfaces. The SC27xx series PMICs
>> contains the following 6 major components:
>> - DCDCs
>> - LDOs
>> - Battery management system
>> - Audio codec
>> - User interface function, such as indicator, flash LED
>> - IC level function, such as power on/off, type-c
>>
>> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>> Changes since v3:
>>  - Use memcpy() to copy register offset address into SPI buffer.
>>
>> Changes since v2:
>>  - Add more help information.
>>  - Define macros for irq base and irq number.
>>  - Use devm_mfd_add_devices() instead of mfd_add_devices(), which means
>>  we can remove sprd_pmic_remove().
>>  - Rename local variables in sprd_pmic_probe().
>>
>> Changes since v1:
>>  - Add more documentation to introduce Spreadtrum SC27xx series PMICs.
>>  - Modify compatile string property.
>>  - Modify reg property.
>>  - Remove redundant 'pmic' label.
>>  - Change 'should be' to 'must be' for cells properties.
>> ---
>>  drivers/mfd/Kconfig           |   16 +++
>>  drivers/mfd/Makefile          |    1 +
>>  drivers/mfd/sprd-sc27xx-spi.c |  259 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 276 insertions(+)
>>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c
>
> Applied, thanks.

Thanks for your help.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
