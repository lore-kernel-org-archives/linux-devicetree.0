From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 15:36:29 +0100
Message-ID: <20170530143629.GT22219@n2100.armlinux.org.uk>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170530121907.GO22219@n2100.armlinux.org.uk>
 <20170530143350.6f8563c1@free-electrons.com>
 <20170530125643.GQ22219@n2100.armlinux.org.uk>
 <20170530132735.GA21646@lunn.ch>
 <20170530134226.GR22219@n2100.armlinux.org.uk>
 <20170530140320.GA22758@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170530140320.GA22758-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 30, 2017 at 04:03:20PM +0200, Andrew Lunn wrote:
> Linux has a long history of reworking stuff in tree, when it has been
> shown to be inadequate in its first version. So long as the device
> tree binding does not need incompatible changes, this reworking is not
> an issue. My guess is, a lot of people have SFP sockets, not
> SFP+. Lets get SFP merged, and then rework it in tree to add SFP+.

Unfortunately, it _does_ require an incompatible DT change, and an
incompatible change with the MAC drivers.

The DT change is needed because the current DT model (modelled from
DSA) connects the SFP cage to the MAC device using (eg):

	sfp {
		...
		sfp,ethernet = <&eth2>;
	};

This completely breaks when you have SFP connected to a PHY, as is
the case with SFP+.  So the current binding is unusable for this
case.

Instead, what I have (and what I will propose) is to get rid of that
property entirely, replacing it with a property in the upstream device
(being a MAC or PHY), eg:

&eth2 {
	sfp = <&sfp>;
};

        p1_phy: ethernet-phy@8 {
                sfp = <&sfp_eth1>;
        };

The code changes behind this would make maintaining support for the
previous binding rather difficult, as the way the SFP code finds the
netdevice changes completely - I now have a separate "sfp-bus", which
both phylink and SFP sockets register into, and which is responsible
for connecting the two together.

This change would not be possible had SFP support already been merged.
The old binding was just wrong.

I pushed out some updates to the SFP support last week, and now that
I have dw-hdmi out of the way, I'm about to merge these incompatible
changes into the SFP branch, and as the branch is currently at 24
patches, I'm probably going to squash a lot of the patches in there
together at the same time - which'll make me feel a bit sorry for
anyone who's making use of the existing code, because they won't be
able to see what the changes have been.  However, that's the only way
to stop the patch set going over 30...

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
