From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 10/11] arm64: dts: r8a77965-salvator-x: Enable DU
 external clocks and HDMI
Date: Mon, 30 Apr 2018 09:34:00 +0200
Message-ID: <20180430073400.6prb2uvb6esslzqb@verge.net.au>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
 <20180427165722.19445-11-kieran.bingham+renesas@ideasonboard.com>
 <3691864.jEUybrQDu7@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3691864.jEUybrQDu7@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2018 at 12:34:26AM +0300, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Friday, 27 April 2018 19:57:21 EEST Kieran Bingham wrote:
> > The DU1 external dot clock is provided by the fixed frequency clock
> > generator X21, while the DU0 and DU3 clocks are provided by the
> > programmable Versaclock5 clock generator.
> > 
> > Enable the clocks, and the HDMI encoder for the M3-N Salvator-X board
> > and hook it up to the HDMI connector.
> > 
> > Based on patches from Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied.
