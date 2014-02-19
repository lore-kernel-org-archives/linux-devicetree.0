From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/4] Bugfix for of_match_node ordering
Date: Wed, 19 Feb 2014 14:14:46 +0000
Message-ID: <1392819290-1044-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I've taken Kevin's latest rework and done even more rework on it. :-) I
didn't quite like how it was looking so I rolled his scoring code
directly into __of_device_is_compatible() so that the function always
returns a score in a way that is still compatible with the existing
users (ie. non-zero == successful match). This eliminates the need for a
separate pscore argument and it also let me roll the type and name
checks into the same function. I'm a lot happier with it overall and it
makes for a slightly smaller number of lines of code changed. Please
take a look and give it a spin. This is basically a bug fix so I'll need
to push it out to Linus in the near future.

Acks and Tested-bys would be particularly appreciated.

Thanks,
g.

Kevin Hao (2):
	Revert "of: search the best compatible match first in __of_match_node()"
	of: reimplement the matching method for __of_match_node()

Grant Likely (2):
	of: Move testcase FDT data into drivers/of
	of: Add self test for of_match_node()


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
