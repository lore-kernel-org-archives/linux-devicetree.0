From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: nomadik: add interrupt-parent for clcd
Date: Tue, 16 Jan 2018 08:29:17 +0100
Message-ID: <CACRpkdYCu57Y0KZGt9c7iM6nwe7qCxK+PcPC5God-rnOoHFt4Q@mail.gmail.com>
References: <20180115163719.1736753-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115163719.1736753-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm-soc <arm@kernel.org>, stable <stable@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 5:37 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The clcd device is lacking an interrupt-parent property, which makes
> the interrupt unusable and shows up as a warning with the latest
> dtc version:
>
> arch/arm/boot/dts/ste-nomadik-s8815.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
> arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
>
> I looked up the old board files and found that this interrupt has
> the same irqchip as all the other on-chip device, it just needs one
> extra line.
>
> Fixes: 17470b7da11c ("ARM: dts: add the CLCD LCD display to the NHK15")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for not getting to fixing this myself quickly enough.

Yours,
Linus Walleij
