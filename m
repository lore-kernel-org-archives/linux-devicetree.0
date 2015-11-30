From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/7] pinctrl: use ngpios propety from DT
Date: Mon, 30 Nov 2015 09:36:49 +0100
Message-ID: <CACRpkdYsgAqQaMNwjCSnZy_47JACTyNtW7qfUKSk4f0=1GPV0g@mail.gmail.com>
References: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
	<1447905139-16002-4-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447905139-16002-4-git-send-email-pramodku@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 4:52 AM, Pramod Kumar <pramodku@broadcom.com> wrote:

> Since identical hardware is used in several instances and every
> instance will have different in-use pins. Hence extracting this
> number from DT via "ngpios" property.
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Patch applied.

Yours,
Linus Walleij
