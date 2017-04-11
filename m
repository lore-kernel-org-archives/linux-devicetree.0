From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/9] pinctrl: generic: Add bi-directional and output-enable
Date: Tue, 11 Apr 2017 11:01:22 +0200
Message-ID: <CACRpkdYAbJBgBbPEfhixJ9TrA45bOrzYHEWazyx1yMDm8jTZ+w@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org> <1491401247-7030-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491401247-7030-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> Add bi-directional and output-enable pin configuration properties.
>
> bi-directional allows to specify when a pin shall operate in input and
> output mode at the same time. This is particularly useful in platforms
> where input and output buffers have to be manually enabled.
>
> output-enable is just syntactic sugar to specify that a pin shall
> operate in output mode, ignoring the provided argument.
> This pairs with input-enable pin configuration option.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
