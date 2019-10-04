From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 2/2] media: i2c: Add IMX290 CMOS image sensor driver
Date: Fri, 4 Oct 2019 12:23:36 +0300
Message-ID: <20191004092336.GL896@valkosipuli.retiisi.org.uk>
References: <20191003095503.12614-1-manivannan.sadhasivam@linaro.org>
 <20191003095503.12614-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003095503.12614-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Thu, Oct 03, 2019 at 03:25:03PM +0530, Manivannan Sadhasivam wrote:
> Add driver for Sony IMX290 CMOS image sensor driver. The driver only
> supports I2C interface for programming and MIPI CSI-2 for sensor output.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Could you remove the unneeded ret variable from imx290_power_on() and
unneeded goto in the same function?

The MAINTAINERS entry belongs to the first patch adding new files.

Then I think this is good.

-- 
Regards,

Sakari Ailus
