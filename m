From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/8] pinctrl: cygnus: add initial IOMUX driver support
Date: Mon, 9 Mar 2015 17:26:26 +0100
Message-ID: <CACRpkdacEjY3FuczY=tJ26Xpd67m3yYxCKbOVYrRDvjCynwoiw@mail.gmail.com>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	<1425515756-321-4-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425515756-321-4-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>devicetree@
List-Id: devicetree@vger.kernel.org

On Thu, Mar 5, 2015 at 1:35 AM, Ray Jui <rjui@broadcom.com> wrote:

> This adds the initial driver support for the Broadcom Cygnus IOMUX
> controller. The Cygnus IOMUX controller supports group based mux
> configuration but allows certain pins to be muxed to GPIO individually
>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> Tested-by: Dmitry Torokhov <dtor@chromium.org>

Nice and clean.
Patch applied.

Yours,
Linus Walleij
