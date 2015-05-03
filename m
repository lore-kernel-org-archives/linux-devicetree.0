From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 0/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Sun, 3 May 2015 22:50:43 +0200
Message-ID: <20150503205043.GA23342@lunn.ch>
References: <1430663256-22714-1-git-send-email-andrew@ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430663256-22714-1-git-send-email-andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew

> DNS-327L is a 2-bay NAS with the following specs:     
>      - 512MiB RAM
>      - 128MiB NAND Flash
>      - 1 GbE interface (Marvell PHY)

...

> /* Set RGMII voltage to 1.8v, according to public docs. Nice! */
> mw.l 0xd00184e0 0xa8a; 
> /* Some weird magic that goes into phy registers, no public docs */
> phyWrite 0 16 2; 
> phyWrite 0 19 77; 
> phyWrite 0 18 5747; 

Take a look at the marvell,reg-init property. Might do what you need.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
