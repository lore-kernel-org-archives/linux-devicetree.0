From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/9] ARM: dts: imx7-colibri: move and rename USB Host
 power regulator
Date: Thu, 21 Dec 2017 16:29:44 +0800
Message-ID: <20171221082943.GO23230@dragon>
References: <20171219181038.1369-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219181038.1369-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 07:10:30PM +0100, Stefan Agner wrote:
> The Colibri default which enables USB Host power is not necessarily
> tied to the OTG2 controller, some carrier board use the pin to
> control USB power for both controllers. Hence name the pinctrl
> group more generic.
> 
> Also move the regulator to the generic eval-v3 device tree since
> the regulator is always on the carrier board. In the Colibri iMX7S
> case the regulator is just not used.  This allows to reuse the
> regulator in a upcoming SKU Colibri iMX7D 1GB with eMMC.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
