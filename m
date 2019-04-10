Return-Path: <SRS0=PIpc=SM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40044 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfDJJWl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Apr 2019 05:22:41 -0400
Date: Wed, 10 Apr 2019 11:22:37 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
Message-ID: <20190410092237.ctzwuevbprgjkocv@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
 <20190405081716.s74zbrd47ychcevw@verge.net.au>
 <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 05, 2019 at 06:02:30PM +0900, Cao Van Dong wrote:
> Dear Simon-san,
> 
> On 2019/04/05 17:17, Simon Horman wrote:
> > On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
> > > This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
> > > 
> > > Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Thanks you for review!
> > I am, however, curious to know how you tested this.
> > 
> > Likewise for patches 2/4 and 3/4.
> Always thanks for your curious!
> After booting, I checked the existence of the device and the device
> interrupt.

Thanks,

I have applied patches 1/4, 2/4 and 3/4 for inclusion in v5.2.
