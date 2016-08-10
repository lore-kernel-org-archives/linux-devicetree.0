From: Karl Beldan <kbeldan@baylibre.com>
Subject: Re: [PATCH 1/4] memory: ti-aemif: Get a named clock rather than an
 unnamed one
Date: Wed, 10 Aug 2016 07:27:44 +0000
Message-ID: <20160810072744.GA24903@gobelin>
References: <20160809171518.22690-1-kbeldan@baylibre.com>
 <20160809171518.22690-2-kbeldan@baylibre.com>
 <20160810070019.GA14114@gobelin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160810070019.GA14114@gobelin>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 07:00:20AM +0000, Karl Beldan wrote:
> On Tue, Aug 09, 2016 at 05:15:15PM +0000, Karl Beldan wrote:
> > Many davinci boards (da830 and da850 families) don't have their clocks
> > in DT yet and won't be successful in getting an unnamed aemif clock.
> > Also the sole current users of ti-aemif (keystone boards) use 'aemif' as
> > their aemif device clock clock-name and should remain unaffected.
> > 
> > Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> > ---
> >  drivers/memory/ti-aemif.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
> > index a579a0f..c251fc8 100644
> > --- a/drivers/memory/ti-aemif.c
> > +++ b/drivers/memory/ti-aemif.c
> > @@ -345,7 +345,7 @@ static int aemif_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, aemif);
> >  
> > -	aemif->clk = devm_clk_get(dev, NULL);
> > +	aemif->clk = devm_clk_get(dev, "aemif");
> 
> Looking further it seems to me that the struct clk_lookup da850_clks
> registered by davinci_clk_init() should be enough to clk_get() unnamed
> clocks using only the dev name. I look into what's going on but it
> would make this patch unnecessary.
>  
Ok, just saw what's happening, this patch is unnecessary, v2 will
follow.
 
Karl
