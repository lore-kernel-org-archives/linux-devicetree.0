From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: imx7: Document usage on
 i.MX8MQ SoCs
Date: Mon, 17 Dec 2018 16:51:47 -0600
Message-ID: <20181217225147.GA6109@bogus>
References: <20181217023827.7947-1-andrew.smirnov@gmail.com>
 <20181217023827.7947-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217023827.7947-3-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 16 Dec 2018 18:38:26 -0800, Andrey Smirnov wrote:
> The driver now supports i.MX8MQ, so update bindings accordingly.
> 
> Cc: p.zabel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: cphealy@gmail.com
> Cc: l.stach@pengutronix.de
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  .../bindings/reset/fsl,imx7-src.txt           |  7 +-
>  include/dt-bindings/reset/imx8mq-reset.h      | 64 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/imx8mq-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
