From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Mon, 12 Dec 2011 23:29:03 +0000
Message-ID: <20111212232903.GC2616@gallagher>
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

I'm still going through these and trying to digest them but a couple of 
quick questions/comments.

Jamie

On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> new file mode 100644
> index 0000000..e40c436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -0,0 +1,114 @@
> +This binding is a work-in-progress, and are based on some experimental
> +work by benh[1].
> +
> +Sources of clock signal can be represented by any node in the device
> +tree.  Those nodes are designated as clock providers.  Clock consumer
> +nodes use a phandle and clock specifier pair to connect clock provider
> +outputs to clock inputs.  Similar to the gpio specifiers, a clock
> +specifier is an array of one more more cells identifying the clock
> +output on a device.  The length of a clock specifier is defined by the
> +value of a #clock-cells property in the clock provider node.
> +
> +[1] http://patchwork.ozlabs.org/patch/31551/
> +
> +==Clock providers==
> +
> +Required properties:
> +#clock-cells:	   Number of cells in a clock specifier; typically will be
> +		   set to 1

I'm not sure I fully understand what the extra cells actually mean for 
clocks.  I think the first integer is the clock output to use but some 
of the versatile and highbank ones only have a phandle or is it more 
implementation defined?  The clock-output-names description hints at 
recommended, so I find this a little confusing, but that could just be 
me!

> +Optional properties:
> +clock-output-names: Recommended to be a list of strings of clock output signal
> +		    names indexed by the first cell in the clock specifier.
> +		    However, the meaning of clock-output-name is domain
> +		    specific to the clock provider, and is only provided to
> +		    encourage using the same meaning for the majority of clock
> +		    providers.  This format may not work for clock providers
> +		    using a complex clock specifier format.  In those cases it
> +		    is recommended to omit this property and create a binding
> +		    specific names property.
> +
> +		   Clock consumer nodes must never directly reference
> +		   the provider's clock-output-name property.
> +
> +For example:
> +
> +    oscillator {
> +        #clock-cells = <1>;
> +        clock-output-names = "ckil", "ckih";
> +    };
> +
> +- this node defines a device with two clock outputs, the first named
> +  "ckil" and the second named "ckih".  Consumer nodes always reference
> +  clocks by index. The names should reflect the clock output signal
> +  names for the device.
> +
> +==Clock consumers==
> +
> +Required properties:
> +clocks:		List of phandle and clock specifier pairs, one pair
> +		for each clock input to the device.

Some of the highbank and versatile devicetree nodes have clocks 
properties that aren't a pair e.g. versatile timer has
"clocks = <&tim_clk>;".  

> +clock-names:	List of clock input name strings sorted in the same
> +		order as the clocks property.  Consumers drivers
> +		will use clock-names to match clock input names
> +		with clocks specifiers.

The versatile and highbank patches appears to omit this required 
property in several nodes.  So is this really optional?

Jamie
