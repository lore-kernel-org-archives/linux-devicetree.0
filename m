From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v4 2/2] irqchip: add support for Sigma Designs
 SMP86xx/SMP87xx interrupt controller
Date: Thu, 18 Feb 2016 01:34:05 +0000
Message-ID: <20160218013405.GN5183@io.lakedaemon.net>
References: <1453313237-18570-1-git-send-email-mans@mansr.com>
 <1453313237-18570-2-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453313237-18570-2-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mans,

On Wed, Jan 20, 2016 at 06:07:17PM +0000, Mans Rullgard wrote:
> This adds support for the secondary interrupt controller used in Sigma
> Designs SMP86xx and SMP87xx chips.
> 
> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> ---
> Changes from v3:
> - use of_address_to_resource() rather accessing "reg" property directly
> 
> Boot tested on SMP8643 (tango3) and SMP8759 (tango4)
> ---
>  drivers/irqchip/Kconfig     |   5 +
>  drivers/irqchip/Makefile    |   1 +
>  drivers/irqchip/irq-tango.c | 232 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 238 insertions(+)
>  create mode 100644 drivers/irqchip/irq-tango.c

Applied to irqchip/tango with Marc's Acked-by.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
