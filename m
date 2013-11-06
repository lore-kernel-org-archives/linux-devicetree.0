From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
Date: Wed, 6 Nov 2013 10:39:27 +0800
Message-ID: <5279ABDF.7070709@freescale.com>
References: <1382929517-22606-1-git-send-email-b32955@freescale.com> <20131105200729.GT20061@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131105200729.GT20061-bU/DPfM3abD4WzifrMjOTkcViWtcw2C0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8806=E6=97=A5 04:07, Brian Norris =E5=86=
=99=E9=81=93:
> This description still uses Linux-isms/MTD-isms (ecc_strength_ds,
> ecc_step_ds, nand_chip{}, JFFS2). I would personally write this as
> something like the following:
>
>    - fsl,use-minimum-ecc: Protect this NAND flash with the minimum EC=
C
> 			 strength required. The required ECC strength is
> 			 automatically discoverable for some flash
> 			 (e.g., according to the ONFI standard).
> 			 However, note that if this strength is not
> 			 discoverable, the software may choose an
> 			 implementation-defined ECC scheme.
this description is better then mine.

thanks
Huang Shijie

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
