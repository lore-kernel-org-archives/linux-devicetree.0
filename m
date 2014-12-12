From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/3] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Fri, 12 Dec 2014 13:08:05 +0100
Message-ID: <1918116.UxUgDPTmcq@wuerfel>
References: <1418342706-14755-2-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1418342706-14755-2-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 11 December 2014 16:05:04 Ray Jui wrote:
> +
> +- linux,gpio-base:
> +    Base GPIO number of this controller
> +
> 

We've NAK'ed properties like this multiple times before, and it
doesn't get any better this time. What are you trying to achieve
here?

	Arnd
