Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F0DC47E49
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 15:49:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBB8C21D82
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 15:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395419AbfJYPtq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 11:49:46 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57447 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbfJYPtq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 11:49:46 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id C14CB3C04C1;
        Fri, 25 Oct 2019 17:49:43 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Av7n7kLoul8U; Fri, 25 Oct 2019 17:49:38 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6E0213C009D;
        Fri, 25 Oct 2019 17:49:38 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 25 Oct
 2019 17:49:38 +0200
Date:   Fri, 25 Oct 2019 17:49:34 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 0/5] dt-bindings: arm: renesas: Add core r8a77961
 support
Message-ID: <20191025154924.GA25877@vmlxhi-102.adit-jv.com>
References: <20191023122911.12166-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191023122911.12166-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

On Wed, Oct 23, 2019 at 02:29:06PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series updates the Renesas DT binding documentation for core
> components on the new R-Car M3-W+ (R8A77961) SoC, and for the
> Salvator-XS development board equipped with this SoC.
> 
> Changes compared to v1[1]:
>   - Split in per-subsystem series,
>   - Add Reviewed-by,
>   - Add board part number.
> 
> I intend to queue this series in renesas-devel for v5.5.

I've reviewed the whole series. Thanks!

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

-- 
Best Regards,
Eugeniu
