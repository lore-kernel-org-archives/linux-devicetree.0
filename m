From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC 4/7] ARM: dts: add support for Vybrid running on Cortex-M4
Date: Tue, 14 Oct 2014 12:01:54 +0200
Message-ID: <4791111.YE0gxP7ZrV@wuerfel>
References: <cover.1413136383.git.stefan@agner.ch> <5748107.mfAXLUBGQg@wuerfel> <7c474d8f876cbf9adaec55af1dffd6c2@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7c474d8f876cbf9adaec55af1dffd6c2-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 13 October 2014 23:20:38 Stefan Agner wrote:
> Ah ok I see. This parent/child relation is not yet part of the Vybrid
> device tree:
> 
> 
> slowosc: sxosc {
>         compatible = "fixed-clock";
>         #clock-cells = <0>;
>         clock-frequency = <32768>;
> };
> fastosc: fxosc {
>         compatible = "fixed-clock";
>         #clock-cells = <0>;
>         clock-frequency = <24000000>;
> };
> 
> ....
> 
> clks: ccm@4006b000 {
>         compatible = "fsl,vf610-ccm";
>         reg = <0x4006b000 0x1000>;
>         #clock-cells = <1>;
> };
> 
> So we would need something like:
> 
> clocks = <&slowosc>, <&fastosc>;
> clock-names = "sxosc", "fxosc";
> 
> But how can we identify clock tree entries? There is no marker like
> "clock-controller;" currently, is there?

Actually it seems the of_clk_init does have all the code it needs:

        for_each_matching_node_and_match(np, matches, &match) {
                struct clock_provider *parent =
                        kzalloc(sizeof(struct clock_provider),  GFP_KERNEL);

                parent->clk_init_cb = match->data;
                parent->np = np;
                list_add_tail(&parent->node, &clk_provider_list);
        }

        while (!list_empty(&clk_provider_list)) {
                is_init_done = false;
                list_for_each_entry_safe(clk_provider, next,
                                        &clk_provider_list, node) {
                        if (force || parent_ready(clk_provider->np)) {

                                clk_provider->clk_init_cb(clk_provider->np);
                                of_clk_set_defaults(clk_provider->np, true);

                                list_del(&clk_provider->node);
                                kfree(clk_provider);
                                is_init_done = true;
                        }
                }

                /*
                 * We didn't manage to initialize any of the
                 * remaining providers during the last loop, so now we
                 * initialize all the remaining ones unconditionally
                 * in case the clock parent was not mandatory
                 */
                if (!is_init_done)
                        force = true;
        }

You are just missing the clock properties to describe the hierarchy
in your dts.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
