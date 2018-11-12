Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: can: can-transceiver: Remove legacy
 binding documentation
Message-ID: <20181112170535.GA2733@bogus>
References: <20181102192616.28291-1-faiz_abbas@ti.com>
 <20181102192616.28291-6-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102192616.28291-6-faiz_abbas@ti.com>
Date: Mon, 12 Nov 2018 11:05:37 -0600
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, wg@grandegger.com, mkl@pengutronix.de, mark.rutland@arm.com, kishon@ti.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Nov 03, 2018 at 12:56:15AM +0530, Faiz Abbas wrote:
> With the transceiver node being implemented as a phy, remove the legacy
> dcoumentation. Don't remove the code implementing it to maintain dt
> compatibility.

Keep the documentation and just mark it as deprecated.

> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  .../bindings/net/can/can-transceiver.txt      | 24 -------------------
>  1 file changed, 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/can/can-transceiver.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/can/can-transceiver.txt b/Documentation/devicetree/bindings/net/can/can-transceiver.txt
> deleted file mode 100644
> index 0011f53ff159..000000000000
> --- a/Documentation/devicetree/bindings/net/can/can-transceiver.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Generic CAN transceiver Device Tree binding
> -------------------------------
> -
> -CAN transceiver typically limits the max speed in standard CAN and CAN FD
> -modes. Typically these limitations are static and the transceivers themselves
> -provide no way to detect this limitation at runtime. For this situation,
> -the "can-transceiver" node can be used.
> -
> -Required Properties:
> - max-bitrate:	a positive non 0 value that determines the max
> -		speed that CAN/CAN-FD can run. Any other value
> -		will be ignored.
> -
> -Examples:
> -
> -Based on Texas Instrument's TCAN1042HGV CAN Transceiver
> -
> -m_can0 {
> -	....
> -	can-transceiver {
> -		max-bitrate = <5000000>;
> -	};
> -	...
> -};
> -- 
> 2.18.0
> 
