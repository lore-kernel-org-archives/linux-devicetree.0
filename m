From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document R-Car M3-W,
 V3M, D3 support
Date: Fri, 13 Oct 2017 14:08:26 -0500
Message-ID: <20171013190826.2hhvgifxdlbmj4mw@rob-hp-laptop>
References: <1507290692-23062-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507290692-23062-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 06, 2017 at 01:51:32PM +0200, Geert Uytterhoeven wrote:
> Document support for the Interrupt Controller for Externel Devices
> (INTC-EX) in the Renesas M3-W (r8a7796), V3M (r8a77970), and D3
> (r8a77995) SoCs.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.txt          | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
