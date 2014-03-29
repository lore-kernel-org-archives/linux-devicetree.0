From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/5] Kirkwood DT Documentation
Date: Sat, 29 Mar 2014 01:22:24 +0100
Message-ID: <201403290122.24713.arnd@arndb.de>
References: <1395492360-1865-1-git-send-email-andrew@lunn.ch> <20140324002233.GZ15608@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140324002233.GZ15608-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 24 March 2014, Jason Cooper wrote:
> arm-soc maintainers,
> 
> On Sat, Mar 22, 2014 at 01:45:55PM +0100, Andrew Lunn wrote:
> > This patchset fixes up a number of issues found by checkpatch in the
> > kirkwood DT files or binding Documentation. Vendor Prefixes are
> > documented, missing prefixes are added, incorrect prefixes are
> > corrected, and Kirkwood SoCs are documented.
> > 
> > Note that some of these patches contain UTF-8 characters, which the
> > mailing lists sometime don't like. The patches can also be found in
> > 
> > https://github.com/lunn/linux.git v3.14-rc7-next-20140321-dt
> > 
> > which is based on linux-next tag next-20140321.
> 
> I'd like to take this in as 'fixes-non-critical' for v3.15.  However,
> I'm having trouble finding a stable, conflict-free branch to base it on.
> The main problem seems to be vendor-prefixes.txt.
> 
> How would you prefer I handle this?  Or, would you guys just like to
> take the series directly?  I'm fine either way.
> 
> If taking directly,
> 
> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

I think Rob should take the binding changes, we can take the dts file
changes. Can you send them as patches relative to the next/dt branch
to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
