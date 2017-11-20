From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
Date: Mon, 20 Nov 2017 10:48:41 +0100
Message-ID: <20171120094840.l2egl4w25fzpmlq2@verge.net.au>
References: <1510839250-11199-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510839250-11199-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 02:34:10PM +0100, Geert Uytterhoeven wrote:
> Add a device node for the ROHM BD9571MWV PMIC.
> 
> This was based on the example in the DT binding documentation, but using
> IRQ0 instead of a GPIO interrupt, as that matches the schematics, and
> because INTC-EX is a simpler block.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Clarify the choice for INTC-EX.

Thanks, applied.
