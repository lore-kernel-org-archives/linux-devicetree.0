From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v4 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Tue, 17 Nov 2015 22:30:19 +0100 (CET)
Message-ID: <1326700858.341668.1447795819246.JavaMail.open-xchange@oxbaltgw05.schlund.de>
References: <1447790576-29410-1-git-send-email-ariel@vanguardiasur.com.ar> <1447790576-29410-3-git-send-email-ariel@vanguardiasur.com.ar>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447790576-29410-3-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> hat am 17. November 2015 um
> 21:02 geschrieben:
>
>
> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
> LPC185x/3x and LPC435x/3x/2x/1x devices.
>
> EEPROM size is 16384 bytes and it can be entirely read and
> written/erased with 1 word (4 bytes) granularity. The last page
> (128 bytes) contains the EEPROM initialization data and is not writable.
>
> Erase/program time is less than 3ms. The EEPROM device requires a
> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividing
> the system bus clock by the division factor, contained in the divider
> register (minus 1 encoded).
>
> EEPROM will be kept in Power Down mode except during read/write calls.
>
> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>

Acked-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

Btw Rob Herring acked [PATCH v3 1/4] yesterday.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
