From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] mfd: Add Device Tree bindings document for
 retu/tahvo ASIC chips
Date: Mon, 3 Apr 2017 12:13:01 +0100
Message-ID: <20170403111301.52hm4wsplimviqso@dell>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-2-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170401071854.23198-2-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 01 Apr 2017, Javier Martinez Canillas wrote:

> There are Device Tree source files defining a device node for the
> retu/tahvo I2C chip, but there isn't a DT binding document for it.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mfd/retu.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
> new file mode 100644
> index 000000000000..2309e599a731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/retu.txt
> @@ -0,0 +1,19 @@
> +* Device tree bindings for Nokia Retu and Tahvo multi-function device
> +
> +Retu and Tahvo are a multi-function devices found on Nokia Internet
> +Tablets (770, N800 and N810).

More information please.  What functions to they serve?

> +Required properties:
> +- compatible:		"nokia,retu-mfd" or "nokia,tahvo-mfd"
> +- reg:			Specifies the I2C slave address of the ASIC chip
> +
> +Example:
> +
> +i2c0 {
> +	retu_mfd: retu@1 {

Please avoid the term MFD at all times when using Device Tree.  DT is
meant to be OS agnostic and MFD is a Linuxisum.

> +		compatible = "nokia,retu-mfd";
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0x1>;
> +	};
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
