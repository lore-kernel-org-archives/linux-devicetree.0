From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Tue, 10 Jan 2012 21:33:38 +0000
Message-ID: <20120110213338.GD3226@page>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323727329-4989-4-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
> Based on work by Ben Herrenschmidt and Jeremy Kerr, this patch adds an
> of_clk_get function to allow platforms to retrieve clock data from the
> device tree.
> 
> Platform register a provider through of_clk_add_provider, which will be
> called when a device references the provider's OF node for a clock
> reference.
[...]
> diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.txt b/Documentation/devicetree/bindings/clock/fixed-clock.txt
> new file mode 100644
> index 0000000..9a75342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fixed-clock.txt
> @@ -0,0 +1,21 @@
> +Binding for simple fixed-rate clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/fixed-clock.txt

This appears to reference itself?

> +
> +Required properties:
> +- compatible : shall be "fixed-clock".
> +- #clock-cells : from common clock binding; shall be set to 0.
> +- clock-frequency : frequency of clock in Hz. May be multiple cells.
> +
> +Optional properties:
> +- gpios : From common gpio binding; gpio connection to clock enable pin.

This seems a little odd to me to have in the common binding, but I'm not 
that familiar with too many platforms.

> +- clock-output-names : From common clock binding
> +
> +Example:
> +	clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <1000000000>;
> +	};

I wonder if this should have an optional clock consumer with a standard 
name for parenting?  For example, on picoxcell there is a fixed 200MHz 
APB clock that is really a PLL from a 20MHz reference input and I'd like 
to represent that in the clock tree.

I'm about to start trying to get this and Mike's common struct clk 
patches working on picoxcell, and the one thing I'm not understanding at 
the moment is how to handle the tree itself.  Currently I was planning 
on iterating over all clocks and finding a named input clock "ref" or 
"input" perhaps.  This would be fine for picoxcell, but I guess more 
complicated chips may need something else.

Jamie
