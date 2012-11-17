From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: Kirkwood: Convert IB62x0 to use gpio-poweroff.
Date: Sat, 17 Nov 2012 09:30:39 +0100
Message-ID: <20121117083039.GH24569@lunn.ch>
References: <1352821485-10032-1-git-send-email-andrew@lunn.ch>
 <1352821485-10032-4-git-send-email-andrew@lunn.ch>
 <20121116193250.GB25838@schnuecks.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121116193250.GB25838-2BA9cf72eNkOIzVOb1FTxg@public.gmane.org>
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
To: Simon Baatz <gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2012 at 08:32:50PM +0100, Simon Baatz wrote:
> Hi Andrew,
> 
> On Tue, Nov 13, 2012 at 04:44:45PM +0100, Andrew Lunn wrote:
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/kirkwood-ib62x0.dts |    6 ++++++
> >  arch/arm/mach-kirkwood/board-ib62x0.c |   13 -------------
> >  2 files changed, 6 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/kirkwood-ib62x0.dts b/arch/arm/boot/dts/kirkwood-ib62x0.dts
> > index 66794ed..9b0e2e3 100644
> > --- a/arch/arm/boot/dts/kirkwood-ib62x0.dts
> > +++ b/arch/arm/boot/dts/kirkwood-ib62x0.dts
> > @@ -79,4 +79,10 @@
> >  			gpios = <&gpio0 27 0>;
> >  		};
> >  	};
> > +	gpio_poweroff {
> > +		compatible = "gpio-poweroff";
> > +		gpios = <&gpio0 24 1>;
> 
> This needs to be:
> 		gpios = <&gpio0 24 0>;

I also got it wrong on Jamie's board!

> 
> If the GPIO is configured as an input, the box shuts down when
> initializing the driver.
> 
> With this change:
> 
> Tested-by: Simon Baatz <gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Btw., I also tested it on top of your pinctrl changes, which works
> like a charm as well.

Thanks for testing that.

       Andrew
