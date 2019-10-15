From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] scsi: ufs: Add driver for TI wrapper for Cadence
 UFS IP
Date: Tue, 15 Oct 2019 10:20:09 +0530
Message-ID: <988637f8-96db-9e6d-92ec-803cb29c1dc6@ti.com>
References: <20191010083357.28982-1-vigneshr@ti.com>
 <20191010083357.28982-3-vigneshr@ti.com>
 <CAGOxZ51-ds99wNomK3xbws3G9nZgmhyox9k=fKrLmnJL68N2Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGOxZ51-ds99wNomK3xbws3G9nZgmhyox9k=fKrLmnJL68N2Vw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Martin K Petersen <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

Hi Alim,

On 15/10/19 7:04 AM, Alim Akhtar wrote:
> Hi Vignesh
> 
> On Thu, Oct 10, 2019 at 2:05 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>>
>> TI's J721e SoC has a Cadence UFS IP with a TI specific wrapper. This is
>> a minimal driver to configure the wrapper. It releases the UFS slave
>> device out of reset and sets up registers to indicate PHY reference
>> clock input frequency before probing child Cadence UFS driver.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>
>> v2: No change
>>
>>  drivers/scsi/ufs/Kconfig        | 10 ++++
>>  drivers/scsi/ufs/Makefile       |  1 +
>>  drivers/scsi/ufs/ti-j721e-ufs.c | 90 +++++++++++++++++++++++++++++++++
>>  3 files changed, 101 insertions(+)
>>  create mode 100644 drivers/scsi/ufs/ti-j721e-ufs.c
>>
>> diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
>> index 0b845ab7c3bf..d14c2243e02a 100644
>> --- a/drivers/scsi/ufs/Kconfig
>> +++ b/drivers/scsi/ufs/Kconfig
>> @@ -132,6 +132,16 @@ config SCSI_UFS_HISI
>>           Select this if you have UFS controller on Hisilicon chipset.
>>           If unsure, say N.
>>
>> +config SCSI_UFS_TI_J721E
>> +       tristate "TI glue layer for Cadence UFS Controller"
>> +       depends on OF && HAS_IOMEM && (ARCH_K3 || COMPILE_TEST)
>> +       help
>> +         This selects driver for TI glue layer for Cadence UFS Host
>> +         Controller IP.
>> +
>> +         Selects this if you have TI platform with UFS controller.
>> +         If unsure, say N.
>> +
>>  config SCSI_UFS_BSG
>>         bool "Universal Flash Storage BSG device node"
>>         depends on SCSI_UFSHCD
>> diff --git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile
>> index 2a9097939bcb..94c6c5d7334b 100644
>> --- a/drivers/scsi/ufs/Makefile
>> +++ b/drivers/scsi/ufs/Makefile
>> @@ -11,3 +11,4 @@ obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
>>  obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
>>  obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
>>  obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
>> +obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o
>> diff --git a/drivers/scsi/ufs/ti-j721e-ufs.c b/drivers/scsi/ufs/ti-j721e-ufs.c
>> new file mode 100644
>> index 000000000000..a653bf1902f3
>> --- /dev/null
>> +++ b/drivers/scsi/ufs/ti-j721e-ufs.c
>> @@ -0,0 +1,90 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> +//
>> +
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#define UFS_SS_CTRL            0x4
>> +#define UFS_SS_RST_N_PCS       BIT(0)
>> +#define UFS_SS_CLK_26MHZ       BIT(4)
>> +
> These looks like vendor specific defines, if so, please add TI_* suffix.
> 

OK, will fix this in v2

>> +static int ti_j721e_ufs_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       unsigned long clk_rate;
>> +       void __iomem *regbase;
>> +       struct clk *clk;
>> +       u32 reg = 0;
>> +       int ret;
>> +
>> +       regbase = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(regbase))
>> +               return PTR_ERR(regbase);
>> +
>> +       /* Select MPHY refclk frequency */
>> +       clk = devm_clk_get(dev, NULL);
>> +       if (IS_ERR(clk)) {
>> +               dev_err(dev, "Cannot claim MPHY clock.\n");
>> +               return PTR_ERR(clk);
>> +       }
> No need to enable MPHY clock? Moreover this clock belongs to MPHY and
> should be handled using generic PHY framework to do that.

pm_runtime_get_sync() call below will make sure all required clocks of
the module are enabled and also Cadence UFS controller/UFSHCD will
enable clocks explicitly. But what is needed here is to setup up wrapper
bit that informs MPHY module what is the frequency of its input clock
(whether its 19.2 MHz or 26MHz). Also this bit is not part of MPHY
address space so it cannot be modeled as PHY driver.

>> +       clk_rate = clk_get_rate(clk);
>> +       if (clk_rate == 26000000)
>> +               reg |= UFS_SS_CLK_26MHZ;
>> +       devm_clk_put(dev, clk);
>> +
> Is this only needed to select one bit in UFS_SS_CLK_26MHz? if so, just
> have a DT property and get this selection from there.
> 

Yes its a single bit. But I don't think DT property is right way to do
especially when bit can be configured at runtime by querying clock
frequency using clk APIs.
In past I have received feedback from DT folks, to have DT describe only
generic properties (such as reg, interrupts, clocks etc) and handle most
other things in driver whenever possible.

>> +       pm_runtime_enable(dev);
>> +       ret = pm_runtime_get_sync(dev);
>> +       if (ret < 0) {
>> +               pm_runtime_put_noidle(dev);
>> +               return ret;
>> +       }
>> +
>> +       /*  Take UFS slave device out of reset */
>> +       reg |= UFS_SS_RST_N_PCS;
> What is the default value of UFS_SS_CLK_26MHZ bit above? Incase 26MHZ
> is not set, then what is default?

Default is of this bit is 0 => 19.2MHz (0 => 192.MHz and 1 => 26MHz)

Let me know if this addresses your comments about UFS_SS_CLK_26MHZ bit
or if any change is needed?
Thanks for the review!

Regard
Vignesh

[...]


-- 
Regards
Vignesh
