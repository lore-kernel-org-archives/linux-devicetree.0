From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: mcp23s08: Add irq functionality for i2c chips
Date: Fri, 17 Jan 2014 15:31:39 +0100
Message-ID: <CACRpkdYuyLc76Md9=WOsNCssjLs8b+FGX-nxhheR=6jHcWnkgw@mail.gmail.com>
References: <1389869055-9467-1-git-send-email-larsi@wh2.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1389869055-9467-1-git-send-email-larsi@wh2.tu-dresden.de>
Sender: linux-doc-owner@vger.kernel.org
To: Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: Lars Poeschel <poeschel@lemonage.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 11:44 AM, Lars Poeschel <larsi@wh2.tu-dresden.de> wrote:

> From: Lars Poeschel <poeschel@lemonage.de>
>
> This adds interrupt functionality for i2c chips to the driver.
> They can act as a interrupt-controller and generate interrupts, if
> the inputs change.
> This is tested with a mcp23017 chip on an arm based platform.
>
> v3:

It's beautiful. Patch applied.

Yours,
Linus Walleij
