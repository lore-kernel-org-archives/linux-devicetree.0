From: Florian Fainelli <fainelli@broadcom.com>
Subject: Re: [PATCH v2 5/6] ARM: brcmstb: Select ARCH_WANT_OPTIONAL_GPIOLIB
Date: Fri, 29 May 2015 14:53:42 -0700
Message-ID: <5568DFE6.9030505@broadcom.com>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com> <1432865650-4062-6-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1432865650-4062-6-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On 28/05/15 19:14, Gregory Fong wrote:
> Select ARCH_WANT_OPTIONAL_GPIOLIB from BRCMSTB to allow GPIOLIB and
> GPIO_BRCMSTB to be enabled.
> 
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>

Applied to soc/next, thanks!
-- 
Florian
