From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] Documentation: add the binding file for Freescale
 vf610 ADC driver
Date: Tue, 26 Nov 2013 21:37:39 +0800
Message-ID: <20131126133737.GA5402@S2101-09.ap.freescale.net>
References: <1385463394-11157-1-git-send-email-B38611@freescale.com>
 <1385463394-11157-4-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385463394-11157-4-git-send-email-B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 26, 2013 at 06:56:34PM +0800, Fugang Duan wrote:
> +Optional properties:
> +- fsl,adc-io-pinctl: Enable field for the I/O port control of MCU pins used as analog inputs.
> +- fsl,adc-vref: ADC refrence voltage value, unit is uV.
> +- fsl,adc-clk-div: Current clock divider value, such as 1,2,4,8,16 and so on.
> +- fsl,adc-res: ADC conversion mode selection, such as 8 for 8-bit, 10 for 10-bit, 12 for 12-bit mode.
> +- fsl,adc-sam-time: ADC sample time duration, number of ADC clocks, such as 2, 4, 6, 8, 12, 16, 20, 24
> +- fsl,adc-aver-sam-sel: Determines how many ADC conversions will be averaged to create the ADC average result.
> +			The Optional value is 4, 8, 16, 32.
> +- fsl,adc-hw-aver-en: Bool type to decide enable hardware average function.
> +- fsl,adc-low-power-mode: Bool type to decide enable ADC low power mode.
> +- fsl,adc-high-speed-conv: Bool type to decide enable ADC high speed mode.
> +- vref: The regulator to support ADC refrence voltage.

Shouldn't it be vref-supply?

Shawn
