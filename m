From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/4] reset: uniphier: Rename from USB3 reset to glue
 reset and add AHCI reset support
Date: Mon, 19 Nov 2018 10:25:53 +0100
Message-ID: <1542619553.5139.1.camel@pengutronix.de>
References: <1541727727-10821-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541727727-10821-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2018-11-09 at 10:42 +0900, Kunihiko Hayashi wrote:
> This series renames the reset control of core reset included in USB3 glue
> layer with in the glue layer for generic peripherals to allow other devices
> to use it.
> 
> And this series adds support for the core reset included in AHCI glue layer.
> 
> Kunihiko Hayashi (4):
>   dt-bindings: reset: uniphier: Replace the expression of USB3 with
>     generic peripherals
>   reset: uniphier-usb3: Rename to reset-uniphier-glue
>   dt-bindings: reset: uniphier: Add AHCI core reset description
>   reset: uniphier-glue: Add AHCI reset control support in glue layer

Thank you, applied to reset/next.

regards
Philipp
