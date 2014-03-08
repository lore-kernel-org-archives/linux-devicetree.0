From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] dt: platform driver: Fill the resources before
	probe and defer if needed
Date: Sat, 8 Mar 2014 11:59:48 +0000
Message-ID: <20140308115948.GX21483@n2100.arm.linux.org.uk>
References: <20140220153042.DF053C4050F@trevor.secretlab.ca> <1392988720-20976-1-git-send-email-jjhiblot@traphandler.com> <20140308073758.DA63FC408EC@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140308073758.DA63FC408EC-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 08, 2014 at 07:37:58AM +0000, Grant Likely wrote:
> I believe we already talked about the above test. This function must
> only process devices created by of_platform_populate(). Merely checking
> the of_node pointer is not a sufficient test because there are other
> paths in the kernel for creating platform_devices that might get a node
> pointer attached to it.

There definitely are: there are a number of platform device drivers
which create a new platform device structure, and copy the of_node
pointer across.

However, that's really sick code, and can result in the platform device
driver probing the device it just created... this practise should be
outlawed.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
