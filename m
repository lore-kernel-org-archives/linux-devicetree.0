From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC PATCH] mfd: arizona: Update device tree regulator bindings
Date: Sat, 28 Sep 2013 16:53:08 +0100
Message-ID: <20130928155308.GV3635@opensource.wolfsonmicro.com>
References: <1380131272-16982-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <20130925183201.GT3226@sirena.org.uk> <20130926152941.GQ3635@opensource.wolfsonmicro.com> <20130926175843.GS19304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926175843.GS19304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 06:58:43PM +0100, Mark Brown wrote:
> I don't see why this would only be an issue for ASoC - it happens to
> have more helpers for this right now than anything else but I'd hope
> that at some point in the future we can get some of the common patterns
> for holding regulators into the device framework.  You also have the
> potential for this to do the wrong thing if it doesn't happen to be
> talking to an MFD which is doing this since it just unconditionally
> looks at the parent.
> 
> I would suggest that rather than unconditionally doing this on lookup
> it'd be easier to do it the other way round and explicitly add mappings
> from the parent to the child when registering the device.  That doesn't
> have the potential to explode and get the wrong thing like this does.

Been a bit delayed on this as I have been investigating the
situation a little further. Is it just moving the supplies of the
parent node we object to? Or do we want to keep everything tidied
onto the one device tree node? The reason I ask is because
looking at this further we run into other problems, the MFD
framework is clearly intended to have a sub-node for each device.

For example, the GPIO driver has a similar issue if anything else
wishes to use an Arizona devices GPIO, because the GPIO driver
is on a different device to the MFD so again it can't locate it.
I haven't checked yet but I am guessing there will be similar
issues with the interrupts.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
