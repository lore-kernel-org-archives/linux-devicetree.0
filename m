Return-Path: <SRS0=Qj9C=HT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42251 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751751AbeD3HgT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Apr 2018 03:36:19 -0400
Date: Mon, 30 Apr 2018 09:36:15 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/6] arm: dts: r8a77965 DU enablement
Message-ID: <20180430073614.sosppfdimrnf6vja@verge.net.au>
References: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
 <1629090.m3TlISLGqP@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629090.m3TlISLGqP@avalon>
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Apr 28, 2018 at 01:06:20AM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Saturday, 28 April 2018 01:02:14 EEST Kieran Bingham wrote:
> > Provide the required DT updates to enable the DU and, VGA and HDMI
> > outputs on the M3-N Salvator-X(S) platforms.
> > 
> > Driver updates and binding updates are sent separately.
> > 
> > Kieran Bingham (6):
> >   arm64: dts: r8a77965: Add FCPF and FCPV instances
> >   arm64: dts: r8a77965: Add VSP instances
> >   arm64: dts: r8a77965: Populate the DU instance placeholder
> >   arm64: dts: r8a77965: Add HDMI encoder instance
> >   arm64: dts: r8a77965-salvator-x: Enable DU external clocks and HDMI
> >   arm64: dts: r8a77965-salvator-xs: Enable DU external clocks and HDMI
> > 
> >  .../boot/dts/renesas/r8a77965-salvator-x.dts  |  28 ++++
> >  .../boot/dts/renesas/r8a77965-salvator-xs.dts |  28 ++++
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 131 +++++++++++++++++-
> >  3 files changed, 183 insertions(+), 4 deletions(-)
> 
> I've reviewed the whole series and all DT bindings are either reviewed and 
> scheduled for upstreaming ("renesas,r8a77965-hdmi") or already upstream 
> (everything else). Feel free to queue this in your tree for v4.18 whenever you 

Thanks, all applied.
