From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 4/7] ECHI Platform: Merge ppc-of EHCI driver into the
 ehci-platform driver
Date: Fri, 21 Feb 2014 10:41:50 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1402211037300.1273-100000@iolanthe.rowland.org>
References: <1392964293-13687-5-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392964293-13687-5-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Feb 2014, Alistair Popple wrote:

> Currently the ppc-of driver uses the compatibility string
> "usb-ehci". This means platforms that use device-tree and implement an
> EHCI compatible interface have to either use the ppc-of driver or add
> a compatible line to the ehci-platform driver. It would be more
> appropriate for the platform driver to be compatible with "usb-ehci"
> as non-powerpc platforms are also beginning to utilise device-tree.
> 
> This patch merges the device tree property parsing from ehci-ppc-of
> into the platform driver and adds a "usb-ehci" compatibility
> string. The existing ehci-ppc-of driver is removed and the 440EPX
> specific quirks are added to the ehci-platform driver.
> 
> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>

This patch is also out of date.  The compatibility string used by the 
ehci-platform driver is "generic-ehci".

There remains the question of whether to merge ehci-ppc-of into
ehci-platform.  This would be a rather invasive change, but I suppose
we could do it.  With adjustments along the lines suggested by Mark
Rutland.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
