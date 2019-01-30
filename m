Return-Path: <robherring2@gmail.com>
Date: Wed, 30 Jan 2019 12:55:43 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Message-ID: <20190130185543.GA22259@bogus>
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
 <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, 22 Jan 2019 09:31:46 +0000, Jacky Bai wrote:
> From: Bai Ping <ping.bai@nxp.com>
> 
> Add the clock binding doc for i.MX8MM.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  change v1->v2
>  - add the provider node example;
>  - replace table with space after define.
> ---
>  .../devicetree/bindings/clock/imx8mm-clock.txt     |  29 +++
>  include/dt-bindings/clock/imx8mm-clock.h           | 244 +++++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.txt
>  create mode 100644 include/dt-bindings/clock/imx8mm-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
