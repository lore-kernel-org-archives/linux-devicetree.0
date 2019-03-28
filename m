From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*
Date: Thu, 28 Mar 2019 10:20:00 -0500
Message-ID: <20190328152000.GA24629@bogus>
References: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Christina Quast <cquast@hanoverdisplays.com>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2019 15:20:40 +0100, Christina Quast wrote:
> In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from
> the documentation.
> 
> Changes since v2:
> * Changed patch title to 'dt-bindings: pinctrl: imx7d:'
> 
> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
> ---
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
