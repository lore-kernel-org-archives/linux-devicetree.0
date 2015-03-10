From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 5/8] pinctrl: Cygnus: define Broadcom Cygnus
 GPIO/PINCONF binding
Date: Tue, 10 Mar 2015 11:16:55 +0100
Message-ID: <CACRpkdYFfZ+SGJyzOZTHPtVfGZmXgUGqpTNTKWOWuGTHNWSmDA@mail.gmail.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
	<1425933902-20652-6-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425933902-20652-6-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback->
List-Id: devicetree@vger.kernel.org

On Mon, Mar 9, 2015 at 9:44 PM, Ray Jui <rjui@broadcom.com> wrote:

> Document the GPIO/PINCONF device tree binding for Broadcom Cygnus SoC
>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Patch applied!

> +- compatible:
> +    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
> +    "brcm,cygnus-crmu-gpio"

Thanks for making this change. It is very useful because it can now handle
any other variant-specific quirks you may run into.

Yours,
Linus Walleij
