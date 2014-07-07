From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: DT license
Date: Mon, 7 Jul 2014 11:29:54 +0100
Message-ID: <20140707102954.GA2089@n2100.arm.linux.org.uk>
References: <20131026222020.GX16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131026222020.GX16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 26, 2013 at 11:20:20PM +0100, Russell King - ARM Linux wrote:
> Grant,
> 
> I'm seeing someone commenting on the GPLv2 license on the DT files.  This
> is probably something else which should've been discussed at the kernel
> summit.
> 
> I don't see much point to these being this restrictive: maybe GPLv2 and
> a.n.other license (3-clause BSD) would be a good idea.
> 
> Yes, technically it's a separate project from the kernel, but bear in
> mind that there's folks who would like to use the DT descriptions with
> something like OpenBSD.
> 
> It seems sensible to allow at least the stable stuff to become usable
> with other open OSes.

I didn't receive a reply to the above, and now this is becoming a
pressing matter because I'm about to start accepting patches from
others for the SolidRun DT files.

It is my intention to place the DT files for the SolidRun stuff under
the X11 license, and updates to them will only be accepted if submitted
under this license.

I also considered WTFPL, but I feel that WTFPL is too exposing for
warranty purposes.

The FSF indicate that the X11 license is compatible with GPLv2.

The reasoning there is to permit non-GPL projects (such as the BSDs) to
make use of the DT descriptions which are written for this hardware,
rather than forcing them to write their own - even though the main iMX
DT files may not be (yet) placed under such a permissive license.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
