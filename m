From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] dt/clock: Add handling for fixed clocks and a clock
 node setup iterator
Date: Mon, 9 Apr 2012 16:49:33 +0800
Message-ID: <20120409084930.GA18692@S2101-09.ap.freescale.net>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-5-git-send-email-robherring2@gmail.com>
 <20120314075930.GF21337@S2101-09.ap.freescale.net>
 <4F81A53B.7020804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F81A53B.7020804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 08, 2012 at 09:48:27AM -0500, Rob Herring wrote:
...
> So I started implementing support for multiple outputs, but ran into a
> complication. If you have multiple clocks on a node, then you have to
> have a clk_src_get function to translate the clock cell value to a
> struct clk.

So this is how clk_src_get looks like.

struct clk *clk_src_get(struct of_phandle_args *a, void *data)
{
        struct clk **clks = data;
        return clks[a->args[0]];
}

> This would also require allocating an array of struct clk's
> to do the lookup.

And this how allocating looks like.

        clks = kzalloc(sizeof(*clks)  * num, GFP_KERNEL);
        if (!clks)
                return -ENOMEM;

Seriously, not a big complication, right?

> This is all doable, but I don't see the benefit over
> having a single node per fixed clock. We're not likely to have *lots* of
> fixed clocks. I think we should leave fixed-clock defined as a single
> output.

The problem is there is nothing specific to fixed-clock.  If you have
some reason to not support blob node for fixed-clock, the reason will
apply on clk_gate, clk_divider and clk_mux too.  Then, which clocks
will support the #clock-cells in the binding document?

So to me, you need to either have it implemented or remove it from the
binding document completely.

Regards,
Shawn

> If you really see the benefit, you can add a new binding
> "multiple-fixed-clocks" or something platform specific.
> 
