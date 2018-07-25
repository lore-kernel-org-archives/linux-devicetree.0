From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pfuze100: add optional disable
 switch-regulators binding
Date: Wed, 25 Jul 2018 09:33:47 -0600
Message-ID: <20180725153347.GA19576@rob-hp-laptop>
References: <20180723074747.9328-1-m.felsch@pengutronix.de>
 <20180723074747.9328-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180723074747.9328-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, fabio.estevam@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de, Anson.Huang@nxp.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 09:47:46AM +0200, Marco Felsch wrote:
> This binding is used to keep the backward compatibility with the current
> dtb's [1]. The binding informs the driver that the unused switch regulators
> can be disabled.
> If it is not specified, the driver doesn't disable the switch regulators.
> 
> [1] https://patchwork.kernel.org/patch/10490381/
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> ---
> Changes in v3:
>   - rename dt binding, add -sw suffix
>   - fix description
> 
> Changes in V2:
>   - add more information about the binding
>   - rename binding and add vendor prefix
> 
>  Documentation/devicetree/bindings/regulator/pfuze100.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
