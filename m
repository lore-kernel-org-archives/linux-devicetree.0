From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add binding for i.MX8MQ CCM
Date: Thu, 9 Aug 2018 15:37:55 -0600
Message-ID: <20180809213755.GA23245@rob-hp-laptop>
References: <1533825941-17224-1-git-send-email-abel.vesa@nxp.com>
 <1533825941-17224-2-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533825941-17224-2-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 09, 2018 at 05:45:38PM +0300, Abel Vesa wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the binding for the i.MX8MQ Clock Controller Module.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mq-clock.txt     |  20 +
>  include/dt-bindings/clock/imx8mq-clock.h           | 629 +++++++++++++++++++++
>  2 files changed, 649 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.txt
>  create mode 100644 include/dt-bindings/clock/imx8mq-clock.h

Please add acks/reviewed-bys when posting new versions even if it was 
back in January.

Rob
