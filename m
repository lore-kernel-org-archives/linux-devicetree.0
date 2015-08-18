From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Tue, 18 Aug 2015 03:32:41 +0200
Message-ID: <201508180332.41805.marex@denx.de>
References: <1433316644-3748-1-git-send-email-vndao@altera.com> <201508171953.23955.marex@denx.de> <20150818012444.GA17499@localhost>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150818012444.GA17499@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
> I'm not very helpful here, so hopefully Viet can be of more use:

Yup :)

> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
> > Also, I cannot find any documentation for this IP block even if I search
> > through Quartus/QSys, is there any proper documentation available
> > anywhere?
> 
> I never found proper documentation, but I didn't look too hard. I've
> mostly been going off of Viet's comments and code.

Me neither, and I looked through the altera stuff in fact. I'm trying
to learn whether this is just an Soft IP, in which case it certainly
can be fixed ; or if there is actually some chip shipping with this
crap synthesised into actual silicon.

> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
> flash here:
> 
> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/
> hb/cfg/cfg_cf52012.pdf

Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just have 
different JEDEC ID and are a bit more expensive.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
