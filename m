From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 5/8] pinctrl: Cygnus: define Broadcom Cygnus
 GPIO/PINCONF binding
Date: Mon, 9 Mar 2015 17:30:45 +0100
Message-ID: <CACRpkdYy75-fH29W-pr5ExuQc6dfO1Xe5UtFr49GAdnVHyXuCg@mail.gmail.com>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	<1425515756-321-6-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1425515756-321-6-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>devicetree@
List-Id: devicetree@vger.kernel.org

On Thu, Mar 5, 2015 at 1:35 AM, Ray Jui <rjui@broadcom.com> wrote:

> Document the GPIO/PINCONF device tree binding for Broadcom Cygnus SoC
>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
(...)

> +- ngpios:
> +    Total number of GPIOs the controller provides

Remind me again. Why don't we know this from the compatible string?

(I paused applying the patches here waiting for the answer.)

Yours,
Linus Walleij
