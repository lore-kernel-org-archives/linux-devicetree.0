From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 UL/ULL
 devicetree bindings
Date: Tue, 1 Oct 2019 17:18:09 -0500
Message-ID: <20191001221809.GA23905@bogus>
References: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com, Stefan Riedmueller <s.riedmueller@phytec.de>
List-Id: devicetree@vger.kernel.org

On Fri, 20 Sep 2019 13:52:25 +0200, Stefan Riedmueller wrote:
> Add devicetree bindings for i.MX6 UL/ULL based phyCORE-i.MX6 UL/ULL and
> phyBOARD-Segin.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Changes in v2:
>  - Use seperate description for each board instead of squashing them into
>    the standard board.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
