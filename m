From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: "magic" handling of memory nodes
Date: Thu, 24 Apr 2014 10:57:03 -0600
Message-ID: <5359425F.9090200@wwwdotorg.org>
References: <20140424113311.GR5904@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140424113311.GR5904-t77nlHhSwNqAroYi2ySoxKxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/24/2014 05:33 AM, Leif Lindholm wrote:
> Hi,
> 
> Following on the special handling of nodes called memory@0, I went to
> have a look at the various platforms that do not actually declare a
> device_type = "memory" for their "memory" nodes.
> 
> Firstly, we currently have 162(ish, I did a sloppy grep) such .dts{i}
> files in the kernel tree.
> 
> Secondly, the only reason these platforms could ever have worked is
> because they include .dtsi files that define a memory node with a
> type explicitly set. Since this node already exists, its contents get
> overridden, but the type tag remains. Of course, this only happens
> with nodes called explicitly "memory" - but it happens regardless of
> what other things they contain.

That's precisely how DT includes/overrides are supposed to work, and is
entirely expected and normal.

Since skeleton.dtsi already says:

        memory { device_type = "memory"; reg = <0 0>; };

... then any .dts which includes that already has the device_type
property set, so there's no need to repeat that property. Subsequent
changes to /memory/reg have no impact on /memory/device_type; any new
node definitions simply over-write any previous definitions of a
redefined property, but leave unmentioned properties unchanged (unless
you /delete-property/).

If skeleton.dtsi were changed to remove that property then yes a lot of
files would then need to set it, but why would it be removed?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
