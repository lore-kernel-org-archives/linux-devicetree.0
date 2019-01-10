From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: vf610-bk4: Provide support for reading ID
 code from MVB device
Date: Thu, 10 Jan 2019 21:22:10 +0800
Message-ID: <20190110132209.GA30487@dragon>
References: <20181113121213.14296-1-lukma@denx.de>
 <20181209215056.22027-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209215056.22027-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 10:50:56PM +0100, Lukasz Majewski wrote:
> The procedure to read this ID value is as follows:
> 
> rmmod spi_fsl_dspi
> insmod spi-gpio.ko
> 
> echo 504 > /sys/class/gpio/export
> cat /sys/class/gpio/gpio504/value
> ...
> echo 511 > /sys/class/gpio/export
> cat /sys/class/gpio/gpio511/value
> 
> rmmod spi-gpio.ko
> insmod spi_fsl_dspi
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Applied, thanks.
