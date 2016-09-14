From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V8] clk: bcm: Add driver for BCM53573 ILP clock
Date: Wed, 14 Sep 2016 18:44:40 -0500
Message-ID: <CAL_Jsq+KF0gVx7=HvyBhXP2p+5+-Q-pKOmNFM4MXpR6bJ_BDFA@mail.gmail.com>
References: <20160905142935.4550-1-zajec5@gmail.com> <20160913070722.5867-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160913070722.5867-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 2:06 AM, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
> This clock is present on BCM53573 devices (including BCM47189) that use
> Cortex-A7. ILP is a part of PMU (Power Management Unit) multi-function
> device so we use syscon (and regmap) for it.
>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> V3: Drop #include <linux/moduleh>
>     Make ILP DT entry part of PMU
>     Describe ILP as subdevice of PMU in Documentation
> V4: Use BCM53573 name as suggested by Jon and Ray. It seems "Northstar"
>     (even if used in some resources) should be used in relation to
>     Cortex-A9 devices only.
> V5: Rename remaining "ns" references to "bcm53573", sorry, I sent V4 too
>     early.
> V6: Drop #include <linux/clk.h>
>     Use "int" as type where it matches usage
>     Add cpu_relax() in the loop
>     Add disable callback
>     Use _hw_ functions for registering struct clk_hw (new API)
>
>     Thanks a lot Stephen!
> V7: Use syscon and regmap (thanks Rob!)
> V8: Update Documentation (drop unused "reg", unit address)
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt           |  36 +++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-bcm53573-ilp.c                 | 148 +++++++++++++++++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-bcm53573-ilp.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
