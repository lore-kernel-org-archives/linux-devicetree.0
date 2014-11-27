From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] ARM: meson: select PINCTRL_MESON and ARCH_REQUIRE_GPIOLIB
Date: Thu, 27 Nov 2014 14:49:24 +0100
Message-ID: <CACRpkdYSvOqvttyZw0wgDhXxRGR0KLfRi-N5Ym5W4mzjAV9=Eg@mail.gmail.com>
References: <1416168856-12747-1-git-send-email-b.galvani@gmail.com>
	<1416168856-12747-4-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416168856-12747-4-git-send-email-b.galvani@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 16, 2014 at 9:14 PM, Beniamino Galvani <b.galvani@gmail.com> wrote:

> Make sure that the Meson pinctrl driver is built whenever Meson
> support is enabled.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

(Given we can merge the pinctrl driver)

Please merge this through the ARM SoC tree.

Yours,
Linus Walleij
