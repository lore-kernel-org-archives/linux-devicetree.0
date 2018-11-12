Return-Path: <robherring2@gmail.com>
Message-ID: <5bea0ea0.1c69fb81.31ed4.2cdf@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: can: m_can: Document transceiver
 implementation as a phy
References: <20181102192616.28291-1-faiz_abbas@ti.com>
 <20181102192616.28291-5-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102192616.28291-5-faiz_abbas@ti.com>
Date: Mon, 12 Nov 2018 11:04:33 -0600
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, wg@grandegger.com, mkl@pengutronix.de, mark.rutland@arm.com, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Nov 03, 2018 at 12:56:14AM +0530, Faiz Abbas wrote:
> Some transceivers need a configuration step (for example, pulling
> a standby line low) for them to start sending messages. Instead of a
> parent child relationship, the transceiver can be implemented as a
> phy with the configuration done in the phy driver. The bitrate
> limitations can then be obtained by the driver using said phy
> node.
> 
> Document the above implementation.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  .../devicetree/bindings/net/can/m_can.txt     | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/m_can.txt b/Documentation/devicetree/bindings/net/can/m_can.txt
> index ed614383af9c..c11548e74278 100644
> --- a/Documentation/devicetree/bindings/net/can/m_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/m_can.txt
> @@ -42,12 +42,14 @@ Required properties:
>  
>  			  Please refer to 2.4.1 Message RAM Configuration in
>  			  Bosch M_CAN user manual for details.
> +Optional properties:
> +- phy-names		: must be "can_transceiver". The transceiver
> +			  typically limits the maximum bitrate of the
> +			  system. The phy node is used to discover this
> +			  limitation.

A name with a single phy is pointless.

> +- phys			: phandle to the transceiver implemented as a phy
> +			  node.
>  
> -Optional Subnode:
> -- can-transceiver	: Can-transceiver subnode describing maximum speed
> -			  that can be used for CAN/CAN-FD modes. See
> -			  Documentation/devicetree/bindings/net/can/can-transceiver.txt
> -			  for details.

You can't just remove this and break existing users.

>  Example:
>  SoC dtsi:
>  m_can1: can@20e8000 {
> @@ -64,12 +66,18 @@ m_can1: can@20e8000 {
>  };
>  
>  Board dts:
> +
>  &m_can1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_m_can1>;
>  	status = "enabled";
> +	phy-names = "can_transceiver";
> +	phys = <&transceiver1>;
> +};
>  
> -	can-transceiver {
> -		max-bitrate = <5000000>;
> -	};
> +transceiver1: can-transceiver {
> +	compatible = "simple-phy";
> +	max-bitrate = <5000000>;
> +	pwr-supply = <&transceiver1_fixed>;
> +	#phy-cells = <0>;
>  };
> -- 
> 2.18.0
> 
