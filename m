From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 18/18] omap3isp: Deprecate platform data support
Date: Fri, 13 Mar 2015 09:43:56 -0700
Message-ID: <20150313164355.GW5140@atomide.com>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
 <1425764475-27691-19-git-send-email-sakari.ailus@iki.fi>
 <20150313094050.GB4980@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150313094050.GB4980@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [150313 02:41]:
> Hi,
> 
> [+CC Tony]
> 
> On Sat, Mar 07, 2015 at 11:41:15PM +0200, Sakari Ailus wrote:
> > Print a warning when the driver is used with platform data. Existing
> > platform data user should move to DT now.
> 
> I guess this should become a more visible warning on OMAP SoC level,
> since platform data based boot will be deprecated completly.

Yeah. We should need platform data in addition to device tree data in
only very few cases. Basically only when there's some arch specific
callback function that needs to be passed to the driver.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
