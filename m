From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Mon, 10 Feb 2014 11:41:58 +0000
Message-ID: <1392032518.5117.52.camel@kazak.uk.xensource.com>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
	 <1391634309-3123-5-git-send-email-andrew@lunn.ch>
	 <20140206153939.GD8533@titan.lakedaemon.net>
	 <20140206160126.GH29860@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140206160126.GH29860-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-02-06 at 17:01 +0100, Andrew Lunn wrote:
> Synology seem to build there devices like lego. They have two
> different RTC blocks. They have three different fan alarm blocks, four
> different led blocks, etc. And to build a product, the just select a
> group of blocks and put them together.
> 
> The board setup code which Ben Peddell wrote has a somewhat similar
> structure:
> 
> http://klightspeed.killerwolves.net/synology/linux-3.4-synology-0.1.patch
> 
> It has a set of functions which add platform devices. And a table
> driven piece of code which based on the product name calls these
> functions to add the needed platform devices. Take a look at the table
> to get a better idea of the re-use factor of the blocks.
> 
> In this DT version, i have a dtsi file for each function, and a dti
> file for each table entry.

At least some other platforms deal with this by having a baseline dtsi
where most things have status="disabled" and then a per-board .dts file
which contains status="okay" and perhaps any specific pin bindings etc.

See arch/arm/boot/dts/sun?i* for an example of this approach.

Ian.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
