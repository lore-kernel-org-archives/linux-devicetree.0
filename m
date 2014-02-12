From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Wed, 12 Feb 2014 12:21:50 +0100
Message-ID: <201402121221.51233.arnd@arndb.de>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com> <201402111508.06267.arnd@arndb.de> <20140212103329.GC21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212103329.GC21992-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 February 2014, Mark Rutland wrote:
> To me it feels odd to require the last clock in the list (apb_pclk) to
> be named, and the rest to be in a particular order. For the dt case it
> seems saner to add new clocks with names as it allows arbitrary subsets
> of clocks to be wired up and described (though obviously in this case a
> missing sspclk would be problematic).

Yes, good point about the missing clocks, and I also agree mixing ordered
and named clocks in one device is rather odd and can lead to trouble.

I guess there isn't really a good way out here, and I certainly won't
ask for it to be done one way or the other if someone else has a 
good argument which way it should be implemented.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
