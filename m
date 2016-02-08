From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: adc: add support for
 ADC0831/ADC0832/ADC0834/ADC0838 chips
Date: Mon, 8 Feb 2016 15:23:28 -0600
Message-ID: <20160208212328.GA1069@rob-hp-laptop>
References: <1454836456-17033-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454836456-17033-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 07, 2016 at 06:14:16PM +0900, Akinobu Mita wrote:
> This adds ADC0831/ADC0832/ADC0834/ADC0838 8-bit ADC driver.
> I have tested with ADC0831 and ADC0832.  The remaining ADC0834 and
> ADC0838 are very similar to ADC0832.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> ---
> * v2 (Most changes are suggested by Jonathan Cameron)
> - rename driver name from ti-adc083x to ti-adc0832
> - simplify read_raw() by moving lock
> - fix remove() of driver with correct unwinding
> - enable untested chips (adc0831, adc0834, adc0838)
> - fix adc0831_adc_conversion as a result of testing
> 
>  .../devicetree/bindings/iio/adc/ti-adc0832.txt     |  19 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/adc/Kconfig                            |  10 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/ti-adc0832.c                       | 288 +++++++++++++++++++++
>  4 files changed, 318 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc0832.txt
>  create mode 100644 drivers/iio/adc/ti-adc0832.c
> 
