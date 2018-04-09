Return-Path: <robherring2@gmail.com>
Date: Mon, 9 Apr 2018 12:54:24 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/3] dt-binding: can: mcp25xxfd: document device tree
 bindings
Message-ID: <20180409175424.f6vetp5e45rmiy54@rob-hp-laptop>
References: <20180326160624.32230-1-kernel@martin.sperl.org>
 <20180326160624.32230-2-kernel@martin.sperl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180326160624.32230-2-kernel@martin.sperl.org>
To: kernel@martin.sperl.org
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 26, 2018 at 04:06:22PM +0000, kernel@martin.sperl.org wrote:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> Add device-tree bindings for Microcip CanFD Controller mcp2517fd
> 
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> 
> --
> Changelog:
>   V1 -> V2: new more generic name based on feedback from microchip
>             cleanup of dt custom properties removing (most) gpio functions
>   V2 -> V3: added vendor-prefix for gpio-opendrain
>             s/_/-/
>             added gpio-controller
> ---
>  .../bindings/net/can/microchip,mcp25xxfd.txt       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt

Reviewed-by: Rob Herring <robh@kernel.org>
