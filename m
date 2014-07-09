From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/9] mtd: nand: add ONFI timing mode to
 nand_timings converter
Date: Wed, 9 Jul 2014 10:25:55 -0700
Message-ID: <20140709172555.GI7537@ld-irv-0074>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-3-git-send-email-b.brezillon.dev@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCZ6PSPVXMNBBK7W6WOQKGQESJ5QYKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394647664-8258-3-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

Since I think you were planning on revisiting this soon, I have one more
comment:

On Wed, Mar 12, 2014 at 07:07:37PM +0100, Boris BREZILLON wrote:
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index c970ce7..0b8a822 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -2,7 +2,7 @@
>  # linux/drivers/nand/Makefile
>  #
>  
> -obj-$(CONFIG_MTD_NAND)			+= nand.o
> +obj-$(CONFIG_MTD_NAND)			+= nand.o nand_timings.o

This is not the right place, as it will generate a new module
'nand_timings' (nand_timings.ko, if CONFIG_MTD_NAND=m). You probably
want to just add nand_timings.o to the 'nand-objs' list at the bottom of
the Makefile, like this:

	nand-objs := nand_base.o nand_bbt.o nand_timings.o

>  obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
>  obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
>  obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o nand_hynix.o

Thanks,
Brian
