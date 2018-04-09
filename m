From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: misc: achc: Make ezport
 distinguishable
Date: Mon, 9 Apr 2018 13:57:27 -0500
Message-ID: <20180409185727.j4unhx5ig3fgm6ex@rob-hp-laptop>
References: <20180327135259.30890-1-sebastian.reichel@collabora.co.uk>
 <20180327135259.30890-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180327135259.30890-2-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 03:52:57PM +0200, Sebastian Reichel wrote:
> This updates the GE ACHC binding, so that different compatible
> strings are used for the programming interface, which is the
> ezport interface from NXP MK20FN1M0VMD12 and the microcontroller's
> normal SPI interface.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/misc/ge-achc.txt | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/ge-achc.txt b/Documentation/devicetree/bindings/misc/ge-achc.txt
> index 77df94d7a32f..6c6bd6568504 100644
> --- a/Documentation/devicetree/bindings/misc/ge-achc.txt
> +++ b/Documentation/devicetree/bindings/misc/ge-achc.txt
> @@ -7,7 +7,13 @@ Note: This device does not expose the peripherals as USB devices.
>  
>  Required properties:
>  
> -- compatible : Should be "ge,achc"
> +- compatible : Should be
> +  "ge,achc" (normal interface)
> +  "ge,achc-ezport" (flashing interface)
> +
> +Required properties (flashing interface only):
> +
> +- reset-gpios: GPIO Specifier for the reset GPIO

Does the reset only affect the flashing interface and are the data pins 
shared? If not for both, then I think the correct thing to do here is 
just extend reg to support multiple values to represent multiple chip 
selects.

Rob
