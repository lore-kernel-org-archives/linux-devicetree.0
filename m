From: Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Wed, 20 May 2015 00:10:57 +0300
Message-ID: <1432069858-10958-1-git-send-email-andrew@ncrmnt.org>
References: <20150506140534.GC10890@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506140534.GC10890-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rebased against 4.1-rc1
Sorry for the long delay with the respin, I've been caught in the usual 
daily routine yet again.
Hopefully everything's finally okay now.

Changelog since last respin: 
* Properly initialize phy registers in dts

Andrew Andrianov (1):
  ARM: mvebu: dts: Add dts file for DLink DNS-327L

 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/armada-370-dlink-dns327l.dts | 356 +++++++++++++++++++++++++
 2 files changed, 357 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-370-dlink-dns327l.dts

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
