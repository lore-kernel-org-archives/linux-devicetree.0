From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] iio: max5481: Add support for Maxim digital
 potentiometers
Date: Thu, 19 Jan 2017 07:09:23 -0600
Message-ID: <20170119130923.zaro5vgl7l7kidr6@rob-hp-laptop>
References: <20170114212139.GA3418@x220.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170114212139.GA3418-SwUeJysX96B82hYKe6nXyg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthew.weber-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org, maury.anderson-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 14, 2017 at 10:21:39PM +0100, Slawomir Stepien wrote:
> From: Matt Weber <matthew.weber-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org>
> 
> Add implementation for Maxim Integrated 5481, 5482, 5483,
> and 5484 digital potentiometer devices.
> 
> Datasheet:
> http://datasheets.maximintegrated.com/en/ds/MAX5481-MAX5484.pdf
> 
> Signed-off-by: Maury Anderson <maury.anderson-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org>
> Signed-off-by: Matthew Weber <matthew.weber-lFk7bPDcGtkY5TsXZYaR1UEOCMrvLtNR@public.gmane.org>
> Signed-off-by: Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
> ---
> 
> This is my resubmission of this patch after original authors decided not to
> pursuit it inclusion into kernel.
> 
> Tested using signal analyzer.
> 
> Changes since v2:
> * spi write buffer moved to struct max5481_data and ____cacheline_aligned.
> * max5481_write_cmd now uses pointer to struct max5481_data as a first argument.
> 
> Changes since v1:
> * removed not needed '``' and 'c' chars
> * includes are now sorted
> * added coma to last item in enum max5481_variant
> * removed maxpos from struct max5481_cfg
> * max5481_CHANNEL is no MAX5481_CHANNEL and it does not have 'ch' argument
> * max5481_write_cmd is now based around switch
> * removed not needed cast in max5481_write_cmd
> * wpier state is saved after iio_device_unregister
> * changed names in spi_device_id and acpi_device_id to be equal to names in of_device_id
> 
> ---
>  .../bindings/iio/potentiometer/max5481.txt         |  23 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/potentiometer/Kconfig                  |  11 ++
>  drivers/iio/potentiometer/Makefile                 |   1 +
>  drivers/iio/potentiometer/max5481.c                | 216 +++++++++++++++++++++
>  4 files changed, 251 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/max5481.txt
>  create mode 100644 drivers/iio/potentiometer/max5481.c
