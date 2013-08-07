Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:35723 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756738Ab3HGQ1Z convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 12:27:25 -0400
Subject: Re: [PATCH] SPI: Set SPI bits per words in an OF DeviceTree SPI node
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=windows-1252
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <52026DBA.8000202@c-s.fr>
Date: Wed, 7 Aug 2013 11:27:34 -0500
Content-Transfer-Encoding: 8BIT
Message-Id: <DEA71064-25FF-4B40-A9C0-144248E4901F@codeaurora.org>
References: <201308071544.r77Fij2Y006649@localhost.localdomain> <52026DBA.8000202@c-s.fr>
Sender: devicetree-owner@vger.kernel.org
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On Aug 7, 2013, at 10:54 AM, leroy christophe wrote:

> Sujet: 	[PATCH] SPI: Set SPI bits per words in an OF DeviceTree SPI node
> Date : 	Wed, 7 Aug 2013 17:44:45 +0200
> De : 	Christophe Leroy <christophe.leroy@c-s.fr>
> Pour : 	Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
> Copie � : 	spi-devel-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, stigge@antcom.de
> 
> 
> 
> This patch allows to set up the bits per word together with all other SPI
> parameters in the SPI Node of the OF device tree
> 
> In the node, you then have to include the 'spi-bits' property.
> 
> Exemple:
> 	fpga-loader@7 {
> 		compatible = "cs,fpga-loader";
> 		spi-max-frequency = <10000000>;
> 		reg = <7>;
> 		spi-cs-high;
> 		spi-bits = <16>;
> 	};
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Is there an associated device tree binding spec update?  If not there should be.

- k

> 
> --- linux-3.8.13/drivers/spi/spi.c	2013-05-11 22:57:46.000000000 +0200
> +++ linux/drivers/spi/spi.c	2013-08-06 18:19:30.000000000 +0200
> @@ -870,6 +870,11 @@
>  		if (of_find_property(nc, "spi-3wire", NULL))
>  			spi->mode |= SPI_3WIRE;
>  +		/* Bits per word */
> +		prop = of_get_property(nc, "spi-bits", &len);
> +		if (prop && len >= sizeof(*prop))
> +			spi->bits_per_word = prop[0];
> +
>  		/* Device speed */
>  		prop = of_get_property(nc, "spi-max-frequency", &len);
>  		if (!prop || len < sizeof(*prop)) {
> 
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

