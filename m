From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: uniphier-glue: Add Pro5 USB3 support
Date: Tue, 10 Sep 2019 13:59:52 +0200
Message-ID: <1568116792.3062.3.camel@pengutronix.de>
References: <1568080527-1767-1-git-send-email-hayashi.kunihiko@socionext.com>
         <1568101695.3062.1.camel@pengutronix.de>
         <20190910205640.6ABD.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910205640.6ABD.4A936039@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Kunihiko,

On Tue, 2019-09-10 at 20:56 +0900, Kunihiko Hayashi wrote:
[...]
> This driver is derived from reset-simple, so the method to control reset
> in the glue block is the same for each SoC.
> 
> And both Pro4 and Pro5 need same parent clock and reset, so the data for
> these SoCs refer same parent clock names and parent reset names.
> 
> However, since the glue block itself can be different, I think that
> compatible string should be distinguished for each SoC.

Ok, in that case I'll apply the patch as-is. Thank you for clarifying.

regards
Philipp
