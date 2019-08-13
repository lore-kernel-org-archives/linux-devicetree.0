From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Date: Tue, 13 Aug 2019 12:38:46 +0100
Message-ID: <20190813113846.GG13294@shell.armlinux.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, c.barrett@framos.com, linux-kernel@vger.kernel.org, a.brela@framos.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> +Required Properties:
> +- compatible: Should be "sony,imx290"
> +- reg: I2C bus address of the device
> +- clocks: Reference to the xclk clock.
> +- clock-names: Should be "xclk".
> +- clock-frequency: Frequency of the xclk clock.

Driver code:

+       ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);+       if (ret) {
+               dev_err(dev, "Could not get xclk frequency\n");
+               return ret;
+       }
+
+       /* external clock must be 37.125 MHz */
+       if (xclk_freq != 37125000) {
+               dev_err(dev, "External clock frequency %u is not supported\n",
+                       xclk_freq);
+               return -EINVAL;
+       }

So, only 37125000 is supported - is that not worth mentioning in this
description?  Is this a hard requirement of the sensor?  If so, why
does it need to be mentioned in the DT binding?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
