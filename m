From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4 v2] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Fri, 4 Mar 2016 22:30:01 -0600
Message-ID: <20160305043001.GB13525@rob-hp-laptop>
References: <1457015956-30708-1-git-send-email-abrodkin@synopsys.com>
 <1457015956-30708-3-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457015956-30708-3-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2016 at 05:39:14PM +0300, Alexey Brodkin wrote:
> This add DT bindings documentation for ARC PGU display controller.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> ---
> 
> Changes v1 -> v2:
>  * Clean-up

Not really useful. What we like to see is what changed. Maintainers have 
short memories and don't remember what they said previously (unless 
comments are ignored).

> 
>  .../devicetree/bindings/display/snps,arcpgu.txt    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> new file mode 100644
> index 0000000..57f3bc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> @@ -0,0 +1,33 @@
> +ARC PGU
> +
> +This is a display controller found on several development boards produced
> +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
> +framebuffer and sends it to a single digital encoder (usually HDMI).
> +
> +Required properties:
> +  - compatible: "snps,arcpgu"
> +  - reg: Physical base address and length of the controller's registers.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ARC PGU it should contain:
> +      - "pxlclk" for the clock feeding the output PLL of the controller.
> +
> +Required sub-nodes:
> +  - port: The PGU connection to an encoder chip. The connection is modelled
> +    using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt.
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	pgu@XXXXXXXX {
> +		compatible = "snps,arcpgu";
> +		reg = <0xXXXXXXXX 0x400>;
> +		clocks = <&clock_node>;
> +		clock-names = "pxlclk";

Where's the port? Didn't you previously say it was optional?

> +	};
> +
> +	...
> +};
> -- 
> 2.5.0
> 
