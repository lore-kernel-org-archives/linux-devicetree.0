From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: uniphier: add USB3 core reset
 support
Date: Wed, 11 Jul 2018 13:37:30 -0600
Message-ID: <20180711193730.GA31593@rob-hp-laptop>
References: <1531185257-16444-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1531185257-16444-2-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531185257-16444-2-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 10:14:16AM +0900, Kunihiko Hayashi wrote:
> Add DT bindings for reset control of USB3 core implemented in UniPhier SoCs.
> The reset control belongs to USB3 glue layer.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  .../devicetree/bindings/reset/uniphier-reset.txt   | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
