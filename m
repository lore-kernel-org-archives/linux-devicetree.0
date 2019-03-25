Return-Path: <SRS0=yqAM=R4=verge.net.au=horms@kernel.org>
Date: Mon, 25 Mar 2019 11:58:31 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: iwg23s-sbc: Add HDMI support
Message-ID: <20190325105831.wjufmb3snarhgic7@verge.net.au>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1552998099-22972-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552998099-22972-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 19, 2019 at 12:21:39PM +0000, Fabrizio Castro wrote:
> This patch adds HDMI video output support to the iwg23s board
> from iWave. Due to a problem with the bootloader not dealing
> with the configuration of one of the pins correctly, we have
> to use a gpio-hog for the interrupt line to make sure the pin
> is configured as GPIO-input when requesting the interrupt.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Fabrizio, applied for v5.2.
