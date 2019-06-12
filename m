From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: madera: Add Madera core support for CS47L15
Date: Wed, 12 Jun 2019 09:38:35 +0100
Message-ID: <20190612083835.GY4797@dell>
References: <20190530143953.25799-1-ckeepax@opensource.cirrus.com>
 <20190530143953.25799-2-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530143953.25799-2-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Thu, 30 May 2019, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> This patch adds all the core support and defines for the Cirrus
> Logic CS47L15 smart audio CODEC.
> 
> Registers or fields are named MADERA_* if it is part of the
> common hardware platform and does not conflict with any other
> Madera codecs. It is named CS47L15_* if it is unique to CS47L15
> and conflicts with definitions on other codecs.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/Kconfig                  |    7 +
>  drivers/mfd/Makefile                 |    3 +
>  drivers/mfd/cs47l15-tables.c         | 1301 ++++++++++++++++++++++++++++++++++
>  drivers/mfd/madera-core.c            |   44 ++
>  drivers/mfd/madera-i2c.c             |    7 +
>  drivers/mfd/madera-spi.c             |    7 +
>  drivers/mfd/madera.h                 |    6 +
>  include/linux/mfd/madera/core.h      |    2 +
>  include/linux/mfd/madera/registers.h |    5 +
>  9 files changed, 1382 insertions(+)
>  create mode 100644 drivers/mfd/cs47l15-tables.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
