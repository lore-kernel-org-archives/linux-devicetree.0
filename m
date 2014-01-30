From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Thu, 30 Jan 2014 14:54:36 +0100
Message-ID: <CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 5:56 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> ARM CLPS711X SYSFLG1 input lines has been added as first user
> of this driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Oh the pain. I am so ambivalent of this patch as it obfuscates
some stuff about the hardware that the driver should know,
while at the same time being elegant in a way.

What does the ARM SoC maintainers think about this approach?

Arnd, Olof, Kevin: is this something you'd like to see deployed?

Yours,
Linus Walleij
