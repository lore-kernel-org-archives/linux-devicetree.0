From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 5/5] ARM: dts: rskrza1: Add input switches
Date: Mon, 20 May 2019 13:29:38 +0200
Message-ID: <20190520112808.pypjpumkwp4qj3g2@verge.net.au>
References: <20190502123220.3016-1-geert+renesas@glider.be>
 <20190502123220.3016-6-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502123220.3016-6-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2019 at 02:32:20PM +0200, Geert Uytterhoeven wrote:
> Add support for input switches SW1-3 on the Renesas RZ/A1 RSK+RZA1
> development board.
> 
> Note that this uses the IRQ interrupts, as the RZ/A1 GPIO controller
> does not include interrupt support.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

I have applied this for inclusion in v5.3
