From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/3] Add IMX290 CMOS image sensor support
Date: Tue, 30 Jul 2019 09:42:57 +0530
Message-ID: <20190730041253.GA3178@Mani-XPS-13-9360>
References: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org
Cc: robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2019 at 12:32:27AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds support for IMX290 CMOS image sensor from Sony.
> Sensor can be programmed through I2C and 4-wire interface but the
> current driver only supports I2C interface. Also, the sensor is
> capable of outputting frames in following 3 interfaces:
> 
> * CMOS logic parallel SDR output
> * Low voltage LVDS serial DDR output
> * CSI-2 serial data output
> 
> But the current driver only supports CSI-2 output available from 4 lanes.
> In the case of sensor resolution, driver only supports 1920x1080 and
> 1280x720 at mid data rate of 445.5 Mpbs.
> 
> The driver has been validated using Framos IMX290 module interfaced to
> 96Boards Dragonboard410c.
> 

Ping on the patchset!

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
>   media: i2c: Add IMX290 CMOS image sensor driver
>   MAINTAINERS: Add entry for IMX290 CMOS image sensor driver
> 
>  .../devicetree/bindings/media/i2c/imx290.txt  |  51 ++
>  MAINTAINERS                                   |   8 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/imx290.c                    | 845 ++++++++++++++++++
>  5 files changed, 916 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
>  create mode 100644 drivers/media/i2c/imx290.c
> 
> -- 
> 2.17.1
> 
