From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: display: atmel: optional
 video-interface of endpoints
Date: Fri, 27 Apr 2018 09:27:31 -0500
Message-ID: <20180427142731.gaceycl3ardv6h4b@rob-hp-laptop>
References: <20180423072301.11962-1-peda@axentia.se>
 <20180423072301.11962-3-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180423072301.11962-3-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Russell King <linux@armlinux.org.uk>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 09:22:55AM +0200, Peter Rosin wrote:
> With bus-type/bus-width properties in the endpoint nodes, the video-
> interface of the connection can be specified for cases where the
> heuristic fails to select the correct output mode. This can happen
> e.g. if not all RGB pins are routed on the PCB; the driver has no
> way of knowing this, and needs to be told explicitly.
> 
> This is critical for the devices that have the "conflicting output
> formats" issue (SAM9N12, SAM9X5, SAMA5D3), since the most significant
> RGB bits move around depending on the selected output mode. For
> devices that do not have the "conflicting output formats" issue
> (SAMA5D2, SAMA5D4), this is completely irrelevant.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../devicetree/bindings/display/atmel/hlcdc-dc.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
