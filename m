From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: Fix unavailable MTD userland devices on Excito
 B3 boards
Date: Sat, 7 Feb 2015 17:09:45 +0100
Message-ID: <20150207160945.GA22306@lunn.ch>
References: <1423212311-10793-1-git-send-email-gordon@bosvangennip.nl>
 <54D484D8.8090801@free-electrons.com>
 <54D6299B.70707@bosvangennip.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D6299B.70707-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordon Bos <gordon-PMRpws9CsXpfxmBXdGbrbQ@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 07, 2015 at 04:04:59PM +0100, Gordon Bos wrote:
> Hi,
> 
> I've had some further discussion on this with another B3 owner.
> According to an old patch that Excito corporation built for kernel
> version 2.6 the flash memory is in fact a ||Numonyx MP25P16
> The driver however must be m25p80.

Hi Gordon

I need to reboot my B3 in order to see what it says. However, with the
current DT i do have access to the MTD devices.

What problems are you actually having?

Thanks

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
