From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Date: Mon, 13 May 2019 12:20:44 -0500
Message-ID: <20190513172044.GA593@bogus>
References: <20190502123220.3016-1-geert+renesas@glider.be>
 <20190502123220.3016-2-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502123220.3016-2-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Thu,  2 May 2019 14:32:16 +0200, Geert Uytterhoeven wrote:
> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Use interrupt-map (+ #address-cells and interrupt-map-mask) instead
>     of renesas,gic-spi-base,
> 
> v2:
>   - Add "renesas,gic-spi-base",
>   - Document RZ/A2M.
> ---
>  .../renesas,rza1-irqc.txt                     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
