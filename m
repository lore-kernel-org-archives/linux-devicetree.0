From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add Marvell PMU documentation
Date: Mon, 7 Dec 2015 10:04:38 +0000
Message-ID: <20151207100438.GL8644@n2100.arm.linux.org.uk>
References: <E1a5j6L-000873-3P@rmk-PC.arm.linux.org.uk>
 <181206520.JBMXuTWYTV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <181206520.JBMXuTWYTV@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 10:09:48AM +0100, Arnd Bergmann wrote:
> On Sunday 06 December 2015 23:52:21 Russell King wrote:
> > Add the required DT binding documentation for the Marvell PMU driver.
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > ---
> > Who takes these patches?  This never got merged when the PMU driver
> > itself was merged.
> 
> I'd say it should go along with the dts changes for mvebu, and we'll
> merge it through arm-soc.

Well, it didn't, the dts changes are already in as well.  Someone now
needs to pick it up independently.

I wonder how many more of the undocumented bindings are actually caused
by people not realising that the binding docs patches have been ignored.
(Yes, I've found cases in the past where bindings are undocumented, and
no, I don't keep a list and I don't remember which they were.)

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
