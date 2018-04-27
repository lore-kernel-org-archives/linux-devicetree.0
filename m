Return-Path: <SRS0=w2p0=HQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753569AbeD0WGG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Apr 2018 18:06:06 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/6] arm: dts: r8a77965 DU enablement
Date: Sat, 28 Apr 2018 01:06:20 +0300
Message-ID: <1629090.m3TlISLGqP@avalon>
In-Reply-To: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
References: <20180427220220.31286-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Saturday, 28 April 2018 01:02:14 EEST Kieran Bingham wrote:
> Provide the required DT updates to enable the DU and, VGA and HDMI
> outputs on the M3-N Salvator-X(S) platforms.
> 
> Driver updates and binding updates are sent separately.
> 
> Kieran Bingham (6):
>   arm64: dts: r8a77965: Add FCPF and FCPV instances
>   arm64: dts: r8a77965: Add VSP instances
>   arm64: dts: r8a77965: Populate the DU instance placeholder
>   arm64: dts: r8a77965: Add HDMI encoder instance
>   arm64: dts: r8a77965-salvator-x: Enable DU external clocks and HDMI
>   arm64: dts: r8a77965-salvator-xs: Enable DU external clocks and HDMI
> 
>  .../boot/dts/renesas/r8a77965-salvator-x.dts  |  28 ++++
>  .../boot/dts/renesas/r8a77965-salvator-xs.dts |  28 ++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 131 +++++++++++++++++-
>  3 files changed, 183 insertions(+), 4 deletions(-)

I've reviewed the whole series and all DT bindings are either reviewed and 
scheduled for upstreaming ("renesas,r8a77965-hdmi") or already upstream 
(everything else). Feel free to queue this in your tree for v4.18 whenever you 
like.

-- 
Regards,

Laurent Pinchart



