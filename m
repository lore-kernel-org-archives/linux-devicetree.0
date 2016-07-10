From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Sun, 10 Jul 2016 22:52:03 +0200
Message-ID: <1746957.vJhcHQMZVi@wuerfel>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com> <20160709232834.31654-1-martin.blumenstingl@googlemail.com> <20160709232834.31654-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160709232834.31654-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday, July 10, 2016 1:28:32 AM CEST Martin Blumenstingl wrote:
> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
> +                               endianness of the EEPROM (based on the two
> +                               magic bytes at the start of the EEPROM)
> +                               matches the host system's native endianness.
> +                               The data will be swapped accordingly if there
> +                               is a mismatch.
> +                               Leaving this disabled means that the EEPROM
> +                               data will be interpreted in the system's
> +                               native endianness, regardless of the magic
> +                               bytes.
> +                               Enable this option only when the magic bytes
> +                               are known to indicate the correct endianness
> +                               of the EEPROM data, because otherwise the
> +                               EEPROM data may be swapped and thus may be
> +                               parsed incorrectly.

Defining properties in terms of "native" endianess is usually not a good
idea, as some architectures (ARMv6+, PowerPC, ...) allow running either
big-endian or little-endian without changing the endianess of device
registers in the process.

It's better to document the property as defaulting to a specific endianess
unless you have an override or the autodetection flag, regardless of
the CPU endianess.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
