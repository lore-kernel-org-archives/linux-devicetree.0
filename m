From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/5] pinctrl/lantiq: introduce new dedicated devicetree bindings
Date: Mon, 30 Nov 2015 13:13:25 +0100
Message-ID: <CACRpkdakqKcujE5ZAyCOqiChZjdCMLNP=MESvG4UbUZgyHLeBw@mail.gmail.com>
References: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
	<1448532010-30930-2-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1448532010-30930-2-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>, Jonas Gorski <jogo@openwrt.org>, daniel.schwierzeck@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 11:00 AM, Martin Schiller <mschiller@tdt.de> wrote:

> This patch introduces new dedicated "lantiq,<chip>-pinctrl" devicetree
> bindings, where <chip> is one of "ase", "danube", "xrx100", "xrx200" or
> "xrx300" and marks the "lantiq,pinctrl-xway", "lantiq,pinctrl-ase" and
> "lantiq,pinctrl-xr9" bindings as DEPRECATED.
>
> Based on the newest Lantiq Hardware Description it turend out, that there are
> some differences in the GPIO alternative functions of the Danube, xRX100 and
> xRX200 families, which makes it impossible to use only one xway_mfp table.
>
> This patch also adds support for the xRX300 family.
>
> Signed-off-by: Martin Schiller <mschiller@tdt.de>
> ---
> Changes in v3:
> None

Patch applied.

Yours,
Linus Walleij
