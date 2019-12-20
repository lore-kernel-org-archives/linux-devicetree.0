Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E289C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 16:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F77B20665
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 16:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLTQte (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 11:49:34 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56797 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTQtd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 11:49:33 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 51A222000B;
        Fri, 20 Dec 2019 16:49:31 +0000 (UTC)
Date:   Fri, 20 Dec 2019 17:49:31 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org,
        =?iso-8859-1?Q?K=E9vin?= RAYMOND <k.raymond@overkiz.com>,
        Mickael GARDET <m.gardet@overkiz.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: at91: add smartkiz support and a common
 kizboxmini dtsi file
Message-ID: <20191220164931.GE895367@piout.net>
References: <20191220103835.160154-1-kamel.bouhara@bootlin.com>
 <20191220103835.160154-2-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191220103835.160154-2-kamel.bouhara@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20/12/2019 11:38:35+0100, Kamel Bouhara wrote:
> Split the existing Kizbox Mini boards into three board configuration,
> the base board, the mother board and the RailDIN board.
> Add a new dts file for the SmartKiz board support.
> 
> Signed-off-by: Kévin RAYMOND <k.raymond@overkiz.com>
> Signed-off-by: Mickael GARDET <m.gardet@overkiz.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   5 +-
>  arch/arm/boot/dts/at91-kizboxmini-base.dts    |  24 +++
>  ...oxmini.dts => at91-kizboxmini-common.dtsi} | 163 +++++++++---------
>  arch/arm/boot/dts/at91-kizboxmini-mb.dts      |  26 +++
>  arch/arm/boot/dts/at91-kizboxmini-rd.dts      |  49 ++++++
>  arch/arm/boot/dts/at91-smartkiz.dts           | 109 ++++++++++++
>  6 files changed, 293 insertions(+), 83 deletions(-)
>  create mode 100644 arch/arm/boot/dts/at91-kizboxmini-base.dts
>  rename arch/arm/boot/dts/{at91-kizboxmini.dts => at91-kizboxmini-common.dtsi} (51%)
>  create mode 100644 arch/arm/boot/dts/at91-kizboxmini-mb.dts
>  create mode 100644 arch/arm/boot/dts/at91-kizboxmini-rd.dts
>  create mode 100644 arch/arm/boot/dts/at91-smartkiz.dts
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
