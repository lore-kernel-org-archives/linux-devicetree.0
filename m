From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-cm-fx6: add sdio wifi/bt nodes
Date: Sat, 17 Jun 2017 21:23:31 +0800
Message-ID: <20170617132329.GE5902@dragon>
References: <1a13681b84564bc18937eb54b8345957@rwthex-s1-b.rwth-ad.de>
 <3c63d7014b0b4bb596f328ea8018a4cb@rwthex-w1-a.rwth-ad.de>
 <5c93344d-392e-1c2a-4605-11b57fa3f1c4@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5c93344d-392e-1c2a-4605-11b57fa3f1c4-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 11:23:46PM +0200, Christopher Spinrath wrote:
> > Hi Valentin, Igor,
> > 
> > Are you guys fine with the patch?
> 
> Do you have a specific question here?

No, I don't.  I just wanted to hear the voice of Compulab people.  Okay,
we haven't waited for time enough, so I just applied patch.

> 
> The devicetree additions are mostly identical to their counterparts in
> the BSP devicetree. The only real exception being that the usdhc1
> regulators have been replaced by the sd8787 power sequence, which allows
> the mmc core to reset the wifi/bt chip (which is not possible with the
> regulator setup). Note that the sd8787 power sequence binding/driver has
> only recently been added to Linux (v4.11) and is not present in the BSP
> kernel.
> 
> Furthermore, the Bluetooth AMP function is disabled in the BSP kernel
> by CompuLab [1] for the same reason we do not enable the usdhc1 node in
> this patch. (We cannot disable it in the driver because, as explained in
> the commit message, this would yield a regression.)

Thanks for the comments.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
