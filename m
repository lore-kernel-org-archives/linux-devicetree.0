From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Devicetree Maintenance in barebox
Date: Sun, 09 Feb 2014 11:58:06 -0600
Message-ID: <E1WCYdq-0004eu-Gr@jdl.com>
References: <20140207071332.GE16215@pengutronix.de> <20140207141028.GT8533@titan.lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140207141028.GT8533-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hi Sascha,
> 
> + Grant Likely, Ian Campbell, devicetree ML
> 
> Also, In the DT meeting earlier this week, Grant Likely said he has the
> request in to create a separate mailinglist for collaboration between
> the different devicetree users (BSD, Linux, etc).

...

> I think the proper solution will percolate out of the first
> cross-project discussions on the new ML.

...

> Definitely fodder for the new ML.
> 
> Grant, can you please add Sascha to the list of folks to notify when
> the new ML is ready?

I don't think there needs to be a different mailing list
in order to combine or discuss other OS's use of the device
tree compiler.  The  DTC is OS and Use-agnostic.  Discussions
of DTC needs for FreeBSD can happen right here as the orginal
purpose of this list was DTC discussion.

Are you, and Grant(?), suggesting that a separate list
should be created for FreeBSD use of DTS-file contents?
Or that DTS-file-content related discussions should be
separated from DTC discussions?


> imho, the goal is to not have any project tied to a specific version
> of the devicetree.
>
> iow, we don't break backwards compatibility in the
> devicetrees, and projects should revert to default behavior if new dt
> parameters are missing.  This means Linux and BSD shouldn't need to keep
> a current copy of the devicetree in their trees.  However, building the
> bootloader is a different animal.  It needs to provide the dt blob...

The devicetree source file format hasn't changed in years.
Yes, it is enhanced, but compatibly.  Or do you mean the
contents of the DTB for some specific platform?

Thanks,
jdl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
