From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Wed, 1 Nov 2017 09:27:03 +0000
Message-ID: <20171101092703.i5t7ejuhcs45cchw@dell>
References: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1509503569.git.baolin.wang@spreadtrum.com>
 <0806380ab2674f78f925b9015e558ffb634f11f1.1509503569.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0806380ab2674f78f925b9015e558ffb634f11f1.1509503569.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 01 Nov 2017, Baolin Wang wrote:

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
> Changes since v3:
>  - Use memcpy() to copy register offset address into SPI buffer.
> 
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
>  drivers/mfd/sprd-sc27xx-spi.c |  259 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
