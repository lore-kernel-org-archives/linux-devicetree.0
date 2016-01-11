From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] iio:adc:at91_adc8xx: introduce new atmel adc
 driver
Date: Sun, 10 Jan 2016 20:32:39 -0600
Message-ID: <20160111023239.GA27025@rob-hp-laptop>
References: <1452096759-19438-1-git-send-email-ludovic.desroches@atmel.com>
 <1452096759-19438-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452096759-19438-2-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 06, 2016 at 05:12:35PM +0100, Ludovic Desroches wrote:
> This driver supports the new version of the Atmel ADC device introduced
> with the SAMA5D2 SoC family.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/at91_adc8xx.txt    |  28 ++

For the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/adc/Kconfig                            |  11 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/at91_adc8xx.c                      | 461 +++++++++++++++++++++
>  4 files changed, 501 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
