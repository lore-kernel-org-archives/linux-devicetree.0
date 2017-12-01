From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Fri, 1 Dec 2017 14:49:00 +0100
Message-ID: <20171201134900.GE22599@lunn.ch>
References: <1512090230-27594-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1512090230-27594-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512090230-27594-3-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 01, 2017 at 10:03:50AM +0900, Kunihiko Hayashi wrote:
> The UniPhier platform from Socionext provides the AVE ethernet
> controller that includes MAC and MDIO bus supporting RGMII/RMII
> modes. The controller is named AVE.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>

Hi Kunihiko

I reviewed the PHY and MDIO code. It all looks good. I cannot say much
about the rest of it though.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
