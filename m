From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] pinctrl: Qualcomm 8x74 pinctrl driver
Date: Fri, 6 Dec 2013 14:56:59 +0100
Message-ID: <CACRpkdaYPSJbL80tbFaNP9aTFc+_AKsT=rd-yxc0R6K-M_Tz9A@mail.gmail.com>
References: <1386295805-13708-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386295805-13708-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 6, 2013 at 3:10 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> This series adds a pinctrl, pinmux, pinconf and gpiolib driver for the
> Qualcomm TLMM block found in recent Qualcomm SoCs (8x60 and newer).
> It designed with both v2 and v3 of the block in mind and comes with initial
> definitions for the 8x74 SoCs.
> This should be filled in with more data and definitions for more SoCs.
>
> Regards,
> Bjorn
>
> v2
> --
> * Replaced subnode dt parsing with generic pinctrl function
> * Installing irq_handler as chained irq handler
> * Added call to handle_bad_irq() when no irqs are pending in irq handler
> * Creating irq mapping at probe() and cleaned up the code accordingly
> * Replaced pinctrl_add_gpio_range with gpiochip_add_pin_range
> * Other minor updates based on review comments

I can't see any problem with these patches, and they only use standard
bindings, so I've applied all three so we get some linux-next rotation
and build coverage. Any remaining problems can certainly be fixed
with incremental patches.

Thanks!
Linus Walleij
