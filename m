From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller node
Date: Tue, 27 Oct 2015 10:41:14 +0100
Message-ID: <CACRpkdZRmJTF9_yzVJx_vPKH6M6PivcrPiLD7xMEs5HDvsLw7g@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
	<1445233398-27129-6-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-6-git-send-email-pramodku@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 19, 2015 at 7:43 AM, Pramod Kumar <pramodku@broadcom.com> wrote:

> Add ngpios property to the gpio controller's DT node so that controller
> driver extracts total number of gpio lines present in controller
> from DT and removes dependency on driver.
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
(...)
> +- ngpios:
> +    Total number of GPIOs the controller provides

This description is wrong. The number of GPIOs the controller *provides*
is to be determined by the compatible-string.

ngpios is used to restrict the number of lines *used* or *routed* from
the number *available*. (I hope that is what the code does as well.)
Such as if 12 GPIOs are used of the 32 available on 32bits in a
register.

Update this description to say what it really means.

Yours,
Linus Walleij
