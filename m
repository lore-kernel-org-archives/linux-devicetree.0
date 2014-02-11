From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: mvebu: make use of
 of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 12:34:46 -0500
Message-ID: <20140211173446.GC27395@titan.lakedaemon.net>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
 <1392135847-30791-5-git-send-email-joshc@codeaurora.org>
 <20140211165314.GA8533@titan.lakedaemon.net>
 <20140211181048.6934bdd3@skate>
 <52FA5E75.7030402@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FA5E75.7030402-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 06:31:33PM +0100, Gregory CLEMENT wrote:
> On 11/02/2014 18:10, Thomas Petazzoni wrote:
> > Dear Jason Cooper,
> > 
> > On Tue, 11 Feb 2014 11:53:14 -0500, Jason Cooper wrote:
> > 
> >>> -	np = of_find_matching_node(NULL, of_system_controller_table);
> >>> +	np = of_find_matching_node_and_match(NULL, of_system_controller_table,
> >>> +					     &match);
> >>>  	if (np) {
> >>> -		const struct of_device_id *match =
> >>> -		    of_match_node(of_system_controller_table, np);
> >>
> >>
> >>> -		BUG_ON(!match);
> >>
> >> Gregory, is it ok to remove this?  It was added with the original code
> >> submission for mach-mvebu.  mvebu_restart() will handle this
> >> gracefully...
> > 
> > The BUG_ON here can normally never be reached. If
> > of_find_matching_node() returns a non-NULL result, then of_match_node()
> > should also return a non-NULL result.
> > 
> > Or I'm missing something :)
> 
> No you're almost right!
> 
> The only case we can get it, would be if we were declaring something like:
> 
> static struct of_device_id of_system_controller_table[] = {
> 	{
> 		.compatible = "foo,bar-controller",
> 	},
> [...]
> 
> instead of
> 
> static struct of_device_id of_system_controller_table[] = {
> 	{
> 		.compatible = "foo,bar",
> 		.data = (void *) &bar_controller,
> 	},
> [...]
> 
> This test is very paranoid, so I agree to remove it.
> 
> 
> Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Ok, great!  Josh, do you want us to take the two mvebu patches through
mvebu/arm-soc?  Or would you prefer to take them?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
