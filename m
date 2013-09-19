From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 19 Sep 2013 13:38:05 -0400 (EDT)
Message-ID: <20130919.133805.1227344435777214810.davem@davemloft.net>
References: <20130918.173726.1443745664398441126.davem@davemloft.net>
	<523AC214.4040601@arm.com>
	<523AFB6C.5070300@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523AFB6C.5070300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Thu, 19 Sep 2013 08:26:04 -0500

> The simple solution here is to just remove the warning. It doesn't
> appear to me that sparc ever sets the cpu device of_node pointer.

Why wouldn't I want sparc to have this functionality now that the
code is generically available.

> Are there any cases on where sparc does have a /cpus node? If so we'd
> need to make of_get_cpu_node a weak function or depend on a kconfig option.

I already gave a solution to this problem, make the loop iterator be:

	for_each_node_by_type(dp, "cpu")
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
