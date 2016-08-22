From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness swapping configurable via devicetree
Date: Mon, 22 Aug 2016 13:52:07 +0200
Message-ID: <2303906.Xe1WvCfP0V@wuerfel>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com> <20160821144906.30984-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160821144906.30984-6-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday, August 21, 2016 4:49:06 PM CEST Martin Blumenstingl wrote:
> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
> +                               endianness of the EEPROM (using two checks,
> +                               one is based on the two magic bytes at the
> +                               start of the EEPROM and a second one which
> +                               relies on a flag within the EEPROM data)
> +                               matches the host system's native endianness.
> +                               The data will be swapped accordingly if there
> +                               is a mismatch.
> +                               Leaving this disabled means that the EEPROM
> +                               data will always be interpreted in the
> +                               system's native endianness.
> +                               Enable this option only when the EEPROMs
> +                               endianness identifiers are known to be
> +                               correct, because otherwise the EEPROM data
> +                               may be swapped and thus interpreted
> +                               incorrectly.

The property should not describe the driver behavior, but instead
describe what the hardware is like.

A default of "system's native endianess" should not be specified
in a binding, as the same DTB can be used with both big-endian or
little-endian kernels on some architectures (ARM and PowerPC among
others), so disabling the property means that it is guaranteed to
be broken on one of the two.

If we have no reliable way to check the endianess in all combinations,
could we have two properties "eeprom-big-endian" and
"eeprom-little-endian" and mandate that one of them is always used
when discovering the device using DT?

	Arnd
