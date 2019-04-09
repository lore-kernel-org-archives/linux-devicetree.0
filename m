Return-Path: <SRS0=ScCE=SL=verge.net.au=horms@kernel.org>
Date: Tue, 9 Apr 2019 13:15:15 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V3 10/13] ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI)
 device
Message-ID: <20190409111515.g524ctvalqrnek5f@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-11-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-11-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 03, 2019 at 11:28:41AM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the USB2.0 Host Controller device
> nodes (ehci[01]/ohci[01]).
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
