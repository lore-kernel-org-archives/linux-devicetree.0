From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 1/2] ARM: kirkwood: provide pinctrl default to sdio
 nodes
Date: Sun, 24 Nov 2013 11:59:32 -0500
Message-ID: <20131124165932.GG29241@titan.lakedaemon.net>
References: <1384525225-591-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384525225-591-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 03:20:24PM +0100, Sebastian Hesselbarth wrote:
> SDIO controllers found on Marvell Kirkwood 6281/6282 SoCs require
> pins to be muxed by pinctrl. As there is only one sane pinctrl
> setting for this, provide default pinctrl properties to the controller
> nodes.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
> I am not sending this two patches to each DT maintainer, as it is a
> Kirkwood only thing, added the dt list for completeness.
> 
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/kirkwood-6281.dtsi |    2 ++
>  arch/arm/boot/dts/kirkwood-6282.dtsi |    2 ++
>  2 files changed, 4 insertions(+), 0 deletions(-)

Series applied to mvebu/dt

thx,

Jason.
