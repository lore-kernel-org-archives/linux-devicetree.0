Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:46439 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755894Ab3HFKaL convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 06:30:11 -0400
Message-ID: <1375785006.12043.1.camel@hornet>
Subject: Re: [PATCH v3 4/4] mtd: nand: gpio: Add support for multichip
 devices
From: Pawel Moll <pawel.moll@arm.com>
Date: Tue, 06 Aug 2013 11:30:06 +0100
In-Reply-To: <1375779459-32549-2-git-send-email-shc_work@mail.ru>
References: <1375779459-32549-1-git-send-email-shc_work@mail.ru>
	 <1375779459-32549-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, 2013-08-06 at 09:57 +0100, Alexander Shiyan wrote:
> This patch adds support for multichip NAND devices controlled through GPIOs.
> To implement this, the properties of tree have been renamed. All current
> boards and DTS files converted to use an updated driver. Also driver
> temporarily keep support for DTS files which use the previous names scheme.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |  16 +--
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts       |  10 +-
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts       |  10 +-

For the bindings part:

Acked-by: Pawel Moll <pawel.moll@arm.com>


