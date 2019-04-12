Return-Path: <SRS0=jC+j=SO=verge.net.au=horms@kernel.org>
Date: Fri, 12 Apr 2019 14:25:17 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V5 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
Message-ID: <20190412122517.6e7nj5tfrnfrcn2f@verge.net.au>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 10, 2019 at 03:48:49PM +0100, Biju Das wrote:
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

Thanks Biju,

applied for v5.2.
