From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 1/2] gpio: mcp23s08: rename the device tree property
Date: Thu, 29 Aug 2013 19:56:33 +0200
Message-ID: <CACRpkdZ9=Wd=WZ4BEQ9qiKSMTyR8gNOYVcaEB_Y_ftufKeafkQ@mail.gmail.com>
References: <1377679131-32082-1-git-send-email-larsi@wh2.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377679131-32082-1-git-send-email-larsi@wh2.tu-dresden.de>
Sender: linux-doc-owner@vger.kernel.org
To: Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2013 at 10:38 AM, Lars Poeschel <larsi@wh2.tu-dresden.de> wrote:

> From: Lars Poeschel <poeschel@lemonage.de>
>
> The device tree property should be more descriptive.
> microchip seems more reasonable than mcp. The old mcp
> prefix is still supported but marked as deprecated.
> Users of mcp have to switch to the microchip prefix.
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Patch applied.

Yours,
Linus Walleij
