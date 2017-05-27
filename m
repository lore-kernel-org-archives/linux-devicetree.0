From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] misc: ad525x_dpot_spi: Add device tree support
Date: Sat, 27 May 2017 13:08:39 +0200
Message-ID: <5291d904-3dc0-bdfc-b300-28b55ad08815@metafoo.de>
References: <20170526181746.25896-1-roshni.shah@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526181746.25896-1-roshni.shah-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roshni Shah <roshni.shah-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Thanks for the patch.


On 05/26/2017 08:17 PM, Roshni Shah wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ad525x_dpot-spi.txt
> @@ -0,0 +1,44 @@
> +Digital Potentiometers (SPI) compatible with Analog Devices family
> +
> +Required properties:
> +- compatible: Should be one of
> +	* "ad,ad5160"

The Analog Devices vendor prefix is adi.

- Lars
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
