Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:57894 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258Ab3HSVKA (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 17:10:00 -0400
Message-ID: <521289A3.5040705@wwwdotorg.org>
Date: Mon, 19 Aug 2013 15:09:55 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] mtd: nand: gpio: Add DT property to automatically
 determine bus width
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
In-Reply-To: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/16/2013 01:19 AM, Alexander Shiyan wrote:
> This patch adds a property to automatically determine the NAND
> bus width. This property works if the bus width is not specified
> explicitly.

> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt

> +- gpio-control-nand,bank-width-auto : Device bus width is determined
> +  automatically if "bank-width" is omitted (Boolean).

How would a driver determine the bank width automatically; is there some
obvious way a driver should do this based on the/a NAND specification?
Is there more than one way this auto-detection could occur, and if so,
which of those methods is this property indicating will work?

I'd rather expect the property description include details of the
auto-detection mechanism that the DT states will work.

