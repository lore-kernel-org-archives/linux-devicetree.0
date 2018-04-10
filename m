From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/3] ave: fix the activation issues for some
 UniPhier SoCs
Date: Tue, 10 Apr 2018 10:53:40 -0400 (EDT)
Message-ID: <20180410.105340.1495043678546637765.davem@davemloft.net>
References: <1523255925-6469-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523255925-6469-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hayashi.kunihiko@socionext.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yamada.masahiro@socionext.com, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org
List-Id: devicetree@vger.kernel.org

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Mon,  9 Apr 2018 15:38:42 +0900

> This add the following stuffs to fix the activation issues and satisfy
> requirements for AVE ethernet driver implemented on some UniPhier SoCs.
> 
> - Add support for additional necessary clocks and resets, because the kernel
>   is stalled on Pro4 due to lack of them.
> 
> - Check whether the SoC supports the specified phy-mode
> 
> - Add DT property support indicating system controller that has the feature
>   for configurating phy-mode including built-in phy on LD11.

The net-next tree is currently closed, please resubmit this when the merge
window is open and I explicitly open the net-next tree for submissions again.

Thank you.
