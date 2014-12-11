From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Wed, 10 Dec 2014 22:37:27 -0800
Message-ID: <1418279847.18092.32.camel@perches.com>
References: <1418208371-18851-1-git-send-email-lyz@rock-chips.com>
	 <1418208371-18851-2-git-send-email-lyz@rock-chips.com>
	 <5489338C.1030109@ti.com> <1418278322.18092.30.camel@perches.com>
	 <54893963.7060304@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54893963.7060304-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-12-11 at 11:57 +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Thursday 11 December 2014 11:42 AM, Joe Perches wrote:
> > On Thu, 2014-12-11 at 11:32 +0530, Kishon Vijay Abraham I wrote:
> >> On Wednesday 10 December 2014 04:16 PM, Yunzhi Li wrote:
> >>> diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
> > []
> >>> +/*
> >>> + * The higher 16-bit of this register is used for write protection
> >>> + * only if BIT(13 + 16) set to 1 the BIT(13) can be written.
> >>> + */
> >>> +#define SIDDQ_MSK		BIT(13 + 16)
> > 
> > huh?
> > 
> > This #define looks _very_ odd.
> > 
> > Is this supposed to be a single bit 29 or
> > some range?
> 
> From what I understood, the most significant 16 bits are write locks to the
> least significant 16 bits.
> 
> So If I have to write something on bit 0, I have to set bit 16.
> If I have to write something on bit 1, I have to set bit 17.
> If I have to write something on bit 2, I have to set bit 18.
> and so on.

To me it'd look better to use another << rather than a plus


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
