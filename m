From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] of: add clock providers
Date: Mon, 9 Apr 2012 19:55:53 +0800
Message-ID: <20120409115549.GB18692@S2101-09.ap.freescale.net>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331680947-29861-3-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 06:22:22PM -0500, Rob Herring wrote:
...
> +==Clock consumers==
> +
> +Required properties:
> +clocks:		List of phandle and clock specifier pairs, one pair
> +		for each clock input to the device.  Note: if the
> +		clock provider specifies '0' for #clock-cells, then
> +		only the phandle portion of the pair will appear.

Per discussion[1], the parent of the clock could be reasonably
represented in C code instead of in device tree.  Then how can
this "clocks" property be "Required"?  Or to put it another way,
if this is "Required", the whole clock tree will have to be represented
in device tree, no?

> +
> +Optional properties:
> +clock-names:	List of clock input name strings sorted in the same
> +		order as the clocks property.  Consumers drivers
> +		will use clock-names to match clock input names
> +		with clocks specifiers.
> +clock-ranges:	Empty property indicating that child nodes can inherit named
> +		clocks from this node. Useful for bus nodes to provide a
> +		clock to their children.
> +
> +For example:
> +
> +    device {
> +        clocks = <&osc 1>, <&ref 0>;
> +        clock-names = "baud", "register";
> +    };

Regards,
Shawn

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/139414/focus=1216423
