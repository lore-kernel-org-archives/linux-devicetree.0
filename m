From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] irqchip: renesas-intc-irqpin: Improve binding
 documentation
Date: Tue, 28 Apr 2015 11:08:25 +0900
Message-ID: <20150428020825.GC26051@verge.net.au>
References: <1430145937-29267-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430145937-29267-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 04:45:37PM +0200, Geert Uytterhoeven wrote:
> Add missing documentation for required properties:
>   - interrupt-controller,
>   - parent interrupts (one entry per provided interrupt).
> 
> Add missing documentation for optional properties:
>   - functional clock (managed since commit 705bc96c2c15313c ("irqchip:
>     renesas-intc-irqpin: Add minimal runtime PM support")),
>   - power-domains.
> 
> Add an example, taken from r8a7740.dtsi.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>
