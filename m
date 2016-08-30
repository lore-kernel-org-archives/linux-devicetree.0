From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: devicetree: spi: fix wrong spi-bus
 documentation
Date: Tue, 30 Aug 2016 17:01:08 -0500
Message-ID: <20160830220108.GA18118@rob-hp-laptop>
References: <20160803141154.3811-1-info@gunibert.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160803141154.3811-1-info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenther Wutz <info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 04:11:54PM +0200, Guenther Wutz wrote:
> This patch adds missing commas to the spi-bus documentation of the
> cs-gpio lines.
> 
> The device tree compiler fails if chip select lines are not
> comma-separated. Fix the erroneous documentation by adding missing
> commas.
> 
> Signed-off-by: Guenther Wutz <info-G3iWtta5+v4b1SvskN2V4Q@public.gmane.org>
> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/spi/spi-bus.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
