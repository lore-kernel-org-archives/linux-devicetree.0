From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/5] dt: bindings: i2c-mux-pca954x: Add documentation
 for i2c-mux-irq-mask-en
Date: Mon, 9 Jan 2017 23:36:08 -0600
Message-ID: <20170110053608.xhoe4xmtmcycaayn@rob-hp-laptop>
References: <1483952576-5308-1-git-send-email-preid@electromag.com.au>
 <1483952576-5308-5-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483952576-5308-5-git-send-email-preid@electromag.com.au>
Sender: linux-i2c-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: peda@axentia.se, wsa@the-dreams.de, mark.rutland@arm.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 05:02:55PM +0800, Phil Reid wrote:
> Unfortunately some hardware device will assert their irq line immediately
> on power on and provide no mechanism to mask the irq. As the i2c muxes
> provide no method to mask irq line this provides a work around by keeping
> the parent irq masked until enough device drivers have loaded to service
> all pending interrupts.
> 
> For example the the ltc1760 assert its SMBALERT irq immediately on power
> on. With two ltc1760 attached to bus 0 & 1 on a pca954x mux when the first
> device is registered irq are enabled and fire continuously as the second
> device driver has not yet loaded. Setting this parameter to 0x3 while
> delay the irq being enabled until both devices are ready.
> 
> Acked-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
