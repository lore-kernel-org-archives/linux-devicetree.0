From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Wed, 25 Oct 2017 10:17:32 +0800
Message-ID: <CAMz4kuL-gr1NtF4kccbTtEj8m3Om5VDZB+MJQWGD3FJUaW3BHQ@mail.gmail.com>
References: <1dd82fa9d640d076e88b618c0788d27315a51f66.1508154918.git.baolin.wang@spreadtrum.com>
 <8aabf006019f69e82f62bf6cfd4809c4079db9cb.1508154918.git.baolin.wang@spreadtrum.com>
 <20171024092641.vtg7namz2qwonpw4@dell> <CAMz4kuJ1SV0yv-mAbWiGZN15OoYxXap3-CEvVoDCkZwr7MJK9w@mail.gmail.com>
 <20171024103718.jz2mvikg6klzs7un@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024103718.jz2mvikg6klzs7un@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 24 October 2017 at 18:37, Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 24 Oct 2017, Baolin Wang wrote:
>
>> Hi Lee,
>>
>> On 24 October 2017 at 17:26, Lee Jones <lee.jones@linaro.org> wrote:
>> > On Mon, 16 Oct 2017, Baolin Wang wrote:
>> >
>> >> This patch adds support for Spreadtrum SC27xx series PMIC MFD core, and It
>> >> provides communication through the SPI interfaces. The SC27xx series PMICs
>> >> contains the following 6 major components:
>> >> - DCDCs
>> >> - LDOs
>> >> - Battery management system
>> >> - Audio codec
>> >> - User interface function, such as indicator, flash LED
>> >> - IC level function, such as power on/off, type-c
>> >>
>> >> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
>> >> ---
>> >> Changes since v1:
>> >>  - Re-order the including head files.
>> >>  - Add one condition to check register size and value size when reading.
>> >>  - Fix some coding style issues.
>> >> ---
>> >>  drivers/mfd/Kconfig           |   10 ++
>> >>  drivers/mfd/Makefile          |    1 +
>> >>  drivers/mfd/sprd-sc27xx-spi.c |  264 +++++++++++++++++++++++++++++++++++++++++
>> >>  3 files changed, 275 insertions(+)
>> >>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c
>
> [...]
>
>> >> +static int sprd_pmic_spi_read(void *context,
>> >> +                           const void *reg, size_t reg_size,
>> >> +                           void *val, size_t val_size)
>> >> +{
>> >> +     struct device *dev = context;
>> >> +     struct spi_device *spi = to_spi_device(dev);
>> >> +     u32 rx_buf[2] = { 0 };
>> >> +     int ret;
>> >> +
>> >> +     /* Now we only support one PMIC register to read every time. */
>> >> +     if (reg_size != sizeof(u32) || val_size != sizeof(u32))
>> >> +             return -EINVAL;
>> >> +
>> >> +     rx_buf[0] = *(u32 *)reg;
>> >
>> > This looks dodgy.  You should not be doing raw memory manipulation.
>> >
>> > You need to be passing __iomem and using one of the predefined APIs
>> > (i.e. readl) on it.
>>
>> Sorry, I did not get you here. The 'reg' parameter is just one PMIC
>> register offset which want to be read. We do not need to pass __iomem
>> to SPI master driver, we just pass one register offset address to our
>> SPI master driver then the SPI master driver will handle to read
>> values from our PMIC.
>
> You should not be referencing the value at 'reg' manually:
>
> rx_buf[0] = readl(reg);

This is not true, like I said the 'reg' is not __iomem address, it is
just one register offset, we should pass the reg offset to SPI master
to read.

> [...]
>
>> >> +static struct spi_driver sprd_pmic_driver = {
>> >> +     .driver = {
>> >> +             .name = "sc27xx-pmic",
>> >> +             .bus = &spi_bus_type,
>> >> +             .of_match_table = sprd_pmic_match,
>> >
>> > of_match_ptr()?
>>
>> The of_match_ptr() did nothing, so I think it is not necessary.
>
> What do you mean?

sorry, what I mean is we must enable CONFIG_OF if we want to use this
driver, so of_match_ptr() seems redundant.

-- 
Baolin.wang
Best Regards
