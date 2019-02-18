Return-Path: <robherring2@gmail.com>
Date: Mon, 18 Feb 2019 12:36:22 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] PCI: Add vendor ID for Microsemi
Message-ID: <20190218183622.GA16980@bogus>
References: <20190215162424.564-1-daire.mcnamara@microchip.com>
 <20190215162424.564-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190215162424.564-2-daire.mcnamara@microchip.com>
To: Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 15, 2019 at 04:24:22PM +0000, Daire McNamara wrote:
> This patch adds a new PCI vendor ID for Microsemi.

A 'PCI vendor ID' is something else.

This patch and file have nothing to do with PCI.

> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8fcc16..d13f6e40dbf4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -238,6 +238,7 @@ micrel	Micrel Inc.
>  microchip	Microchip Technology Inc.
>  microcrystal	Micro Crystal AG
>  micron	Micron Technology Inc.
> +microsemi	Microsemi Corporation
>  mikroe		MikroElektronika d.o.o.
>  minix	MINIX Technology Ltd.
>  miramems	MiraMEMS Sensing Technology Co., Ltd.
> -- 
> 2.17.0
> 
