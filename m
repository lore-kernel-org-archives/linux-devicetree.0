From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Date: Tue, 13 Aug 2019 14:54:27 +0300
Message-ID: <20190813115427.GC2527@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
...
> +Required Properties:
> +- compatible: Should be "sony,imx290"
> +- reg: I2C bus address of the device
> +- clocks: Reference to the xclk clock.
> +- clock-names: Should be "xclk".
> +- clock-frequency: Frequency of the xclk clock.
> +- vdddo-supply: Sensor digital IO regulator.
> +- vdda-supply: Sensor analog regulator.
> +- vddd-supply: Sensor digital core regulator.

Could you also add the link-frequencies property, please?

-- 
Sakari Ailus
