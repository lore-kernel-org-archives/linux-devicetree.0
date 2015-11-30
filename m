From: Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Devicetree support for misc/eeprom/eeprom_93xx46.
Date: Mon, 30 Nov 2015 17:04:21 +0000
Message-ID: <1448903060754.7335@zii.aero>
References: <1448429452-26972-1-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448429452-26972-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CoryTusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "agust-ynQEQJNshbs@public.gmane.org" <agust-ynQEQJNshbs@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org" <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "afd-l0cyMroinI0@public.gmane.org" <afd-l0cyMroinI0@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, Keith Vennel <Keith.Vennel-c8ZVq/bFV1I@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/25/2015 12:30 AM, Cory Tusar wrote:
> This series of patches adds an initial set of devicetree bindings to the
> eeprom_93xx46 driver which mirror the configuration options previously
> available as a platform device.  These bindings are then extended to
> include support for specific Atmel devices in this family and also to
> support GPIO-based selection of the device (e.g. for use with an SPI bus
> mux).
>
> Additionally, an address aliasing issue with 16-bit read and write
> accesses in the eeprom_93xx46 driver discovered during testing is fixed.
>
> Changes since v2:
>   - Changed node name to 'eeprom' in DT bindings example.
>   - Simplified several bits of return logic.
>   - Removed #ifdef CONFIG_OF.
>   - Allow compiler to handle promotion to bool return values.
>   - Reworked GPIO handling to use gpiod_* functions throughout (and
>     fixed an oversight where GPIO flags were being ignored).
>
> Changes since v1:
>   - Consolidated all Documentation/devictree additions into a single patch.
>   - Clarified compatible string shall be only one of the supported values.
>   - Renamed the 'select-gpio' binding to 'select-gpios'.
>
> Cory Tusar (5):
>   misc: eeprom_93xx46: Fix 16-bit read and write accesses.
>   Documentation: devicetree: Add DT bindings to eeprom_93xx46 driver.
>   misc: eeprom_93xx46: Implement eeprom_93xx46 DT bindings.
>   misc: eeprom_93xx46: Add quirks to support Atmel AT93C46D device.
>   misc: eeprom_93xx46: Add support for a GPIO 'select' line.
>
>  .../devicetree/bindings/misc/eeprom-93xx46.txt     |  25 +++
>  drivers/misc/eeprom/eeprom_93xx46.c                | 212 +++++++++++++++++----
>  include/linux/eeprom_93xx46.h                      |   9 +
>  3 files changed, 210 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/eeprom-93xx46.txt

Entire series was...

Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>

...on a Freescale i.MX51 platform with a Microchip 93LC46A EEPROM.

________________________________


This email and any files transmitted with it are confidential & proprietary to Systems and Software Enterprises, LLC. This information is intended solely for the use of the individual or entity to which it is addressed. Access or transmittal of the information contained in this e-mail, in full or in part, to any other organization or persons is not authorized.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
