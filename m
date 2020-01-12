Return-Path: <SRS0=cAWA=3B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEC5C33CA9
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jan 2020 06:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF8EF20842
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jan 2020 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578810263;
	bh=dA7Y+M1xkDoiyTBWHECvmy971XxNXYZ+AlF7WdltObY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1NOtYMpz2lOaeXBTgQcyvjSxico+KRy8vrudi2HBSb22hy/TJIZDJvn+BIoUgU0vu
	 ICr1O4GkG+9CFjunsQcq6UY1MC67fLcKg2Y5YX4Yxg+XA+7tQ+R+NBRHMIW1N7PI5I
	 anwsMcyNa/blk7ltDo2eOg66dpDEbXJrMxpLI218=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732284AbgALGYU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jan 2020 01:24:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:57738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732246AbgALGYU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 12 Jan 2020 01:24:20 -0500
Received: from T480 (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2484720842;
        Sun, 12 Jan 2020 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578810259;
        bh=dA7Y+M1xkDoiyTBWHECvmy971XxNXYZ+AlF7WdltObY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ff5qBEpTpO4/M1KGlt2oOdQbkiMcOTVxyuE4Uawg5KmaJoNkrpkUirg/dOvcx87e/
         oULdsE6v98K2CWAUvaeUx4vSk/4xwG4VaJbnbIeOz/bu6kGX+E0fIC6Wq7qNObrH7j
         Gj16/tr489q4V1cL513W7T3AFs3+HPqzdNttvBuc=
Date:   Sun, 12 Jan 2020 14:24:09 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Robert Jones <rjones@gateworks.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/5] ARM: dts: imx: Add GW59xx Gateworks specials
Message-ID: <20200112062407.GB27570@T480>
References: <20200108154424.15736-1-rjones@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108154424.15736-1-rjones@gateworks.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 08, 2020 at 07:44:19AM -0800, Robert Jones wrote:
> Robert Jones (4):
>   dt-bindings: arm: fsl: Add Gateworks Ventana i.MX6DL/Q compatibles
>   ARM: dts: imx: Add GW5907 board support
>   ARM: dts: imx: Add GW5913 board support
>   ARM: dts: imx: Add GW5912 board support
> 
> Tim Harvey (1):
>   ARM: dts: imx: Add GW5910 board support

Applied all, thanks.
