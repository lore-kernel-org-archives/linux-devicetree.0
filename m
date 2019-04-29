From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/5] ARM: dts: r7s72100: Add IRQC device node
Date: Mon, 29 Apr 2019 15:11:09 +0200
Message-ID: <20190429131109.6qqti7z47sy6xucd@verge.net.au>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-5-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190429093631.10799-5-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 29, 2019 at 11:36:30AM +0200, Geert Uytterhoeven wrote:
> Enable support for the IRQC on RZ/A1H, which is a small front-end to the
> GIC.  This allows to use up to 8 external interrupts with configurable
> sense select.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

this is fine by me but other parts of the series need respinning.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
