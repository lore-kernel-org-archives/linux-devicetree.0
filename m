From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device
 tree
Date: Mon, 28 Oct 2013 22:26:03 -0500
Message-ID: <1383017163.3410.61.camel@snotra.buserror.net>
References: <1381300704-4238-1-git-send-email-Yuantian.Tang@freescale.com>
	 <20131010100331.GE26954@e106331-lin.cambridge.arm.com>
	 <D07C73A334FF604B95B3CBD2A545D07B150BD137@039-SN2MPN1-013.039d.mgd.msft.net>
	 <20131011092526.GE3910@e106331-lin.cambridge.arm.com>
	 <1381518433.7979.536.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C24BD@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381788786.7979.643.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C2B08@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381858855.7979.693.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C312F@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381942009.7979.727.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C4600@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1382027085.7979.774.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C5CAB@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1382113880.7979.836.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C62BA@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B150C62BA-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <B29983-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Yang-Leo-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2013-10-20 at 21:55 -0500, Tang Yuantian-B29983 wrote:
> I didn't see how your suggestion is a better matching.
> 
>  OSC ----> PLL1 ----> mux ----> CPU
>       |           |
>       |--> PLL2 --| 
>         ........
> As your suggestion, the clock tree looks like the above.
> In this case, the MUX driver will not know the divider
> details(/2, /4, or /3).

When is there ever a /3?

> I think the MUX should act like "switch" which choose one
> of the input clock as a output clock. It should not CREATE
> clock(like PLL1/2, PLL1/4).
> The purpose of clock driver is to establish the clock tree.
> The clock tree will not be established in your suggestion
> because the divider is missing, we don't know where PLL/2 comes from.
> 
> If you really like your proposal, it should be changed to this:
> 
> OSC ------> PLL1 -----> PLL1 /1 ---------> MUX ------->CPU
>      |            |___> PLL1 /2 _______|
>      |                                 |
>      |____> PLL2 -----> PLL2 /2 -------|
>                   |___> PLL2/ 4 _______|
> 
> (it is possible that PLLs have different divider).

Do we actually have (or expect) a situation where the PLLs have
different dividers, or even where the same bit setting in the MUX
register means a different divider from one chip to another (within the
same MUX compatible string)?  If so, then I agree that we should go with
your approach.

The way Freescale documents things in chip manuals rather than in block
manuals, with little bits of information different in each chip manual,
makes it hard to figure out this sort of thing.  From the examples I
looked at, it seemed pretty consistent that the low 2 bits of CLKSEL in
the MUX were the log2 of the divider.  Are there any chips that don't
adhere to this?

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
