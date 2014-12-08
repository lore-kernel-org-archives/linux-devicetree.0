From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/5] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Mon, 08 Dec 2014 12:22:20 +0100
Message-ID: <2594176.SCRFa6Sb3O@wuerfel>
References: <1418006316-324-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1418006316-324-2-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday 07 December 2014 18:38:32 Ray Jui wrote:
> +Required properties:
> +
> +- compatible:
> +    Currently supported Cygnus GPIO controllers include:
> +    "brcm,cygnus-ccm-gpio": ChipcommonG GPIO controller
> +    "brcm,cygnus-asiu-gpio": ASIU GPIO controller
> +    "brcm,cygnus-crmu-gpio": CRMU GPIO controller

How different are these? If they are almost the same, would it
be better to use the same compatible string for all of them and
describe the differences in extra properties?

If they are rather different, maybe you should have a separate
binding and driver for each?

	Arnd
