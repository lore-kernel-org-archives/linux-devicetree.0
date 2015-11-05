From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: kirkwood: add Linksys EA3500
Date: Thu, 5 Nov 2015 01:27:07 +0100
Message-ID: <20151105002707.GB8942@lunn.ch>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a832c-f77d66d7-8f66-4b36-ac2c-df85deee46b6-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00000150d49a832c-f77d66d7-8f66-4b36-ac2c-df85deee46b6-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 04, 2015 at 10:25:07PM +0000, Luka Perkov wrote:
> Based on dts files from OpenWrt.

Hi Luka

Thanks for spending the time to submit these upstream.

It looks like a lot of the same comments apply to these files, so i
won't keep repeat them.

One thing i did notice is that turning off the internal RTC is common,
but there is no i2c RTC. Is this correct? Do these devices not have an
RTC?
	Thanks
		Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
