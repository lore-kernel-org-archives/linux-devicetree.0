From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: si7020: Add devicetree support and trivial bindings
Date: Sun, 30 Oct 2016 22:09:39 -0500
Message-ID: <20161031030939.3q6jpuom7jxphl2o@rob-hp-laptop>
References: <20161025192010.11195-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161025192010.11195-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 09:20:10PM +0200, Paul Kocialkowski wrote:
> This adds devicetree support for the si7020 iio driver. Since it works
> well without requiring any additional property, its compatible string is
> added to the trivial i2c devices bindings list.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/i2c/trivial-devices.txt |  1 +
>  drivers/iio/humidity/si7020.c                             | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
