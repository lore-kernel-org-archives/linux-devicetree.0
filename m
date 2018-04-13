From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: ave: add syscon-phy-mode
 property to configure phy-mode setting
Date: Fri, 13 Apr 2018 12:27:18 -0500
Message-ID: <20180413172718.j2kmpjtdpuldqsj4@rob-hp-laptop>
References: <1523255925-6469-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1523255925-6469-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523255925-6469-3-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 09, 2018 at 03:38:44PM +0900, Kunihiko Hayashi wrote:
> Add "socionext,syscon-phy-mode" property to specify system controller that
> configures the settings about phy-mode.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
