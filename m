From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH RFC RFT 0/2] ARM: Kirkwood: Synology DT files
Date: Fri, 10 Jan 2014 11:28:46 +0000
Message-ID: <20140110112846.GG27432@n2100.arm.linux.org.uk>
References: <1389052027-16819-1-git-send-email-andrew@lunn.ch> <52CE312B.3060108@killerwolves.net> <20140109165557.GB9681@lunn.ch> <52CF4652.3030207@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CF4652.3030207-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 11:01:06AM +1000, Ben Peddell wrote:
> It appears the initrd address in the devicetree structure (which is 
> filled in from what is passed by the bootloader when 
> CONFIG_ARM_ATAG_DTB_COMPAT is set) is processed _after_ the address in 
> the initrd= kernel parameter is processed.

That's wrong.  Kernel parameters should always override what's passed by
boot loaders etc.

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
