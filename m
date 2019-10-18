Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853C8CA9EA3
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 08:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A4DF222CB
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571385781;
	bh=H2AnPxP61DdUfGRZbiKUE6pyvKjTw7ttUbZaaO0THK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IoSH6FI/aGQcw8OdzFNRC16HxwGVTXf0n0YbFmNt6VVLCNZj3ivYeQ8xRCENUZo8v
	 ubLCQKhnF5QVxbt55wfMzivMlzDILv6QM26gCRrnOyCcYPcNhIf2kgtpDBVZtMtmlD
	 84dHqC6KXDBuWIVqtjhB4tptTURiEHAP9/ujE8Qk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504706AbfJRIDA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 04:03:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729376AbfJRIDA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 18 Oct 2019 04:03:00 -0400
Received: from localhost (unknown [106.200.243.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 333362089C;
        Fri, 18 Oct 2019 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571385780;
        bh=H2AnPxP61DdUfGRZbiKUE6pyvKjTw7ttUbZaaO0THK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2yb586hMDXEfwkIlvEuj++GZhMRqXLx3ZdvUfWus68wwjWYsZ+0Z95CifSzhGI+N
         ueu6LuewQu/PjpAS/hld8Cw7yfkjOgPb0NLbzPxpe/xgv8N5Fl5LaWhyiD8Rn8hxK0
         KbjBksjjcFs2kbK9WIkmqNS7+zvX4ENh6cQO1wRA=
Date:   Fri, 18 Oct 2019 13:32:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     jassisinghbrar@gmail.com
Cc:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, masami.hiramatsu@linaro.org,
        orito.takao@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v4 0/2] Add support for AHB DMA controller on Milbeaut
 series
Message-ID: <20191018080256.GR2654@vkoul-mobl>
References: <20191015033301.14791-1-jassisinghbrar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015033301.14791-1-jassisinghbrar@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 14-10-19, 22:33, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> The following series adds AHB DMA (HDMAC) controller support on Milbeaut series.
> This controller is capable of Mem<->MEM and DEV<->MEM transfer. But only DEV<->MEM
> is currently supported.

Applied, thanks

-- 
~Vinod
