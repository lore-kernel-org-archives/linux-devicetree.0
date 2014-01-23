From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Rename Broadcom Capri pinctrl driver
Date: Thu, 23 Jan 2014 09:17:08 +0100
Message-ID: <CACRpkdZ+3MC8XpfD-vumvq3yQACzFn89DQjWQeXbdBK+9JmfLQ@mail.gmail.com>
References: <1390343886-25852-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1390343886-25852-1-git-send-email-syin@broadcom.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sherman Yin <syin@broadcom.com>
Cc: Mark Brown <broonie@kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 11:38 PM, Sherman Yin <syin@broadcom.com> wrote:

> To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
> driver and its related CONFIG option are renamed to bcm281xx.
>
> Devicetree compatible string and binding documentation use
> "brcm,bcm11351-pinctrl" to match the machine binding here:
> Documentation/devicetree/bindings/arm/bcm/bcm11351.txt
>
> This driver supports pinctrl on BCM11130, BCM11140, BCM11351, BCM28145
> and BCM28155 SoCs.
>
> Signed-off-by: Sherman Yin <syin@broadcom.com>
> Reviewed-by: Matt Porter <mporter@linaro.org>

Patch applied for fixes.

If it was only the DT bindings that were rushed to change
you *could* have made a patch just changing these and the
binding doc, and give me the option to defer the changing of
variables and function names, but whatever.

Yours,
Linus Walleij
