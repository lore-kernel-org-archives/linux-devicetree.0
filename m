From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/7] iio: adc: sun4i-gpadc-iio: add support for H6
 thermal sensor
Date: Wed, 8 May 2019 12:45:33 +0100
Message-ID: <20190508114533.GG31645@dell>
References: <20190503072813.2719-1-tiny.windzz@gmail.com>
 <20190503072813.2719-7-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503072813.2719-7-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 03 May 2019, Yangtao Li wrote:

> This patch adds support for the H6 ths sensor.
> 
> TODO: calibrate thermal sensor by using information from sid.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 65 +++++++++++++++++++++++++++++++
>  include/linux/mfd/sun4i-gpadc.h   |  9 +++++

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
