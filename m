Return-Path: <SRS0=+CEJ=NT=verge.net.au=horms@kernel.org>
Date: Thu, 8 Nov 2018 11:39:51 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774a1: Replace power magic
 numbers
Message-ID: <20181108103951.4wpz5evrnbmget32@verge.net.au>
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541604267-4652-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541604267-4652-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 07, 2018 at 03:24:26PM +0000, Fabrizio Castro wrote:
> Now that include/dt-bindings/power/r8a774a1-sysc.h is in Linus'
> master branch we can replace power related magic numbers with
> the corresponding labels.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
