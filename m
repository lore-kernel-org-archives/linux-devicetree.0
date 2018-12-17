From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: imx7: Document usage on i.MX8MQ SoCs
Date: Mon, 17 Dec 2018 06:37:22 +0200
Message-ID: <871s6gahvh.fsf@tkos.co.il>
References: <20181217023827.7947-1-andrew.smirnov@gmail.com> <20181217023827.7947-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181217023827.7947-3-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "A.s. Dong" <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-imx@nxp.com, p.zabel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Andrey,

Andrey Smirnov writes:
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

This header file belongs at the next patch in this series, right?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
