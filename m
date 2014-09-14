From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 1/3] irqchip: renesas-intc-irqpin: Document
 SoC-specific bindings
Date: Sun, 14 Sep 2014 01:32:41 -0400
Message-ID: <20140914053241.GH21986@titan.lakedaemon.net>
References: <1409212800-4957-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409212800-4957-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 28, 2014 at 09:59:58AM +0200, Geert Uytterhoeven wrote:
> The documentation only mentioned the generic fallback compatible property.
> Add the missing SoC-specific compatible properties, which are already in
> use.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2:
>   - Add Acked-by
> ---
>  .../bindings/interrupt-controller/renesas,intc-irqpin.txt         | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Whole series applied to irqchip/core

thx,

Jason.
