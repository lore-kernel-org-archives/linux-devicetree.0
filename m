From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: Enable pinctrl for Broadcom Capri SoCs
Date: Wed, 9 Oct 2013 11:11:28 +0200
Message-ID: <CACRpkdYj2MagpVGbA2k+B_NhhMUfXNpXQxBn1z1kxmTKCLZA4A@mail.gmail.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
	<1380846199-12829-5-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380846199-12829-5-git-send-email-syin@broadcom.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sherman Yin <syin@broadcom.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 4, 2013 at 2:23 AM, Sherman Yin <syin@broadcom.com> wrote:

> Enable pinctrl for Broadcom Capri (BCM281xx) SoCs.
>
> Signed-off-by: Sherman Yin <syin@broadcom.com>
> Reviewed-by: Christian Daudt <bcm@fixthebug.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>
(...)
> +       pinctrl@35004800 {
> +               compatible = "brcm,capri-pinctrl";
> +               reg = <0x35004800 0x430>;
> +       };

What is the point of doing this without defining some pins
and connecting them to some devices?

Yours,
Linus Walleij
