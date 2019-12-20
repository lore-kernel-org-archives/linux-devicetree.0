Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7191DC43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 16:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 450682465E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 16:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfLTQtL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 11:49:11 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:45171 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTQtL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 11:49:11 -0500
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7DE7624000C;
        Fri, 20 Dec 2019 16:49:07 +0000 (UTC)
Date:   Fri, 20 Dec 2019 17:49:07 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: at91: Document Kizboxmini and
 Smartkiz boards binding
Message-ID: <20191220164907.GD895367@piout.net>
References: <20191220103835.160154-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220103835.160154-1-kamel.bouhara@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20/12/2019 11:38:34+0100, Kamel Bouhara wrote:
> Document devicetree's bindings for the Overkiz's Kizbox Mini and
> Smartkiz boards, based on a SAM9G25 Atmel SoC.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2
> =============
> 	- Added Kizboxmini Base board documentation
> 	- Merged Smartkiz documentation as it is also a sam9g25 based
> 	board
> 
> Changes in v3
> =============
> 	- Made a single items list with all the sam9g25 based boards and
> 	put description into a comment.
> 	- Fixed duplicated item in enum list and checked with 'make
> 	dt_binding_check'
> 
> Changes in v4
> =============
> 	- Fix missing "-" before items list
> 
> Changes in v5
> =============
> 	- s/at91-kizboxmini_common.dtsi/at91-kizboxmini-common.dtsi/
> 
> Changes in v6
> =============
> 	- Rebase to v5.5-rc2
> 	- Fix space indentation
> 	- Add a Rb tag.
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
