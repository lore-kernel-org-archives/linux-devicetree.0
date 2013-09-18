From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: new cpu iteration code...
Date: Wed, 18 Sep 2013 17:37:26 -0400 (EDT)
Message-ID: <20130918.173726.1443745664398441126.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


I'm getting a flood of kernel log warnings on bootup now with
the generic of_get_cpu_node() code, it is wrong for sparc64
on several levels.

There is never a root "/cpus" node, so this code always fails.
Usually the "cpu" nodes are simply listed at the top-level.

The correct way to go about this is to use something like:

	struct device_node *dp;

	for_each_node_by_type(dp, "cpu") {
	}

and therefore be agnostic as to the layout of the device
tree wrt. cpu nodes.

Secondly, the property to use to get the physical cpu number is not
only different on sparc from what this code uses, but varies.  It can
be either "upa-portid" or "portid".  The "reg" property represents
various things and will be different for different cpu types and thus
is not a good candidate for fetching this information.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
