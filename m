From: Evgeni Dobrev <evgeni-c3HRhe8yoGxdzLpqerNdyw@public.gmane.org>
Subject: [PATCH v4 0/1] add support for Seagate BlackArmor NAS220
Date: Sun, 28 Dec 2014 11:46:27 +0100
Message-ID: <20141228104627.GA11475@anne>
References: <20141215203855.GA28940@anne>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141215203855.GA28940@anne>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v4:	rename basename to blackarmor-nas220
	use "Seagate Blackarmor NAS220" as model name
	use node references instead of repeating the bus structure
	separate nodes with blank lines
	adt7476's node name reflects device function (i.e. thermal)
	reduce button labels to "Reset" and "Power"
	use GPIO_ACTIVE_LOW for regulator's gpio property

v3:	documented UART pinout in dts

v2:	indent with tabs only
	removed NAND layout

Evgeni Dobrev (1):
  add support for Seagate BlackArmor NAS220

 arch/arm/boot/dts/Makefile                       |    1 +
 arch/arm/boot/dts/kirkwood-blackarmor-nas220.dts |  172 ++++++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 arch/arm/boot/dts/kirkwood-blackarmor-nas220.dts

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
