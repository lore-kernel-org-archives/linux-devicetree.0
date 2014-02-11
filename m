From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: mvebu: make use of
 of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 18:10:48 +0100
Message-ID: <20140211181048.6934bdd3@skate>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
	<1392135847-30791-5-git-send-email-joshc@codeaurora.org>
	<20140211165314.GA8533@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211165314.GA8533-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Jason Cooper,

On Tue, 11 Feb 2014 11:53:14 -0500, Jason Cooper wrote:

> > -	np = of_find_matching_node(NULL, of_system_controller_table);
> > +	np = of_find_matching_node_and_match(NULL, of_system_controller_table,
> > +					     &match);
> >  	if (np) {
> > -		const struct of_device_id *match =
> > -		    of_match_node(of_system_controller_table, np);
> 
> 
> > -		BUG_ON(!match);
> 
> Gregory, is it ok to remove this?  It was added with the original code
> submission for mach-mvebu.  mvebu_restart() will handle this
> gracefully...

The BUG_ON here can normally never be reached. If
of_find_matching_node() returns a non-NULL result, then of_match_node()
should also return a non-NULL result.

Or I'm missing something :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
