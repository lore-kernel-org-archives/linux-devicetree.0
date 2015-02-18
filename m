From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: amba uarts - arm type uarts fifo size provided by device tree
Date: Wed, 18 Feb 2015 19:06:02 +0000
Message-ID: <20150218190601.GI29429@leverpostej>
References: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424285593-2886-1-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Please Cc lakml for patches in this area in future.

On Wed, Feb 18, 2015 at 06:53:11PM +0000, Jorge Ramirez-Ortiz wrote:
> [PATCH 1/2] Documentation: bindings: add optional fifo size property
> [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present
> 
> 
> These patches aim at resolving an issue present on some of the amba pl011
> uarts.  

Which systems are affected? Neither of your two patches add the property
to any dts file.

> Some of these arm type uarts have their fifo sizes not defined in terms of the
> amba_rev register. 

What does said register actually contain?

Is this a full PL011, or a cut-down SBSA UART?

Mark.

> Those uarts should be able to declare their fifo sizes using the optional
> property "fifo-size" in the device tree. This device tree setting shall take
> precedence over any other values. 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
