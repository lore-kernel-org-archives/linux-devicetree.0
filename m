From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 0/3] iio: Add Cosmic Circuits ADC support
Date: Fri, 5 Dec 2014 08:55:40 -0300
Message-ID: <54819D3C.7000209@imgtec.com>
References: <1417102762-5123-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417102762-5123-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On 11/27/2014 12:39 PM, Ezequiel Garcia wrote:
> Changes from v4:
> 
>   * Added a compile-time dependency on REGULATOR and HAVE_CLK.
> 
>   * Replaced the silly XOR operation for a proper mask out of the
>     available channels.
> 
> Changes from v3:
> 
>   * Fixed a few style nitpicks as per Hartmut's feedback.
> 
>   * Used GENMASK() to build the channel mask, which fixes a very nasty
>     bug. Also found by Hartmut.
> 
> Changes from v2:
> 
>   * Changed a devicetree property from adc-available-channels to
>     adc-reserved-channels, so it can be made optional.
> 
>   * Renamed the driver from cc_10001_xxx to cc10001_xxx so it's consistent
>     with the rest of the kernel style.
> 
>   * Some more minor cosmetic fixes.
> 
> Changes from v1:
> 
>   * Removed unneeded header includes.
> 
>   * Changed all the names and macros prefix: s/CC_10001_/CC10001_.
> 
>   * Used .update_scan_mode callback to preallocate the buffer.
> 
>   * Used indio_dev for the struct iio_dev.
> 
>   * Only read the regulator voltage when needed.
> 
>   * Fixed probe() error handling.
> 
>   * Used for_each_set_bit() instead of open-coding it.
> 
>   * Name the power-down register as _POWER_UP, to make the code
>     less silly.
> 
>   * Error out when no valid sample can be read (i.e. when end-of-conversion
>     poll times out).
> 
>   * ... plus some assorted code cleaning based on the feedback.
> 
> 
> Ezequiel Garcia (1):
>   DT: Add a vendor prefix for Cosmic Circuits
> 
> Phani Movva (2):
>   iio: adc: Cosmic Circuits 10001 ADC driver
>   DT: iio: adc: Add CC_10001 binding documentation
> 

Unless there are any outstanding issues with this series, it'd be great
to merge it for v3.19.

Thanks!
-- 
Ezequiel
