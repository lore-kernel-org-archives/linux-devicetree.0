Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1359FC2D0BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 06:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDE9A208C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575957973;
	bh=7jrlVMx0ZzN8zh1j+zKOid+hTzkpiUjgtIFq4JSpg6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XedcEUHRK6K27R2pMGPWhXzve9vNW6J1kAT5xlULXnpCzOSDjMhjTGsauIqyAAcfc
	 Imszy3lMZ3Z7yZ+7VdovmzwkLcjSER0YUrKMdk35xDrgqxM6oXE3fWT44uXoyUh8Eq
	 gxQZEYPnjp/i4kqNjei0P3864gaVDIlt3OYS2wUs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfLJGGN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 01:06:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:52338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfLJGGN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 01:06:13 -0500
Received: from localhost (unknown [106.201.45.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B48E20652;
        Tue, 10 Dec 2019 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575957972;
        bh=7jrlVMx0ZzN8zh1j+zKOid+hTzkpiUjgtIFq4JSpg6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ucQdf7FkoTg2736i3S9t5VD2PhKieI8Q8tXbvLnZ6AyrjXkUoVI/BQxM030+TQzSh
         NsiMdS5s90672ZogBXyNWkVA7C3Th101EqPWnUkbffMw+Ys7QJz3qJHJx/LkZzu7ps
         HAqM2s16ENGnXa/U3nL5678vjZABI7nvYINhU9Ck=
Date:   Tue, 10 Dec 2019 11:36:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dmaengine: rcar-dmac: Document r8a77961
 support
Message-ID: <20191210060608.GR82508@vkoul-mobl>
References: <20191205133736.5934-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205133736.5934-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05-12-19, 14:37, Geert Uytterhoeven wrote:
> Document support for the system DMA controller in the Renesas R-Car
> M3-W+ (R8A77961) SoC.

Applied, thanks

-- 
~Vinod
