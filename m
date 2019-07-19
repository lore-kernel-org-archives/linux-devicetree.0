Return-Path: <SRS0=EqyA=VQ=gmail.com=fancer.lancer@kernel.org>
Date: Fri, 19 Jul 2019 13:13:38 +0300
From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 1/3] Revert "usb: usb251xb: Add US lanes inversion
 dts-bindings"
Message-ID: <20190719101337.36omwmqc4lbtw6do@mobilestation>
References: <20190719084407.28041-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719084407.28041-1-l.stach@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hello Lucas

On Fri, Jul 19, 2019 at 10:44:05AM +0200, Lucas Stach wrote:
> This reverts commit 3342ce35a1, as there is no need for this separate
> property and it breaks compatibility with existing devicetree files
> (arch/arm64/boot/dts/freescale/imx8mq.dtsi).
> 

Hmm, didn't know there had been anything staged to merge and touching this
property before submitting the update. We must have done it nearly at the same
time, or your patch hasn't been merged at the time I prepared mine.

Anyway why would you prefer to change the interface again instead of
following the existing way? Firstly It is much easier to fix the dts-file
than to revert the interface back and break dts-files of possible other users.
Secondly the chip documentation doesn't have anything regarding port 0.
It states to swap the Ports from 1 to 4 (usb2514) corresponding to the bits
1 - 4 of the 'PORT SWAP' register, while bit 0 is connected with explicitly
named Upstream Port (without any numbering). Thirdly having a separate
property for US port makes the driver bindings interface a bit better
readable/logical, since in current implementation there is no implicit/unspoken/hidden
rule that port 0 corresponds to the Upstream Port, Port 0 just doesn't exists
(following the chip datasheet text), and the other port-related properties are
only applicable for downstream ports. So the driver code rejects them being
utilized for a port with 0 identifier. The only port-related setting being
exposed by the interface is the swap-port-one and it has a separately bound
property 'swap-us-lanes' for the Upstream port.

As for me, all of this makes more sense than having an implicit Port 0 - Upstream
port binding (as you suggest). Although the final decision of which solution is
better is after the subsystem maintainer after all.

Regards,
-Sergey

> CC: stable@vger.kernel.org #5.2
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index bc7945e9dbfe..17915f64b8ee 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -64,10 +64,8 @@ Optional properties :
>   - power-on-time-ms : Specifies the time it takes from the time the host
>  	initiates the power-on sequence to a port until the port has adequate
>  	power. The value is given in ms in a 0 - 510 range (default is 100ms).
> - - swap-dx-lanes : Specifies the downstream ports which will swap the
> -	differential-pair (D+/D-), default is not-swapped.
> - - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
> -	swapping (boolean, default is not-swapped)
> + - swap-dx-lanes : Specifies the ports which will swap the differential-pair
> +	(D+/D-), default is not-swapped.
>  
>  Examples:
>  	usb2512b@2c {
> -- 
> 2.20.1
> 
