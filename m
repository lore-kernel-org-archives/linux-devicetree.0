From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] reset: uniphier-glue: Add Pro5 USB3 support
Date: Fri, 13 Sep 2019 15:36:25 +0100
Message-ID: <5d7ba96a.1c69fb81.b5d1e.fd85@mx.google.com>
References: <1568080527-1767-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568080527-1767-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, 10 Sep 2019 10:55:27 +0900, Kunihiko Hayashi wrote:
> Pro5 SoC has same scheme of USB3 reset as Pro4, so the data for Pro5 is
> equivalent to Pro4.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  Documentation/devicetree/bindings/reset/uniphier-reset.txt | 5 +++--
>  drivers/reset/reset-uniphier-glue.c                        | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
