From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] ARM: dts: imx6q: extend support for the cm-fx6
Date: Wed, 8 Jun 2016 10:49:39 +0300
Message-ID: <5757CE13.7040005@compulab.co.il>
References: <20160607171418.1703-1-christopher.spinrath@rwth-aachen.de>
 <1bf474715cdf430a811ba16c82ce6f25@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1bf474715cdf430a811ba16c82ce6f25-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/07/2016 08:14 PM, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org wrote:
> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> 
> The cm-fx6 module has an on-board spi-flash chip for its firmware, an
> eeprom (containing e.g. the mac address of the on-board Ethernet),
> a sata port, a pcie controller, an USB hub, and an USB otg port.
> Enable support for them. In addition, enable syscon poweroff support.
> 
> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Acked-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
