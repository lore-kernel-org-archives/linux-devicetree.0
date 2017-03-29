From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add stm32 qspi driver
Date: Wed, 29 Mar 2017 18:51:05 +0200
Message-ID: <5224f3cd-a128-9e72-c0c8-62a137ceeb79@wedev4u.fr>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490619296-8168-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ludovic,

Le 27/03/2017 à 14:54, Ludovic Barre a écrit :
> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> This patch set adds a SPI-NOR driver for stm32 QSPI controller.
> It is a specialized SPI interface for serial Flash devices.
> It supports 1 or 2 Flash device with single, dual and quad SPI Flash memories.
> 
> It can operate in any of the following modes:
> -indirect mode: all the operations are performed using the quadspi
>  registers
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory
> 
> Ludovic Barre (2):
>   dt-bindings: Document the STM32 QSPI bindings
>   mtd: spi-nor: add driver for STM32 quad spi flash controller
> 
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      |  45 ++
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/stm32-quadspi.c                | 679 +++++++++++++++++++++
>  4 files changed, 732 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>  create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> 

Just a small word to warn you that I'm likely to ask you to rebase this
series onto the patch "mtd: spi-nor: introduce more SPI protocols and
the Dual Transfer Mode". Indeed, I need to synchronize with Marek first
but I plan to merge this patch within few days.


Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
