From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 0/3] iio: Add Cosmic Circuits ADC support
Date: Thu, 13 Nov 2014 11:10:51 -0800
Message-ID: <CAL1qeaF0LfbeTE4LxL05mHDBeV775AaW2F9+NsHnOMiVdZHNdw@mail.gmail.com>
References: <1415888044-16635-1-git-send-email-ezequiel.garcia@imgtec.com>
	<1415888044-16635-5-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415888044-16635-5-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ezequiel,

On Thu, Nov 13, 2014 at 6:14 AM, Ezequiel Garcia
<ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> Here goes the third round of this series. You can find the previous patchset
> and its discussion here: http://thread.gmane.org/gmane.linux.kernel.iio/14553.
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
> Ezequiel Garcia (1):
>   DT: Add a vendor prefix for Cosmic Circuits
>
> Phani Movva (2):
>   iio: adc: Cosmic Circuits 10001 ADC driver
>   DT: iio: adc: Add CC_10001 binding documentation

This series (with v4 of patch 2/3):

Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
