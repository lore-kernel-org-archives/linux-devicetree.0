From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] gpio: lpc32xx: add new LPC32xx GPIO controller driver
Date: Mon, 30 Nov 2015 09:54:10 +0100
Message-ID: <CACRpkdYN+_2qrP3tDDj2SxDAEJr05FnPLKyFPEF9BGdVyQdTuQ@mail.gmail.com>
References: <1447982995-30231-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447982995-30231-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Roland Stigge <stigge@antcom.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 2:29 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> Unfortunately the old driver has too many hacks inherited from the
> ancient legacy NXP BSP and I find it can not be maintained, the new
> driver has compatible interface to device tree clients, so moving
> to the new driver should not impact any GPIO consumers.

Has it been tested on the old hardware too?

Yours,
Linus Walleij
