From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] gpio: Driver for SYSCON-based GPIOs
Date: Mon, 17 Mar 2014 15:08:12 +0100
Message-ID: <CACRpkdZ1=zARgJfze9obuHZzOzxoMkC9j9oNr8YbnxbksMBogw@mail.gmail.com>
References: <1394560514-9019-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1394560514-9019-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 11, 2014 at 6:55 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> ARM CLPS711X SYSFLG1 input lines has been added as first user
> of this driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

I am happy with this driver, patch applied. Unless someone goes
protesting.

Thanks for your patience Alexander, it's always tricky with these
new things.

Yours,
Linus Walleij
