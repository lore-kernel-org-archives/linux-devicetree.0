Return-Path: <SRS0=9BQ+=MN=verge.net.au=horms@kernel.org>
Date: Mon, 1 Oct 2018 15:01:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: usb-xhci: Document r8a7744 support
Message-ID: <20181001130105.b6vuhtrlt73jgvmn@verge.net.au>
References: <1538055758-3416-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538055758-3416-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 27, 2018 at 02:42:38PM +0100, Biju Das wrote:
> Document r8a7744 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen2-xhci", therefore no driver
> change is needed.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
