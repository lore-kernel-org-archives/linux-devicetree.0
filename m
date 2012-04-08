From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] dt/clock: Add handling for fixed clocks and a clock
 node setup iterator
Date: Sun, 08 Apr 2012 09:48:27 -0500
Message-ID: <4F81A53B.7020804@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-5-git-send-email-robherring2@gmail.com>
 <20120314075930.GF21337@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120314075930.GF21337-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Shawn,

On 03/14/2012 02:59 AM, Shawn Guo wrote:
> On Tue, Mar 13, 2012 at 06:22:24PM -0500, Rob Herring wrote:
> ...
>> +/**
>> + * of_fixed_clk_setup() - Setup function for simple fixed rate clock
>> + */
>> +void __init of_fixed_clk_setup(struct device_node *node)
>> +{
>> +	struct clk *clk;
>> +	const char *clk_name = node->name;
>> +	u32 rate;
>> +
>> +	if (of_property_read_u32(node, "clock-frequency", &rate))
>> +		return;
>> +
>> +	of_property_read_string(node, "clock-output-names", &clk_name);
>> +
>> +	clk = clk_register_fixed_rate(NULL, clk_name, NULL, CLK_IS_ROOT, rate);
>> +	if (clk)
>> +		of_clk_add_provider(node, of_fixed_clk_get, clk);
>> +}
> 
> It seems my comment[1] did not get addressed in this post.
> 
> Regards,
> Shawn
> 
> [1] http://article.gmane.org/gmane.linux.drivers.devicetree/10589

So I started implementing support for multiple outputs, but ran into a
complication. If you have multiple clocks on a node, then you have to
have a clk_src_get function to translate the clock cell value to a
struct clk. This would also require allocating an array of struct clk's
to do the lookup. This is all doable, but I don't see the benefit over
having a single node per fixed clock. We're not likely to have *lots* of
fixed clocks. I think we should leave fixed-clock defined as a single
output. If you really see the benefit, you can add a new binding
"multiple-fixed-clocks" or something platform specific.

Rob
