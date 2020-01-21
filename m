Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4974AC33CAA
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 09:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CD0024654
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579600480;
	bh=mKhvch8Du+mQPISFMcQpZ0BBoovym2B3DLS6LvALmDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GcBWqKjo5ixignYz/ugXMSaekrVk5lWU7Wz5ddylYmS+TuZ9R28G5EjpSJopU/9fw
	 3/SspTG/25XdeNMjpdBu/pYVaH5GQxXpum6LHroYHKX4ot9yONt/+R74rlFxdpDugO
	 h7CSReKK0NBA2xBzv/HzKDMVeeDVA60mKBS+Y3n4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgAUJyg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 04:54:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:56930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729027AbgAUJyf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 04:54:35 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 851F320882;
        Tue, 21 Jan 2020 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579600475;
        bh=mKhvch8Du+mQPISFMcQpZ0BBoovym2B3DLS6LvALmDk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGyrH7BYqdKE8nVBIE8FPYCdcsH6XdSiGzdBwPg+anUgq8J79nadTzI+Qg70wr2zx
         rplICv0z3tYgVYQ/NvGAQrmFXs3W2D7xs3csroutuMekI3R3u4QEZluR8Bp8m3Tkk0
         MYLtUJUKvk9Jt1KO94OEV/ulqSx9xPB2Rn08MLpI=
Date:   Tue, 21 Jan 2020 15:24:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, psodagud@codeaurora.org,
        tsoni@codeaurora.org, jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add RPMHCC bindings for SM8250
Message-ID: <20200121095431.GK2841@vkoul-mobl>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-01-20, 15:39, Venkata Narendra Kumar Gutta wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add bindings and update documentation for clock rpmh driver on SM8250.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
