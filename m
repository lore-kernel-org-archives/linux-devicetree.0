From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: iproc: Extend binding to cover BCM63138
Date: Mon, 26 Oct 2015 23:28:38 -0500
Message-ID: <CAL_JsqJp1GzDb2NFsrC24qR176zOqCCHAm=YkuA22zhKwVKWLg@mail.gmail.com>
References: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com> <1445917997-3629-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1445917997-3629-2-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jon Mason <jonmason@broadcom.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 10:53 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Broadcom BCM63138 DSL SoCs have the same ARMPLL clocking infrastructure
> as the Cygnus and iProc chips, add a dedicated compatible string and
> document that the ARMPLL node is a valid node for this chip.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> No changes in v2
>
>  Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> index ede65a55e21b..0b35e71b39e8 100644
> --- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> +++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> @@ -208,3 +208,8 @@ These clock IDs are defined in:
>      ch3_unused lcpll_ports     4       BCM_NS2_LCPLL_PORTS_CH3_UNUSED
>      ch4_unused lcpll_ports     5       BCM_NS2_LCPLL_PORTS_CH4_UNUSED
>      ch5_unused lcpll_ports     6       BCM_NS2_LCPLL_PORTS_CH5_UNUSED
> +
> +BCM63138
> +--------
> +PLL and leaf clock compatible strings for BCM63138 are:
> +    "brcm,bcm63138-armpll"
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
