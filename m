From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC v3 01/14] WIP: clk: add Atheros AR724X/AR913X/AR933X SoCs
 clock driver
Date: Mon, 1 Feb 2016 12:03:00 +0100
Message-ID: <20160201120300.3d6fd1b3@tock>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-2-git-send-email-antonynpavlov@gmail.com>
	<20160125232156.35c0ce3f@tock>
	<20160131234155.eee918745880878963c044aa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160131234155.eee918745880878963c044aa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 31 Jan 2016 23:41:55 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > > +	ath79_clks[ATH79_CLK_REF] = ath79_add_sys_clkdev("ref", ref_rate);
> > > +	ath79_clks[ATH79_CLK_CPU] = ath79_add_sys_clkdev("cpu", cpu_rate);
> > > +	ath79_clks[ATH79_CLK_DDR] = ath79_add_sys_clkdev("ddr", ddr_rate);
> > > +	ath79_clks[ATH79_CLK_AHB] = ath79_add_sys_clkdev("ahb", ahb_rate);
> > > +	ath79_clks[ATH79_CLK_WDT] = ath79_add_sys_clkdev("wdt", ahb_rate);
> > > +	ath79_clks[ATH79_CLK_UART] = ath79_add_sys_clkdev("uart", ahb_rate);  
> > 
> > You shouldn't add ref, wdt and uart, they are not needed and make the
> > driver incompatible with the current DT bindings.  
> 
> Please describe the situation then this incompatibility does matter.
> 
> Current ath79 dt support is very preliminary and the only dt user
> is 5-years old TP-Link WR1043ND so it's near impossible to break somethink.
> 
> Anyway current ath79 dt binding is somewhat broken (see __your__ message
> 'Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
> devicetree-friendly' from 'Thu, 21 Jan 2016 12:03:20 +0100').

The point is that DT is about describing the hardware in a consistent
and OS independent manner. It shouldn't be modeled just to suit some
existing code. So it is no big deal if the code doesn't use all the
informations provided by the DT, like here where the input clock is not
*yet* used by the code. However it is a no-go to extend the binding to
add things that don't exists in the hardware just to suit some old code.

I agree we might need to clear a few things regarding the UART clock in
the newer SoC, in particular if the UART use the output of the PLL
pre-divider or something similar. Then we would need to rework the DT
binding for the those SoC. However with the current knowledge I don't
see any need to change the biding yet.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
