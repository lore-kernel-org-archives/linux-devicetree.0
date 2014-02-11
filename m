From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: mvebu: make use of
 of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 11:53:14 -0500
Message-ID: <20140211165314.GA8533@titan.lakedaemon.net>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
 <1392135847-30791-5-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392135847-30791-5-git-send-email-joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 10:24:02AM -0600, Josh Cartwright wrote:
> Instead of the of_find_matching_node()/of_match_node() pair, which requires two
> iterations through the match table, make use of of_find_matching_node_and_match(),
> which only iterates through the table once.
> 
> While we're here, mark the of_system_controller table const.
> 
> Signed-off-by: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm/mach-mvebu/system-controller.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-mvebu/system-controller.c b/arch/arm/mach-mvebu/system-controller.c
> index a7fb89a..e6e300a 100644
> --- a/arch/arm/mach-mvebu/system-controller.c
> +++ b/arch/arm/mach-mvebu/system-controller.c
> @@ -54,7 +54,7 @@ static const struct mvebu_system_controller orion_system_controller = {
>  	.system_soft_reset = 0x1,
>  };
>  
> -static struct of_device_id of_system_controller_table[] = {
> +static const struct of_device_id of_system_controller_table[] = {
>  	{
>  		.compatible = "marvell,orion-system-controller",
>  		.data = (void *) &orion_system_controller,
> @@ -90,13 +90,12 @@ void mvebu_restart(enum reboot_mode mode, const char *cmd)
>  
>  static int __init mvebu_system_controller_init(void)
>  {
> +	const struct of_device_id *match;
>  	struct device_node *np;
>  
> -	np = of_find_matching_node(NULL, of_system_controller_table);
> +	np = of_find_matching_node_and_match(NULL, of_system_controller_table,
> +					     &match);
>  	if (np) {
> -		const struct of_device_id *match =
> -		    of_match_node(of_system_controller_table, np);


> -		BUG_ON(!match);

Gregory, is it ok to remove this?  It was added with the original code
submission for mach-mvebu.  mvebu_restart() will handle this
gracefully...

>  		system_controller_base = of_iomap(np, 0);
>  		mvebu_sc = (struct mvebu_system_controller *)match->data;
>  		of_node_put(np);

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
