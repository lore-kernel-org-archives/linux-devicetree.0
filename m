Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB386C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B246720709
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577087061;
	bh=kPjCbh8YQ/u75m8hPE0XtPPZuQwgrrgX09NSbRjpULM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hN82f2a/pEOEsm504ZjXa1TUfSIHFDNfg5woiX2mK4d/3wC25nhlgtoAsM0XY6Bnm
	 S5evw5pa5xaGDLMlzrftaHIjO4ugopxTh5YcdeCaCaMsf9fgpsAe8ee2JdeMmbSzsn
	 CTi8rpsBofQ6Z+mjYUkZblDc1Fy2ZS09xRSjMXrg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfLWHoV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 02:44:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:54100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbfLWHoV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 02:44:21 -0500
Received: from localhost (unknown [223.226.34.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFE69206CB;
        Mon, 23 Dec 2019 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577087060;
        bh=kPjCbh8YQ/u75m8hPE0XtPPZuQwgrrgX09NSbRjpULM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pXYGleqb4/QEzRZqF/huE45xNvJmLOKREZlYSZ+aNic4dNL1jLcXFqgot/posh1Zv
         NKq8kWk5HP6J5eoGaChiOJ/gx+oSKHBH71DYpU3LFubDPW/cu9I6eR26EoT9Nfl8Y1
         nJH7mi9E6qKFD3fWDhbNAtoFvZKAg+69j5PPaslk=
Date:   Mon, 23 Dec 2019 13:14:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 09/14] dmaengine: ti: omap-dma: Configure global priority
 register directly
Message-ID: <20191223074416.GY2536@vkoul-mobl>
References: <20191217001925.44558-1-tony@atomide.com>
 <20191217001925.44558-10-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217001925.44558-10-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-12-19, 16:19, Tony Lindgren wrote:
> We can move the global priority register configuration to the dmaengine
> driver and configure it based on the of_device_id match data.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
