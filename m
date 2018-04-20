From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 0/3] ave: fix the activation issues for
 some UniPhier SoCs
Date: Fri, 20 Apr 2018 10:50:04 -0400 (EDT)
Message-ID: <20180420.105004.1091571122033406428.davem@davemloft.net>
References: <1524122695-19597-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524122695-19597-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hayashi.kunihiko@socionext.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yamada.masahiro@socionext.com, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org
List-Id: devicetree@vger.kernel.org

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Thu, 19 Apr 2018 16:24:52 +0900

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
> 
> v1: https://www.spinics.net/lists/netdev/msg494904.html
> 
> Changes since v1:
> - Add 'Reviewed-by' lines

Series applied to net-next, thank you.
