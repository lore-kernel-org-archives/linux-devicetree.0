From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: unittest: Add option string test case with
 longer path
Date: Tue, 17 Mar 2015 21:12:28 +0000
Message-ID: <20150317211228.GR4278@bivouac.eciton.net>
References: <1425924225-22748-2-git-send-email-leif.lindholm@linaro.org>
 <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
 <1426620632-23383-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426620632-23383-2-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 12:30:32PM -0700, Brian Norris wrote:
> There were regressions seen with commit 106937e8ccdc ("of: fix handling
> of '/' in options for of_find_node_by_path()"), where we couldn't handle
> extra '/' before the ':'. Let's test for this now.
> 
> Confirmed that this test fails without the previous patch and passes
> when patched. All other tests pass.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/unittest.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index aba8946cac46..52c45c7df07f 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -97,6 +97,11 @@ static void __init of_selftest_find_node_by_name(void)
>  		 "option path test, subcase #1 failed\n");
>  	of_node_put(np);
>  
> +	np = of_find_node_opts_by_path("/testcase-data/testcase-device1:test/option", &options);
> +	selftest(np && !strcmp("test/option", options),
> +		 "option path test, subcase #2 failed\n");
> +	of_node_put(np);
> +
>  	np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
>  	selftest(np, "NULL option path test failed\n");
>  	of_node_put(np);
> -- 
> 1.9.1

Acked-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
