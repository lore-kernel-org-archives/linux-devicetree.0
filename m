From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 17 Aug 2015 19:53:23 +0200
Message-ID: <201508171953.23955.marex@denx.de>
References: <1433316644-3748-1-git-send-email-vndao@altera.com> <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com> <20150817160338.GN60523@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150817160338.GN60523-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:

Hi!

[...]

> > Hi Brian,
> > It is really unfortunate that this controller is not able to read full
> > JEDEC ID. It only can provide 1 byte ID. I did discuss with IP
> > designer about this, but it is really unfortunate that they are not
> > able to fix that issue. Hence it requires software to make changes.

Thanks for CCing me, I assume this is a driver for that "altera_epcq_controller"
which you can synthesise into your FPGA, is that correct? Is there an Hard IP 
variant of this controller in the public or is this purely Soft IP?

Also, I cannot find any documentation for this IP block even if I search through 
Quartus/QSys, is there any proper documentation available anywhere?

[...]

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
