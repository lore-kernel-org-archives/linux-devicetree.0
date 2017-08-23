From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] gpio: Add driver for Maxim MAX3191x industrial serializer
Date: Wed, 23 Aug 2017 10:09:56 +0200
Message-ID: <CACRpkdYVSTgPo=7DVWr+RMMOZma8pzzmA9AAdjWhy-LVJ35RvQ@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <df530ae703fcfdf52d27a1b6d19b6d1a4724b103.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <df530ae703fcfdf52d27a1b6d19b6d1a4724b103.1503319573.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 3:12 PM, Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> wrote:

> The driver was developed for and tested with the MAX31913 built into
> the Revolution Pi by KUNBUS, but should work with all members of the
> MAX3191x family:
>
> MAX31910: low power
> MAX31911: LED drivers
> MAX31912: LED drivers + 2nd voltage monitor + low power
> MAX31913: LED drivers + 2nd voltage monitor
> MAX31953: LED drivers + 2nd voltage monitor + isolation
> MAX31963: LED drivers + 2nd voltage monitor + isolation + buck regulator
>
> They are similar to but more versatile than the TI SN65HVS880/2/3/5
> supported by gpio-pisosr.c as they clock out a CRC checksum to guard
> against electromagnetic interference, as well as undervoltage and
> overtemperature indicator bits.  If these features are not needed
> they can be disabled by pulling the "modesel" pin high and then
> gpio-pisosr.c can be used instead of the present driver.
>
> Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>

This looks like a fine piece of driver.

We just need to get the infrastructure in place and I can
merge it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
