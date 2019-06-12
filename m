From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] mfd: madera: Add Madera core support for CS47L92
Date: Wed, 12 Jun 2019 09:38:46 +0100
Message-ID: <20190612083846.GZ4797@dell>
References: <20190530143953.25799-1-ckeepax@opensource.cirrus.com>
 <20190530143953.25799-3-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530143953.25799-3-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Thu, 30 May 2019, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> This patch adds all the core support and defines for the Cirrus
> Logic CS42L92, CS47L92 and CS47L93 smart audio CODECs.
> 
> Registers or fields are named MADERA_* if it is part of the
> common hardware platform and does not conflict with any other
> Madera codecs. It is named CS47L15_* if it is unique to CS47L15
> and conflicts with definitions on other codecs.
> 
> Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/Kconfig                  |    7 +
>  drivers/mfd/Makefile                 |    3 +
>  drivers/mfd/cs47l92-tables.c         | 1948 ++++++++++++++++++++++++++++++++++
>  drivers/mfd/madera-core.c            |   58 +
>  drivers/mfd/madera-i2c.c             |   11 +
>  drivers/mfd/madera-spi.c             |   11 +
>  drivers/mfd/madera.h                 |    7 +
>  include/linux/mfd/madera/core.h      |    4 +
>  include/linux/mfd/madera/registers.h |  195 ++++
>  9 files changed, 2244 insertions(+)
>  create mode 100644 drivers/mfd/cs47l92-tables.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
