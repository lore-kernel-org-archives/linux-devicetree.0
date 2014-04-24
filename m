From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: "magic" handling of memory nodes
Date: Thu, 24 Apr 2014 12:33:11 +0100
Message-ID: <20140424113311.GR5904@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Following on the special handling of nodes called memory@0, I went to
have a look at the various platforms that do not actually declare a
device_type = "memory" for their "memory" nodes.

Firstly, we currently have 162(ish, I did a sloppy grep) such .dts{i}
files in the kernel tree.

Secondly, the only reason these platforms could ever have worked is
because they include .dtsi files that define a memory node with a
type explicitly set. Since this node already exists, its contents get
overridden, but the type tag remains. Of course, this only happens
with nodes called explicitly "memory" - but it happens regardless of
what other things they contain.

In the ARM tree, most of these seem to stem from the inclusion of
skeleton.dtsi.

I don't really know what could/should be done about this, but it
does not feel optimal.

/
	Leif
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
