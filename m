From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Date: Tue, 7 May 2019 15:53:21 +0200
Message-ID: <20190507135321.nuukbsbhwcsc7afc@verge.net.au>
References: <20190502123220.3016-1-geert+renesas@glider.be>
 <20190502123220.3016-3-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502123220.3016-3-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2019 at 02:32:17PM +0200, Geert Uytterhoeven wrote:
> Add a driver for the Renesas RZ/A1 Interrupt Controller.
> 
> This supports using up to 8 external interrupts on RZ/A1, with
> configurable sense select.
> 
> NMI edge select is not yet supported.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
