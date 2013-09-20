From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Fri, 20 Sep 2013 13:16:11 -0400 (EDT)
Message-ID: <20130920.131611.540827848496996215.davem@davemloft.net>
References: <523AFB6C.5070300@gmail.com>
	<20130919.133805.1227344435777214810.davem@davemloft.net>
	<523C7B54.3070706@arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523C7B54.3070706-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Date: Fri, 20 Sep 2013 17:44:04 +0100

> Makes sense, but as you mentioned before we need to match other property
> names namely "upa-portid", "portid" or "cpuid" for cpu physical id right
> ? Are all these 32-bit values ?

Yes they are.  You'll simply have to make the property name string
to use be something an architecture can define.

>> I already gave a solution to this problem, make the loop iterator be:
>> 
>> 	for_each_node_by_type(dp, "cpu")
>> 
> 
> Does it make sense use this only when /cpus is not found ?

No, it should be used universally since it is an implementation that
should work in all possible layouts.

I do not buy your argument about cost at all.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
