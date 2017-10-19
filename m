From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/5] gpio: Add driver for Maxim MAX3191x industrial serializer
Date: Thu, 19 Oct 2017 22:41:29 +0200
Message-ID: <CACRpkdYy66+H+Fz7q-Ush4BaSxN3v8mafCL=+RhVBu9pLMpZRQ@mail.gmail.com>
References: <cover.1507797496.git.lukas@wunner.de> <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 12:40 PM, Lukas Wunner <lukas@wunner.de> wrote:

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
> Cc: Mathias Duckeck <m.duckeck@kunbus.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Patch applied.

Yours,
Linus Walleij
