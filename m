From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Fri, 17 Nov 2017 18:36:40 +0100
Message-ID: <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

sorry but I won't apply this patch.

New values for the 'compatible' DT properties should only be added for
memory parts not supporting the JEDEC READ ID (0x9F) command.

SST25 memories do support this command hence should use the "jedec,spi-nor"
value alone. For historical reasons, some DT nodes set their 'compatible'
string to something like "<vendor>,<model>", "jedec,spi-nor".
It should work as expected in most case however I discourage from doing so
in new device trees because it may have some side effects especially when
the m25p80.c driver is used between the spi-nor.c driver and the SPI
controller driver.

It's all about setting the 2nd parameter of spi_nor_scan(), the 'name'
parameter, as NULL when possible. This parameter should be set to a non NULL
value only for memories not supporting the JEDEC READ ID op code (0x9F).

Best regards,

Cyrille

Le 24/10/2017 à 15:50, Fabrizio Castro a écrit :
> There are a few DT files that make use of sst25vf016b in their
> compatible strings, and the driver supports this chip already.
> This patch improves the documentation and therefore the result
> of ./scripts/checkpatch.pl.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Thank you Rob, thank you Geert, and sorry for the delay on this one.
> Here is v2.
> 
> Changes in v2:
> * fixed subject prefix
> * added changelog
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 4cab5d8..bf56d77 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -31,6 +31,7 @@ Required properties:
>                   s25sl12801
>                   s25fl008k
>                   s25fl064k
> +                 sst25vf016b
>                   sst25vf040b
>                   sst25wf040b
>                   m25p40
> 
