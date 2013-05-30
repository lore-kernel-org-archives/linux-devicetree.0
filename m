From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] [PATCH 2/3] of: add of_irq_count: Count the number of
 IRQs a node present
Date: Thu, 30 May 2013 12:25:53 +0200
Message-ID: <20130530102553.GB19834@game.jcrosoft.org>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
 <1369753729-12997-2-git-send-email-plagnioj@jcrosoft.com>
 <20130529223340.68EC13E16F4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130529223340.68EC13E16F4@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23:33 Wed 29 May     , Grant Likely wrote:
> On Tue, 28 May 2013 17:08:48 +0200, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> > Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/of/irq.c       |   15 +++++++++++++++
> >  include/linux/of_irq.h |    1 +
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index d1c5825..4426223 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -362,6 +362,21 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
> >  EXPORT_SYMBOL_GPL(of_irq_to_resource);
> >  
> >  /**
> > + * of_irq_count - Count the number of IRQs a node uses
> > + * @dev: pointer to device tree node
> > + */
> > +int of_irq_count(struct device_node *dev)
> 
> Following on from my comment on patch 1/3, How about "of_irq_count_entries()"?

yeah look much better

so I drop the patch 1/3
> 
> > +{
> > +	struct of_irq oirq;
> > +	int nr = 0;
> > +
> > +	while (!of_irq_map_one(dev, nr, &oirq))
> > +		nr++;
> 
> The concept is good, but this ends up being very inefficient. It would
> be better to take the relevant parts out of of_irq_map_one() to retrieve
> the value of #interrupt-cells and compare it to the size of the
> interrupts property.

ok

Best Regards,
J.
