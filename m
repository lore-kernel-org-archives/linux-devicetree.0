From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] dt/clock: Add handling for fixed clocks and a clock
 node setup iterator
Date: Mon, 09 Apr 2012 09:18:27 -0500
Message-ID: <4F82EFB3.80402@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-5-git-send-email-robherring2@gmail.com>
 <20120314075930.GF21337@S2101-09.ap.freescale.net>
 <4F81A53B.7020804@gmail.com>
 <20120409084930.GA18692@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120409084930.GA18692-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/09/2012 03:49 AM, Shawn Guo wrote:
> On Sun, Apr 08, 2012 at 09:48:27AM -0500, Rob Herring wrote:
> ...
>> So I started implementing support for multiple outputs, but ran into a
>> complication. If you have multiple clocks on a node, then you have to
>> have a clk_src_get function to translate the clock cell value to a
>> struct clk.
> 
> So this is how clk_src_get looks like.
> 
> struct clk *clk_src_get(struct of_phandle_args *a, void *data)
> {
>         struct clk **clks = data;
>         return clks[a->args[0]];
> }
> 
>> This would also require allocating an array of struct clk's
>> to do the lookup.
> 
> And this how allocating looks like.
> 
>         clks = kzalloc(sizeof(*clks)  * num, GFP_KERNEL);
>         if (!clks)
>                 return -ENOMEM;
> 
> Seriously, not a big complication, right?

I didn't say it can't be done. I'm saying I don't see the benefit to
supporting it vs. the added code to iterate over the array, handle
errors in the middle, and added matching function.

You still haven't given any benefits of supporting multiple clocks. It's
slightly fewer dts lines, but not really anything else.

> 
>> This is all doable, but I don't see the benefit over
>> having a single node per fixed clock. We're not likely to have *lots* of
>> fixed clocks. I think we should leave fixed-clock defined as a single
>> output.
> 
> The problem is there is nothing specific to fixed-clock.  If you have
> some reason to not support blob node for fixed-clock, the reason will
> apply on clk_gate, clk_divider and clk_mux too.  Then, which clocks
> will support the #clock-cells in the binding document?
> 

But fixed-clock is a specific binding and each binding can define
#clock-cells however they want. New bindings can define whatever they want.

If you did a clk mux binding, you're not going to have multiple lists of
mux selections for multiple outputs, so we're going to effectively
limited there to 1 output as well.

I don't think people are going to define clocks generically in DT at the
mux, clk gate and divider level anyway. If you only have a few clocks
then you may, and 1 clock output per node is probably okay. If you have
hundreds of clocks then you probably won't, and will have a SOC specific
binding anyway.

Rob

> So to me, you need to either have it implemented or remove it from the
> binding document completely.
> 
> Regards,
> Shawn
> 
>> If you really see the benefit, you can add a new binding
>> "multiple-fixed-clocks" or something platform specific.
>>
