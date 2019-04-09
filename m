Return-Path: <SRS0=ScCE=SL=verge.net.au=horms@kernel.org>
Date: Tue, 9 Apr 2019 13:17:28 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V3 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
Message-ID: <20190409111728.nevn3cyltymba4ac@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-13-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-13-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 03, 2019 at 11:28:43AM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the HSUSB0/1 device nodes.
> 
> Currently the renesas_usbhs driver doesn't handle multiple phys and we
> don't have a proper hardware to validate such driver changes.
> 
> So for hsusb1 it is assumed that usbphy0 will be enabled by either
> channel0 host or device.
> 
> In future, if any boards support hsusb1, we will need to add multiple phy
> support in the renesas_usbhs driver and override the board dts to enable
> the same.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
