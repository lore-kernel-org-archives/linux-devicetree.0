Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0ECC38A2C
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 11:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB9B2078E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587124421;
	bh=c/rbJdi4bYdAFafdhrDilNV10AtbkTU0xeSBWfYgwCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2qAOoO8VvQPZfWzZIochXFQ9isaOzQ5Q9RzGPJ0OtV2gBYwZfmBaWYZwe01qi0jxH
	 vk/Py4+tGhvYnvuX2PKq9nFxF3MxAhD+cjYLZJ5g0xuDUFi/Wy3HuhCAOA41X9w0c+
	 vUQj0jeAB9CkS5McwKjXD4ZKqjZsxvjb9EHEDnj8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbgDQLxl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 07:53:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730410AbgDQLxl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 07:53:41 -0400
Received: from localhost (unknown [223.235.195.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 046C920780;
        Fri, 17 Apr 2020 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587124420;
        bh=c/rbJdi4bYdAFafdhrDilNV10AtbkTU0xeSBWfYgwCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v5JT95G9uSRzM2zf7VY5lVEZD95zWBnXQH5XfR2a3Y6LqF/0Y7YDGMBreJtaTT8Ic
         bjiayscEPlzYfF2mqYo7prUsQ1ry/1i8ysf3StEqOMNuEX1T7RQ3wIkuAxPIqMf65E
         0h6ExThYl2PUDh9keQqkDPpXEP+TTe0/2z34X8kY=
Date:   Fri, 17 Apr 2020 17:23:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     robh+dt@kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] dt-bindings: dma: renesas,{rcar,usb}-dmac:
 convert to json-schema
Message-ID: <20200417115336.GN72691@vkoul-mobl>
References: <1587110829-26609-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587110829-26609-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 17-04-20, 17:07, Yoshihiro Shimoda wrote:
> This patch series converts rcar-dmac and usb-dmac documantation to
> json-schema.

Applied, thanks

-- 
~Vinod
