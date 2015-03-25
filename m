From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH_V2 0/2] mtd: nand: jz4780: Add nand and bch driver
Date: Wed, 25 Mar 2015 15:55:30 +0000
Message-ID: <5512DA72.8020204@imgtec.com>
References: <1425902299-53967-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425902299-53967-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Just wondering if this has gotten lost in the archives?

Regards,
ZubairLK

On 09/03/15 11:58, Zubair Lutfullah Kakakhel wrote:
> Hi,
> 
> Two patches based on 4.0-rc3 that add NAND and BCH controller
> drivers for the Ingenic JZ4780 SoC.
> 
> Core JZ4780 support is still in-flight.
> 
> Review and feedback welcome.
> 
> V1 - > V2
> Fixed module license macros
> Rebase to 4.0-rc3
> 
> 
> Thanks,
> ZubairLK
> 
> Alex Smith (2):
>   dt-bindings: binding for jz4780-{nand,bch}
>   mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
> 
>  .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
>  drivers/mtd/nand/Kconfig                           |   7 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/jz4780_bch.c                      | 358 ++++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h                      |  42 +++
>  drivers/mtd/nand/jz4780_nand.c                     | 372 +++++++++++++++++++++
>  6 files changed, 837 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
