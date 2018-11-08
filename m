Return-Path: <SRS0=+CEJ=NT=verge.net.au=horms@kernel.org>
Date: Thu, 8 Nov 2018 11:41:00 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774a1: Replace clock magic
 numbers
Message-ID: <20181108104100.7vnytme4zs4v4dqq@verge.net.au>
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 07, 2018 at 03:24:27PM +0000, Fabrizio Castro wrote:
> Now that include/dt-bindings/clock/r8a774a1-cpg-mssr.h is in Linus'
> master branch we can replace clock related magic numbers with the
> corresponding labels.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
