From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 04/11] ARM i.MX6q: Add audio/video PLL post dividers
 for i.MX6q rev 1.1
Date: Thu, 28 Mar 2013 22:43:00 +0800
Message-ID: <20130328144258.GB699@S2101-09.ap.freescale.net>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
 <1364405445-5271-5-git-send-email-p.zabel@pengutronix.de>
 <20130328072056.GL5429@S2101-09.ap.freescale.net>
 <1364464680.4018.29.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364464680.4018.29.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2013 at 10:58:00AM +0100, Philipp Zabel wrote:
> In the loops in _get_table_maxdiv(), _get_table_div(), and
> _get_table_val(), in drivers/clk/clk-divider.c the exit condition
> is .div == 0, so there needs to be a sentinel with .div = 0 at the end
> of each clk_div_table. It's also documented in the kerneldoc comment for
> clk_register_divider_table.

Ah, I do not know that.  So clk_enet_ref_table is actually buggy?

> I can write that as "{ }", like this:
> 
> static struct clk_div_table test_div_table[] = {
>         { .val = 2, .div = 1 },
>         { .val = 1, .div = 2 },
>         { .val = 0, .div = 4 },
>         { }
> };
> 
Yes, that's much better for reading.  But to be consistent with
clk_enet_ref_table, please also put a comma after .div.

> static struct clk_div_table control3_table[] = {
>         { .val = 0, .div = 1 },
>         { .val = 1, .div = 2 },
>         { .val = 3, .div = 4 },
>         { }
> };
> 
Per Reference Manual, we should have one more entry below?

	{ .val = 2, .div = 1, }

...

> Because I didn't realize that the names were fixed in the final
> documentation. I'll rename pll[45]_test_div to pll[45]_post_div.
> pll5_control3 should be renamed to pll5_video_div, I guess.

Yea, that's much easier for users to map code and document.

Shawn
