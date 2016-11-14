From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6q-cm-fx6: fix fec pinctrl
Date: Mon, 14 Nov 2016 15:34:02 +0800
Message-ID: <20161114073401.GM3310@dragon>
References: <6cd823201b9f4cde8de8eddc910f39ce@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6cd823201b9f4cde8de8eddc910f39ce-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2016 at 04:59:38PM +0100, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org wrote:
> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> 
> According to the schematics of CompuLab's sbc-fx6 baseboard and the
> vendor devicetree GPIO_16 is *not* muxed to ENET_REF_CLK but to SPDIF_IN.
> 
> Remove the wrong pinctrl setting.
> 
> Fixes: 682d055e6ac5 ("ARM: dts: Add initial support for cm-fx6.")
> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

Applied both, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
