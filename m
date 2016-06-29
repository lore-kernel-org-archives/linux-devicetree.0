From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v5 0/2] Add support for SYSCON reset
Date: Wed, 29 Jun 2016 09:47:37 +0200
Message-ID: <1467186457.2278.6.camel@pengutronix.de>
References: <20160627171217.4715-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160627171217.4715-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Am Montag, den 27.06.2016, 12:12 -0500 schrieb Andrew F. Davis:
> Some SoCs contain reset controls for modules that are memory-mapped to
> areas shared with other module configuration settings. This requires
> synchronization across all drivers accessing this memory area. This
> series adds a generic SYSCON reset driver to allow resets toggled
> by bits in memory-mapped registers through SYSCON.
> 
> Changes from v4:
>  - Added two more cells to DT ti,reset-bits property
>  - Re-organized ti,reset-bits flag property defines
>  - Moved TI_SYSCON_RESET in Kconfig
>  - Other small fixes based on comments on v4

Thank you, I have applied both to
git://git.pengutronix.de/git/pza/linux.git reset/next
with Rob's ack.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
