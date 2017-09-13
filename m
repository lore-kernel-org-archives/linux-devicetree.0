From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] gpio: rcar: Add r8a77995 (R-Car D3) support
Date: Wed, 13 Sep 2017 09:48:35 +0200
Message-ID: <20170913074835.GG6756@verge.net.au>
References: <1505285329-6881-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505285329-6881-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 03:48:49PM +0900, Yoshihiro Shimoda wrote:
> This patch adds binding for r8a77995 (R-Car D3). This SoC can use
> "renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
> doesn't modify the gpio-rcar driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Simon Horman <horms+renesas@verge.net.au>
