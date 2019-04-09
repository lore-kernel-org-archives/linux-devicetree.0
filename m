Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42766 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfDIMCB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Apr 2019 08:02:01 -0400
Date: Tue, 9 Apr 2019 14:01:57 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 04/11] ARM: dts: r8a77470: Add CAN support
Message-ID: <20190409120157.a5owu4tus25qsz4e@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-5-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554799912-24764-5-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 09, 2019 at 05:51:45PM +0900, Cao Van Dong wrote:
> Add can{0|1} nodes to dtsi for CAN support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
