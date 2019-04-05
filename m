Return-Path: <SRS0=qoK5=SH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53238 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730103AbfDEIRW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Apr 2019 04:17:22 -0400
Date: Fri, 5 Apr 2019 10:17:16 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
Message-ID: <20190405081716.s74zbrd47ychcevw@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
> 
> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I am, however, curious to know how you tested this.

Likewise for patches 2/4 and 3/4.
