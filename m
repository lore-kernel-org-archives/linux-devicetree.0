From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: thermal: qoriq: Add optional clocks
 property
Date: Mon, 22 Jul 2019 17:55:35 -0600
Message-ID: <20190722235535.GA2063@bogus>
References: <20190705045612.27665-1-Anson.Huang@nxp.com>
 <20190705045612.27665-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705045612.27665-3-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, angus@akkea.ca, ccaione@baylibre.com, agx@sigxcpu.org, leonard.crestez@nxp.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri,  5 Jul 2019 12:56:09 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Some platforms have clock control for TMU, add optional
> clocks property to the binding doc.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/thermal/qoriq-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
