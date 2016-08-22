From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/5] ath9k: Set the "big endian" bit of the AR9003 EEPROM templates
Date: Mon, 22 Aug 2016 13:47:05 +0200
Message-ID: <3744898.ltfZjZgAjj@wuerfel>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com> <20160821144906.30984-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160821144906.30984-3-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday, August 21, 2016 4:49:03 PM CEST Martin Blumenstingl wrote:
> We will default to the system's native endianness for the eepmisc value.
> This may be overwritten by the actual calibration data. If it is not
> overwritten we interpret the template data in it's native endianness,
> meaning that no swapping is required.

I'm still skeptical about this one. What is the significance of "native
endianess" here? You are keying the endianess of the eeprom tables off the
way the CPU operates, but for a PCI device there is no correlation between
those two.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
