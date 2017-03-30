From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: add a Meson8b compatible
 to the SAR ADC
Date: Thu, 30 Mar 2017 17:47:45 -0500
Message-ID: <20170330224745.v5cgrihkoolufxzo@rob-hp-laptop>
References: <20170325162938.28659-1-martin.blumenstingl@googlemail.com>
 <20170325162938.28659-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170325162938.28659-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 25, 2017 at 05:29:37PM +0100, Martin Blumenstingl wrote:
> The Amlogic Meson SAR ADC driver can be used on Meson8b as well
> (probably on earlier SoC generations as well, but I don't have any
> hardware available for testing that).
> Add a separate compatible for Meson8b because it does not need any of
> the BL30 magic (unlike the GX SoCs).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.txt | 1 +
>  1 file changed, 1 insertion(+)

If you respin, "dt-bindings: iio: adc: ..." for the subject. Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
