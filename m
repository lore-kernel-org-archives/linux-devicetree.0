From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 1/4] dt-bindings: w1: document sub-node bindings for
 DS2760
Date: Tue, 26 Jun 2018 15:33:19 -0600
Message-ID: <20180626213319.GA22766@rob-hp-laptop>
References: <20180619212744.794-1-daniel@zonque.org>
 <20180619212744.794-2-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180619212744.794-2-daniel@zonque.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>
Cc: zbr@ioremap.net, mark.rutland@arm.com, szabolcs.gyurko@tlt.hu, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 11:27:41PM +0200, Daniel Mack wrote:
> This patch add a generic w1 bindings document that merely describes how
> slave deviceses are grouped under master nodes. It also adds a specific
> binding for the ds2760 battery monitor.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/w1/w1-ds2760.txt        |  9 +++++++++
>  .../devicetree/bindings/w1/w1-gpio.txt          |  6 ++++++
>  Documentation/devicetree/bindings/w1/w1.txt     | 17 +++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/w1/w1-ds2760.txt
>  create mode 100644 Documentation/devicetree/bindings/w1/w1.txt
> 
> diff --git a/Documentation/devicetree/bindings/w1/w1-ds2760.txt b/Documentation/devicetree/bindings/w1/w1-ds2760.txt
> new file mode 100644
> index 000000000000..86a0f4c573eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/w1/w1-ds2760.txt
> @@ -0,0 +1,9 @@
> +Devicetree bindings for Maxim DS2760
> +====================================
> +
> +The ds2760 is a w1 slave device and must hence have its sub-node in DT
> +under a w1 bus master node.
> +
> +Required properties:
> +- compatible: must be "maxim,ds2760-w1"
> +
> diff --git a/Documentation/devicetree/bindings/w1/w1-gpio.txt b/Documentation/devicetree/bindings/w1/w1-gpio.txt
> index 6e09c35d9f1a..a3e0e964b260 100644
> --- a/Documentation/devicetree/bindings/w1/w1-gpio.txt
> +++ b/Documentation/devicetree/bindings/w1/w1-gpio.txt
> @@ -13,10 +13,16 @@ Optional properties:
>   - linux,open-drain: if specified, the data pin is considered in
>  		     open-drain mode.
>  
> +Also refer to the generic w1.txt document.
> +
>  Examples:
>  
>  	onewire@0 {
>  		compatible = "w1-gpio";
>  		gpios = <&gpio 126 0>, <&gpio 105 0>;
> +
> +		slave@0 {

A unit-address should have a corresponding reg property. Also, the node 
name should reflect the class of device.

You don't really need the unit address here, but for multiple slaves you 
would. I'm not sure what you'd use here since the only id/address is 
the serial number which is unknown except for the family code. If you 
have 2 identical devices with some different DT properties, how would 
you match? I don't see a way other than putting the serial number (or 
some portion of it) in DT.

I'm not sure how common multiple slaves are. Perhaps just support a 
single slave for now.

Rob
