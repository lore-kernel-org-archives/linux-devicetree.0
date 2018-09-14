Return-Path: <SRS0=H4Pq=L4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33000 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbeINSvt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Sep 2018 14:51:49 -0400
Date: Fri, 14 Sep 2018 15:37:12 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: Remove unneeded status from thermal
 nodes
Message-ID: <20180914133706.3n2s7upsyevdox6c@verge.net.au>
References: <20180911143730.9230-1-geert+renesas@glider.be>
 <20180912093454.3mlevy6b4252wpsz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912093454.3mlevy6b4252wpsz@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 11:34:56AM +0200, Simon Horman wrote:
> On Tue, Sep 11, 2018 at 04:37:30PM +0200, Geert Uytterhoeven wrote:
> > The thermal device is supposed to be always enabled.  As the default
> > value of the status property is "okay", there is no need to make this
> > explicit in SoC-specific .dtsi files where no override is involved.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
