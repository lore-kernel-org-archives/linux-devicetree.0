From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/3] dt-bindings: add Marvell core PLL and clock divider
 PMU documentation
Date: Fri, 27 Nov 2015 20:53:51 +0100
Message-ID: <20151127195351.GC14645@lunn.ch>
References: <E1a24wj-0004iw-Rf@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1a24wj-0004iw-Rf@rmk-PC.arm.linux.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 10:23:21PM +0000, Russell King wrote:
> Add documentation for the Marvell clock divider driver, which is used
> to source clocks for the AXI bus, video decoder, GPU and LCD blocks.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  .../bindings/clock/dove-divider-clock.txt          | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> new file mode 100644
> index 000000000000..0c602de279e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
> @@ -0,0 +1,28 @@
> +PLl divider based Dove clocks

Nit pick. It would be nice if the second L of PLL was also a capital.

Acked-by: Andrew Lunn <andrew@lunn.ch>

	  Andrew
