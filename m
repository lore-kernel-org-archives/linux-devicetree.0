Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45858 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932282Ab3HGQav (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 12:30:51 -0400
Message-ID: <52027637.7000309@wwwdotorg.org>
Date: Wed, 07 Aug 2013 10:30:47 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: Fwd: [PATCH] SPI: Set SPI bits per words in an OF DeviceTree
 SPI node
References: <201308071544.r77Fij2Y006649@localhost.localdomain> <52026DBA.8000202@c-s.fr>
In-Reply-To: <52026DBA.8000202@c-s.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

CCing devicetree and SPI maintainers.

On 08/07/2013 09:54 AM, leroy christophe wrote:
> This patch allows to set up the bits per word together with all other SPI
> parameters in the SPI Node of the OF device tree

The new property needs to be documented somewhere in
Documentation/devicetree/bindings.

> In the node, you then have to include the 'spi-bits' property.
> 
> Exemple:
>     fpga-loader@7 {
>         compatible = "cs,fpga-loader";
>         spi-max-frequency = <10000000>;
>         reg = <7>;
>         spi-cs-high;
>         spi-bits = <16>;
>     };

Shouldn't the driver for cs,fpga-loader be defining how many bit the SPI
transactions should use? If the binding covers HW that can operate at
various bits-per-word, it's reasonable for those individual bindings to
define a property that sets that width, but I'm not convinced it's
reasonable for the SPI core to allow any DT node to specify that, and
presumably override the SPI device's driver's selection.

> --- linux-3.8.13/drivers/spi/spi.c    2013-05-11 22:57:46.000000000 +0200
> +++ linux/drivers/spi/spi.c    2013-08-06 18:19:30.000000000 +0200
> @@ -870,6 +870,11 @@
>           if (of_find_property(nc, "spi-3wire", NULL))
>               spi->mode |= SPI_3WIRE;
>   +        /* Bits per word */
> +        prop = of_get_property(nc, "spi-bits", &len);
> +        if (prop && len >= sizeof(*prop))
> +            spi->bits_per_word = prop[0];
> +

