From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 0/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Wed, 6 May 2015 16:05:34 +0200
Message-ID: <20150506140534.GC10890@lunn.ch>
References: <1430663256-22714-1-git-send-email-andrew@ncrmnt.org>
 <20150503205043.GA23342@lunn.ch>
 <ad0fbb28b4b74de4c6685a5ddd21010c@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ad0fbb28b4b74de4c6685a5ddd21010c-IcawJbj+vY1vZ+LtbKW8tg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >Take a look at the marvell,reg-init property. Might do what you need.
> >
> >     Andrew
> 
> Thanks for the tip. So far I'm solving it via u-boot.
> You have to set RGMII voltage there anyway if you want tftp for the
> updates,
> so it looks like the right place to do this kind of stuff.

It is heard to guarantee that the bootloader does this stuff. It is
better if the kernel is more standalone.
> 
> I'll add the proper magic to the dts file and resend tomorrow.

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
