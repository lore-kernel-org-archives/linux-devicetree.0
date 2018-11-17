From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: uniphier: Replace the expression
 of USB3 with generic peripherals
Date: Sat, 17 Nov 2018 10:30:13 -0600
Message-ID: <20181117163013.GA4481@bogus>
References: <1541727727-10821-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1541727727-10821-2-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541727727-10821-2-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

On Fri,  9 Nov 2018 10:42:04 +0900, Kunihiko Hayashi wrote:
> Replace the expression of "USB3 glue layer" with the glue layer of the
> generic peripherals to allow other devices to use it. The reset control
> belongs to this glue layer.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  .../devicetree/bindings/reset/uniphier-reset.txt   | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
