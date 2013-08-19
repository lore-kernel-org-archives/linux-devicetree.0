Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33863 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab3HSVLW (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 17:11:22 -0400
Message-ID: <521289F7.8090503@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:11:19 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/4] mtd: nand: gpio: Add support for multichip devices
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru> <1376637583-12485-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1376637583-12485-2-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/16/2013 01:19 AM, Alexander Shiyan wrote:
> This patch adds support for multichip NAND devices controlled through GPIOs.
> To implement this, the properties of tree have been renamed. All current
> boards and DTS files converted to use an updated driver. Also driver
> temporarily keep support for DTS files which use the previous names scheme.

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

> -- gpios : specifies the gpio pins to control the NAND device.  nwp is an
> -  optional gpio and may be set to 0 if not present.
> +- ale-gpios : specifies the ALE gpio pin.
> +- cle-gpios : specifies the CLE gpio pin.
> +- nwp-gpios : specifies the NWP gpio pin (Optional).
> +- nce-gpios : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> +- rdy-gpios : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.

Why not put the nwp-gpios into the "Optional properties" section of the
document?

Documenting the deprecated properties is good; thanks!
