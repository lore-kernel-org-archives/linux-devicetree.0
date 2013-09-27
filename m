From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 16:49:31 +0100
Message-ID: <20130927154931.GB12758@n2100.arm.linux.org.uk>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk> <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com> <20130926205906.GT12758@n2100.arm.linux.org.uk> <CAOMZO5Dj7o3qBH2hzPFWjepgpt5XR5qKmQorKS6jH_7=gnY5cg@mail.gmail.com> <20130927121357.GY12758@n2100.arm.linux.org.uk> <20130927132601.GL25146@S2101-09.ap.freescale.net> <20130927151900.GA12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130927151900.GA12758-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 04:19:00PM +0100, Russell King - ARM Linux wrote:
> brd: module loaded
> loop: module loaded
> imx6dl-pinctrl 20e0000.iomuxc: maps: function enet group enetgrp-4 num 19
> ar8035_phy_fixup()
> libphy: fec_enet_mii_bus: probed
> fec 2188000.ethernet eth0: registered PHC device 0
> 
> So where is the pinctrl settings applied - or more to the point, why
> aren't they being applied?  This would probably explain why ethernet
> doesn't work - I mean, if the pinctrl settings are never written to
> the registers...

I found that.  A typo in the DT file.  pintctrl-names.  Clearly beer
is required.

(And that's also a good argument why we need a schema language to
verify DT bindings against.)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
