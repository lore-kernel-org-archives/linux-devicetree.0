Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42609 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDILvn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Apr 2019 07:51:43 -0400
Date: Tue, 9 Apr 2019 13:51:38 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/11] ARM: dts: r8a77470: Add HSCIF support
Message-ID: <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-2-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554799912-24764-2-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 09, 2019 at 05:51:42PM +0900, Cao Van Dong wrote:
> Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
