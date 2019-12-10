Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D605CC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2AAB2073B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfLJLBX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 06:01:23 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:49783 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbfLJLBX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 06:01:23 -0500
Received: from localhost (136.112.broadband15.iol.cz [90.182.112.136])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4F39B100008;
        Tue, 10 Dec 2019 11:01:21 +0000 (UTC)
Date:   Tue, 10 Dec 2019 12:01:18 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: at91: rearrange kizbox dts using aliases
 nodes
Message-ID: <20191210110118.GH1463890@piout.net>
References: <20191205223021.1370083-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205223021.1370083-1-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05/12/2019 23:30:21+0100, Kamel Bouhara wrote:
> Use aliases nodes to easy kizbox dts readability.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes in v3:
> 	- Fixed missing i2c-gpio0 label in dtsi
> Changes in v2:
> 	- Fixed some missing aliases label from dtsi
> 
>  arch/arm/boot/dts/at91-kizbox.dts  | 172 ++++++++++++++---------------
>  arch/arm/boot/dts/at91sam9260.dtsi |   4 +-
>  2 files changed, 86 insertions(+), 90 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
