From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 03/11] dts: pinctrl: Add GPIO to Pinctrl pin mapping in
 DT
Date: Wed, 18 Nov 2015 10:39:30 -0800
Message-ID: <564CC5E2.2070809@gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <1445233398-27129-4-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-4-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On 18/10/15 22:43, Pramod Kumar wrote:
> ASIU gpio controller's pins are muxed with pin-cntroller.
> Add this mapping through property "gpio-ranges".
> 
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Applied to devicetree/next, since there was a bit of restructuring, I
had to manually apply it, please verify the resolution looks correct to you.

Thanks!
-- 
Florian
