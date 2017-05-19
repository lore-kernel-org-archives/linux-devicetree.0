From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dt-bindings: rcar-dmac: Document missing error interrupt
Date: Fri, 19 May 2017 14:58:05 +0530
Message-ID: <20170519092804.GR15061@localhost>
References: <1495178867-817-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1495178867-817-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 09:27:47AM +0200, Geert Uytterhoeven wrote:
> The documentation for the "interrupt-names" property only mentions the
> per-channel interrupts, while the error interrupt has always been
> mandatory, too.

Applied, thanks

-- 
~Vinod
