From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: device trees for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Tue, 17 Dec 2013 12:37:51 +0100
Message-ID: <20131217113750.GB5307@netboy>
References: <20131216190953.GB14866@pengutronix.de>
 <1387221123-6794-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387221123-6794-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 16, 2013 at 08:12:03PM +0100, Uwe Kleine-K=F6nig wrote:

> +		cmu: cmu@400c8000 {
> +			compatible =3D "efm32gg,cmu";

I was able to run this on the EFM32LG without problems.  Are you sure
this CMU node is specific to the GG, or can it be shared?

Thanks,
Richard

> +			reg =3D <0x400c8000 0x400>;
> +			interrupts =3D <32>;
> +			#clock-cells =3D <1>;
> +		};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
