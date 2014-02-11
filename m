From: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when
 CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 08:41:08 -0600
Message-ID: <20140211144108.GB841@joshc.qualcomm.com>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392122211-11422-1-git-send-email-laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey Laurent-

On Tue, Feb 11, 2014 at 01:36:51PM +0100, Laurent Pinchart wrote:
> when CONFIG_OF is disabled of_match_node is defined as a macro that
> evaluates to NULL. This breaks compilation of drivers that dereference
> the function's return value directly. Fix it by turning the macro into a
> static inline function that returns NULL.

Just this past week I did the same thing, but noticed that it breaks the
following usecase:

	#ifdef CONFIG_OF
	static const struct of_device_id foobar_matches[] = {
		{ .compatible = "foobar,whatsit", },
		{ },
	};
	#endif
	
	static int probeme(struct platform_device *pdev)
	{
		struct of_device_id *id;
	
		id = of_match_node(foobar_matches, pdev->dev.of_node);
		if (id) {
			/* ... */
		}
		return 0;
	}

When !CONFIG_OF and with your change, this will fail to build due to
foobar_matches being undefined.

   Josh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
