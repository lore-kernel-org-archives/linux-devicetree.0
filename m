From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] ARM: kirkwood: ReadyNAS Duo v2 .dts cleanup
Date: Fri, 22 Nov 2013 10:38:00 -0500
Message-ID: <20131122153800.GJ29241@titan.lakedaemon.net>
References: <87li0ge9te.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87li0ge9te.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnaud,

On Fri, Nov 22, 2013 at 04:27:09PM +0100, Arnaud Ebalard wrote:
> The patch does some cleanup work on NETGEAR ReadyNAS Duo v2 .dts
> file. Changes are listed below:

Can you do the whitespace cleanup as a separate patch, and do all your
boards in one go?

>  - Converted GPIO voltage level from value to macros
>  - Converted all numeric input key values to macros
>  - Made button node names more explicit
>  - Added compatible string for PHY (marvell,mv88e1318s)
>  - Added header for the file to describe content and author
>  - Made G762 clock node name unique by including g762 in it
>  - Fixed all node names and labels to use respectively '-' and '_'
>  - Removed useless clocks and gpio-keys properties

First patch

>  - Fixed bad spacing
>  - Added some space between some nodes to improve readability

Second patch, or last in series.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
