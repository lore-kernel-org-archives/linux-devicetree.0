From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 17 Aug 2015 18:24:44 -0700
Message-ID: <20150818012444.GA17499@localhost>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
 <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com>
 <20150817160338.GN60523@google.com>
 <201508171953.23955.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201508171953.23955.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I'm not very helpful here, so hopefully Viet can be of more use:

On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
> On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
> Also, I cannot find any documentation for this IP block even if I search through 
> Quartus/QSys, is there any proper documentation available anywhere?

I never found proper documentation, but I didn't look too hard. I've
mostly been going off of Viet's comments and code.

But FWIW, I did find some relevant info for the peculiar Altera EPCQ
flash here:

https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
