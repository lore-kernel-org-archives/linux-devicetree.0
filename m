From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 15/24] serial: mpc512x: OF clock lookup, use the
 'mclk' name
Date: Wed, 17 Jul 2013 13:27:50 +0200
Message-ID: <20130717112750.GL7080@book.gsilab.sittig.org>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
 <1373924770-22599-1-git-send-email-gsi@denx.de>
 <20130715215423.GU14452@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130715215423.GU14452-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 23:54 +0200, Sascha Hauer wrote:
> 
> On Mon, Jul 15, 2013 at 11:46:01PM +0200, Gerhard Sittig wrote:
> > with device tree based clock lookup, the MCLK name no longer
> > depends on the PSC index
> > 
> > Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> > ---
> >  drivers/tty/serial/mpc52xx_uart.c |    8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
> > index 53c1093..221fb89 100644
> > --- a/drivers/tty/serial/mpc52xx_uart.c
> > +++ b/drivers/tty/serial/mpc52xx_uart.c
> > @@ -619,21 +619,17 @@ static irqreturn_t mpc512x_psc_handle_irq(struct uart_port *port)
> >  static int mpc512x_psc_clock(struct uart_port *port, int enable)
> >  {
> >  	struct clk *psc_clk;
> > -	int psc_num;
> > -	char clk_name[10];
> >  
> >  	if (uart_console(port))
> >  		return 0;
> >  
> > -	psc_num = (port->mapbase & 0xf00) >> 8;
> > -	snprintf(clk_name, sizeof(clk_name), "psc%d_mclk", psc_num);
> > -	psc_clk = clk_get(port->dev, clk_name);
> > +	psc_clk = clk_get(port->dev, "mclk");
> 
> Same comment applies here as Mark made to the spi driver.

So I'd like to respond in the same way as I did for the SPI
driver. :)

The scope of this series is the introduction of support for the
common clock framework.  Addressing other (legacy non-fatal and
previously accepted) issues as they get identified in bypassing
would be the scope of a separate patch or series.

I'm not questioning the need to fix other additionally identified
issues.  I'm just asking whether they shall be in the scope of
this very series.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
