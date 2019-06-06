From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and
 RZ/A2M
Date: Thu, 6 Jun 2019 10:37:30 +0200
Message-ID: <20190606083730.7axbdme3hs6jcbcx@verge.net.au>
References: <20190502123220.3016-1-geert+renesas@glider.be>
 <20190502123220.3016-4-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502123220.3016-4-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2019 at 02:32:18PM +0200, Geert Uytterhoeven wrote:
> Auto-enable support for the RZ/A1 Interrupt Controller when configuring
> a kernel which supports RZ/A1H or RZ/A2M SoCs.
> Keep selects sorted while at it.
> 
> This is similar to how interrupt controllers for other Renesas SoCs are
> enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied for v5.3.
