From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 19 Sep 2013 06:52:32 -0400 (EDT)
Message-ID: <20130919.065232.443575501385238374.davem@davemloft.net>
References: <20130918.173726.1443745664398441126.davem@davemloft.net>
	<523AC214.4040601@arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523AC214.4040601-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Date: Thu, 19 Sep 2013 10:21:24 +0100

> I could not find any binding document or dts file with "upa-portid" or
> "portid" to think about possible solution.
> 
> I am yet to understand definition of backward compatibility and
> adherence to ePAPR from device tree perspective. Do we consider this as
> broken DT as it doesn't adhere to ePAPR or do we need to have backward
> compatibility here ?

I don't think there is any value in your search for these properties
in various documents.

This is simply how it is on sparc64 whether you like it or not.

And therefore the code must accomodate this difference if it is
to live in a generic place.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
