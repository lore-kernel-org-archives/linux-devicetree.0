From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: recommended action for bootloaders regarding modifying
 device-tree nodes
Date: Thu, 30 Jan 2014 14:15:12 -0700
Message-ID: <20140130211512.GD13372@obsidianresearch.com>
References: <CAJ+vNU366GiY4k_rnh1Jf0kra+PU99w4tDdM2sNioUAJCiZqOA@mail.gmail.com>
 <20140130204558.GC29184@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140130204558.GC29184-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 03:45:58PM -0500, Jason Cooper wrote:

> This is more of a process question:  Is there any information captured
> in your EEPROM that can't be represented in the dtb?  iow, at the point
> when you write the EEPROM, why not write the dtb to it as configured?

I can share what we do here.. In our systems the serial EEPROM is only
256 bytes, so storing things in DT format would be challenging.

What we do is have a master DTB that has the union of all our
configurations. The boot process has a very simple bit of code that
runs down the DTB in binary format and replaces entire
OF_DT_BEGIN_NODE->OF_DT_END_NODE regions with OF_DT_NOP.

The NOP approach is very simple, no other changes (eg offset
recalculation) needs to be done to the DT, so we can do this process
with a very small code footprint and without libfdt.

Choosing which sections to drop is done with some combination of
hardwired code and searching for specific property patterns. There are
also a few places where placeholder sections are directly fixed up, eg
a mac address is written into a placeholder of 0s, etc.

So an example might be

   optional_peripheral@10000 {
      orc,board-style = <1>;
      [..]
   }

Eg The board-style number comes from the EEPROM and if board-style !=
1 then the entire stanza is replaced with NOP.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
