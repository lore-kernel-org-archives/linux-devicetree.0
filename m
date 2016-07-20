From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: adc: add ADC12130/ADC12132/ADC12138 ADC driver
Date: Tue, 19 Jul 2016 20:11:47 -0500
Message-ID: <20160720011147.GA4383@rob-hp-laptop>
References: <1468854029-22153-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468854029-22153-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 12:00:29AM +0900, Akinobu Mita wrote:
> This adds Texas Instruments' ADC12130/ADC12132/ADC12138 12-bit plus
> sign ADC driver.  I have tested with the ADC12138.  The ADC12130 and
> ADC12132 are not tested but these are similar to ADC12138 except that
> the mode programming instruction is a bit different.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/ti-adc12138.txt    |  32 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/adc/Kconfig                            |  12 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/ti-adc12138.c                      | 541 +++++++++++++++++++++
>  4 files changed, 586 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc12138.txt
>  create mode 100644 drivers/iio/adc/ti-adc12138.c
