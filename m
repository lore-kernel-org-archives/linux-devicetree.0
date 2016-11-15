From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add clockevent for timer-nps driver to NPS400 SoC
Date: Tue, 15 Nov 2016 10:57:54 +0100
Message-ID: <20161115095754.GA1835@mai>
References: <1479199859-980-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479199859-980-1-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 15, 2016 at 10:50:56AM +0200, Noam Camus wrote:
> From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Change log
> ---
> V6 --> V7
> Apply several comments made by Daniel Lezcano:
> 1) Remove CLOCK_EVT_FEAT_PERIODIC support. This way it is
>  pure oneshot driver. This simplifies driver so that:
>  nps_clkevent_add_thread()
>  nps_clkevent_rm_thread()
>  are more clearer without any vague logic if to change
>  TSI bit of current HW thread or not.
> 2) tick_resume is also calls nps_clkevent_rm_thread()
> 3) Few (hopefully last) typo fixes. 
> 
> V5 --> V6
> Apply several comments made by Daniel Lezcano:
> 1) nps_get_timer_clk() - use clk_put() on error scenario
> 2) nps_get_timer_clk() - return EINVAL and not plain 1
> 3) Fix typos in log (double checked with spell checker)
> 
> V4 --> V5
> Apply several comments made by Daniel Lezcano:
> 1) Add __init attribute to nps_get_timer_clk()
> 2) Fix return value of nps_get_timer_clk()
>  when failing to get clk rate
> 3) Change clocksource rate from 301 -> 300
> 
> V3 --> V4
> Main changes are [Thanks for the review]:
> Fix many typos at log [Daniel]
> Add handling for bad return values [Daniel and Thomas]
> Replace use of internal irqchip pointers with existing IRQ API [Thomas]
> Provide interrupt handler (percpu) with dev_id equal to evt [Thomas]
> Fix passing *clk by reference to nps_get_timer_clk() [Daniel]
> 
> V2 --> V3
> Apply Rob Herring comment about backword compatibility
> 
> V1 --> V2
> Apply Daniel Lezcano comments:
> 	CLOCKSOURCE_OF_DECLARE return value
> 	update hotplug callbacks usage
> 	squash of 2 first commits.
> In this version I created new commit to serve as preperation for adding clockevents.
> This way the last patch is more readable with clockevent content.
> ---

Do you want me to take the entire series in my tree, or do you want my acked-by
to push them in your tree ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
