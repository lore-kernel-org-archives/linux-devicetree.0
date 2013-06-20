From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: mx27: Replace clk_register_clkdev with clock DT
 lookup
Date: Thu, 20 Jun 2013 17:42:51 +0200
Message-ID: <20130620154251.GC8219@s25.your-server.de>
References: <1371739815-6666-1-git-send-email-mpa@pengutronix.de>
 <1371739815-6666-2-git-send-email-mpa@pengutronix.de>
 <1371742088.528552668@f66.mail.ru>
 <CAOMZO5AaZSAsvNUCOqTuqx7UGCrGH6Cm-Uz9wN3nO1e1XU_usw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5AaZSAsvNUCOqTuqx7UGCrGH6Cm-Uz9wN3nO1e1XU_usw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 12:35:10PM -0300, Fabio Estevam wrote:
> On Thu, Jun 20, 2013 at 12:28 PM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> >> From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >>
> >> Similarly as it was done for mx6q, use a DT lookup in order to make maintainance
> >> task for the clock devices easier.
> >>
> >> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >> [Markus Pargmann: Add gpio clocks]
> >> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/imx27.dtsi | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
> >> index 0695264..48c263c 100644
> >> --- a/arch/arm/boot/dts/imx27.dtsi
> >> +++ b/arch/arm/boot/dts/imx27.dtsi
> >> @@ -208,6 +208,8 @@
> >>                               #gpio-cells = <2>;
> >>                               interrupt-controller;
> >>                               #interrupt-cells = <2>;
> >> +                             clocks = <&clks 47>;
> >> +                             clock-names = "ipg";
> >
> > Clock is not used in the gpio driver, so I doubt the usefulness of this patch.
> 
> I think you meant "this hunk", right?
> 
> My original patch did not have this part. It was added by Markus as
> mentioned in the commit log, and I agree we should go with the
> original version that did not add the gpio clock.

I somehow missed that your patch was applied in march. gpio clocks are
not mentioned in the binding documentation, so I drop this one
completely.

Thanks,

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
