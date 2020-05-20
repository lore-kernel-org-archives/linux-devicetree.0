Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61947C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 02:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B8A42084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 02:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589943460;
	bh=wpjWTi9IWHiTI6IlVkaz+MdgzSdiyTPoZEbvWwHe4QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=O7DtNvNVmc1npUyHaG/nEtHUEhCTRJNwgLu6x2QYKwOdl1XXDtE8Tx7XnTiDAmHSA
	 o6sMD2eHzJf1uwqD4BVt5IPboaZ/w/tY8GrYwNpjRG3cXvuRKkPB1Yo1tj4quGB+pp
	 JX31EJ0MGBRRols4fkCxj7z0OD9CZUBFwJpaqJCw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbgETC5j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 22:57:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgETC5j (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 19 May 2020 22:57:39 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D0F220842;
        Wed, 20 May 2020 02:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589943459;
        bh=wpjWTi9IWHiTI6IlVkaz+MdgzSdiyTPoZEbvWwHe4QE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nmKDjrM7rL860w0rI/ucgoamwlQ5v/haCm9TTD2QdDZNsVxlkDcHKGC8mWJMC+gS+
         xS4zFCX0quziyme6rerUCa3g/slNg9X2yGkG9mTQj37fjbZGjQNmLS4Rxea0NTPJ+y
         ltzFm0le4W8lvxu4NG6dgoBTuQfWsVU9k8EbXtc4=
Date:   Wed, 20 May 2020 10:57:33 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie
Subject: Re: [PATCH v2 2/4] ARM: dts: ims53: Group port definitions for the
 dvi-converter
Message-ID: <20200520025732.GX11739@dragon>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-3-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514143612.2094-3-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 04:36:10PM +0200, Ricardo Cañuelo wrote:
> Group the port definitions of the dvi-converter in a 'ports' node to
> make it compliant with the ti,tfp410 binding.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

s/ims53/imx53-cx9020 in subject.

I fixed it up and applied the patch.

Shawn
