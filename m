From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/2] of: move definition of of_find_next_cache_node into
 common code.
Date: Fri, 01 Nov 2013 19:16:21 +1100
Message-ID: <1383293781.28909.39.camel@pasglop>
References: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	 <1379501585-12532-3-git-send-email-Sudeep.KarkadaNagesha@arm.com>
	 <1383196834.28909.7.camel@pasglop> <527231DA.9060002@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527231DA.9060002-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-10-31 at 10:32 +0000, Sudeep KarkadaNagesha wrote:

> Thanks for the follow up. Grant wanted to see usage of this outside PPC and I
> pointed him[0] to the RFC[1] I had posted to support cacheinfo on ARM.
> 
> These patches are based on v3.12-rc1, let me know if you want me to
> rebase/repost on any particular version.

I've applied them to powerpc-next

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
