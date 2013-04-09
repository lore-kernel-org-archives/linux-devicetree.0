From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] Documentation: gpio-reset.txt: Fix 'initially-in-reset'
 example
Date: Tue, 09 Apr 2013 10:07:21 +0200
Message-ID: <1365494841.4023.22.camel@pizza.hi.pengutronix.de>
References: <1365012265-32514-1-git-send-email-fabio.estevam@freescale.com>
 <1365062022.4089.7.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365062022.4089.7.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
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
To: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 04.04.2013, 09:53 +0200 schrieb Philipp Zabel:
> Am Mittwoch, den 03.04.2013, 15:04 -0300 schrieb Fabio Estevam:
> > Fix typo in 'initially-in-reset' example.
> > 
> > Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../devicetree/bindings/reset/gpio-reset.txt       |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/gpio-reset.txt b/Documentation/devicetree/bindings/reset/gpio-reset.txt
> > index 1f203eb..8ab044c 100644
> > --- a/Documentation/devicetree/bindings/reset/gpio-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/gpio-reset.txt
> > @@ -26,7 +26,7 @@ gpio_reset: gpio-reset {
> >  	compatible = "gpio-reset";
> >  	reset-gpios = <&gpio5 0 1>; /* active-low */
> >  	reset-delays = <10000>; /* 10 ms */
> > -	initially-in-reset: <1>;
> > +	initially-in-reset = <1>;
> >  	#reset-cells = <1>;
> >  };
> 
> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Disregard that, I think this fix belongs with the rest of the reset
series. I've added the patch on top of the branch at
git://git.pengutronix.de/git/pza/linux.git reset/for_v3.10
for Olof to pull.

regards
Philipp
