From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] dt-bindings: i2c: eeprom: Add Renesas R1EX24128
Date: Mon, 27 Nov 2017 20:06:35 +0100
Message-ID: <CAMRc=MdDMKuEXx+WqLmJsUY0=jiubiQ2CFM6Hhd-tyU=m1cw9g@mail.gmail.com>
References: <1510839994-12473-1-git-send-email-geert+renesas@glider.be> <20171127180528.rg5imhfthbso477s@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20171127180528.rg5imhfthbso477s@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2017-11-27 19:05 GMT+01:00 Wolfram Sang <wsa@the-dreams.de>:
> Bartosz,
>
>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 +-
>
> I just noticed this file is missing in the AT24 entry in MAINTAINERS. I
> wanted to prepare a patch for that but then I was wondering if the name
> "eeprom.txt" is really suitable? I have doubts. Would "at24.txt" be a
> better name maybe? Rob?
>
> Kind regards,
>
>    Wolfram
>

Yes, it definitely should be called at24.txt - especially that we have
the legacy eeprom module in drivers/misc/eeprom/eeprom.c which has
nothing to do with the bindings in eeprom.txt.

Acked-in-advance-by: Bartosz Golaszewski <brgl@bgdev.pl>

Thanks,
Bartosz
