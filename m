From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/3] iio: Add Cosmic Circuits ADC support
Date: Sat, 10 Jan 2015 14:15:26 +0000
Message-ID: <54B133FE.1020808@kernel.org>
References: <1420577257-10846-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420577257-10846-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/01/15 20:47, Ezequiel Garcia wrote:
> This series add the support for an ADC IP block from Cosmic Circuits.
> The patchset is based on v3.19-rc3.
> 
> As agreed with Rob, this series drops the vendor prefix in the
> adc-reserved-channels DT property. This property is generic enough to
> be used in other drivers (at91 is a potential candidate).
> 
> A follow-up patch can use the property in at91 and add it to the
> IIO generic bindings.
I'm happy - will let this sit for a little while to let Harmut say
if wants to take another look (or give a reviewed-by or similar).

Thanks all,

Jonathan
> 
> Changes from v6:
> 
>   * Dropped the vendor prefix in the adc-reserved-channels property,
>     as suggested by Rob.
>   * Added Andrew's Reviewed-by tags. Andrew reviewed v3, and the driver
>     changed little since then.
>     http://www.spinics.net/lists/linux-iio/msg15630.html.
> 
> Changes from v5:
> 
>   * Fixed CC10001_ADC_CH_MASK macro definition, to separate the channel
>     number from the channel map, as noted by Hartmut.
>   * Return the real error code in devm_regulator_get failure.
> 
> Changes from v4:
> 
>   * Added a compile-time dependency on REGULATOR and HAVE_CLK.
>   * Replaced the silly XOR operation for a proper mask out of the
>     available channels.
> 
> Changes from v3:
> 
>   * Fixed a few style nitpicks as per Hartmut's feedback.
>   * Used GENMASK() to build the channel mask, which fixes a very nasty
>     bug. Also found by Hartmut.
> 
> Changes from v2:
> 
>   * Changed a devicetree property from adc-available-channels to
>     adc-reserved-channels, so it can be made optional.
>   * Renamed the driver from cc_10001_xxx to cc10001_xxx so it's consistent
>     with the rest of the kernel style.
>   * Some more minor cosmetic fixes.
> 
> Changes from v1:
> 
>   * Removed unneeded header includes.
>   * Changed all the names and macros prefix: s/CC_10001_/CC10001_.
>   * Used .update_scan_mode callback to preallocate the buffer.
>   * Used indio_dev for the struct iio_dev.
>   * Only read the regulator voltage when needed.
>   * Fixed probe() error handling.
>   * Used for_each_set_bit() instead of open-coding it.
>   * Name the power-down register as _POWER_UP, to make the code
>     less silly.
>   * Error out when no valid sample can be read (i.e. when end-of-conversion
>     poll times out).
>   * ... plus some assorted code cleaning based on the feedback.
> 
> Ezequiel Garcia (1):
>   DT: Add a vendor prefix for Cosmic Circuits
> 
> Phani Movva (2):
>   iio: adc: Cosmic Circuits 10001 ADC driver
>   DT: iio: adc: Add CC_10001 binding documentation
> 
>  .../devicetree/bindings/iio/adc/cc10001_adc.txt    |  22 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/iio/adc/Kconfig                            |  11 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/cc10001_adc.c                      | 423 +++++++++++++++++++++
>  5 files changed, 458 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
>  create mode 100644 drivers/iio/adc/cc10001_adc.c
> 
