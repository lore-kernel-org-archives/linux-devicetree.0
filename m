From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Tue, 31 Oct 2017 15:28:01 +0000
Message-ID: <20171031152801.njf3ib7lrnu5e3ji@dell>
References: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1508982713.git.baolin.wang@linaro.org>
 <6f9ec429b84973201dc39aeaa31fb829c345b6e0.1508982713.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6f9ec429b84973201dc39aeaa31fb829c345b6e0.1508982713.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, 26 Oct 2017, Baolin Wang wrote:

> This patch adds support for Spreadtrum SC27xx series PMIC MFD core, and It
> provides communication through the SPI interfaces. The SC27xx series PMICs
> contains the following 6 major components:
> - DCDCs
> - LDOs
> - Battery management system
> - Audio codec
> - User interface function, such as indicator, flash LED
> - IC level function, such as power on/off, type-c
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
> Changes since v2:
>  - Add more help information.
>  - Define macros for irq base and irq number.
>  - Use devm_mfd_add_devices() instead of mfd_add_devices(), which means
>  we can remove sprd_pmic_remove().
>  - Rename local variables in sprd_pmic_probe().
> 
> Changes since v1:
>  - Add more documentation to introduce Spreadtrum SC27xx series PMICs.
>  - Modify compatile string property.
>  - Modify reg property.
>  - Remove redundant 'pmic' label.
>  - Change 'should be' to 'must be' for cells properties.
> ---
>  drivers/mfd/Kconfig           |   16 +++
>  drivers/mfd/Makefile          |    1 +
>  drivers/mfd/sprd-sc27xx-spi.c |  258 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c

[...]

> +static int sprd_pmic_spi_read(void *context,
> +			      const void *reg, size_t reg_size,
> +			      void *val, size_t val_size)
> +{
> +	struct device *dev = context;
> +	struct spi_device *spi = to_spi_device(dev);
> +	u32 rx_buf[2] = { 0 };
> +	int ret;
> +
> +	/* Now we only support one PMIC register to read every time. */
> +	if (reg_size != sizeof(u32) || val_size != sizeof(u32))
> +		return -EINVAL;
> +
> +	rx_buf[0] = *(u32 *)reg;

I still don't like this.  It's uuuuuugly!

At the very least, please use an interim variable using a nomenclature
which describes what it is you're trying to achieve.  For instance:

  u32 *addr = reg;

  rx_buf[0] = addr[0];

Or better still ...

  /* Copy address to read from into first element of SPI buffer */
  memcpy(rx_buf, reg, sizeof(u32));

> +	ret = spi_read(spi, rx_buf, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(val, rx_buf, val_size);
> +	return 0;
> +}

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
