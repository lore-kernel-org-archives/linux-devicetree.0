From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v2 03/22] usb: ulpi: Support device discovery via device
 properties
Date: Fri, 05 Aug 2016 14:27:35 -0700
Message-ID: <147043245520.26915.14153612182716236022@sboyd-linaro>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-4-stephen.boyd@linaro.org>
 <20160708090458.GB20485@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160708090458.GB20485@shlinux2>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Peter Chen (2016-07-08 02:04:58)
> On Thu, Jul 07, 2016 at 03:20:54PM -0700, Stephen Boyd wrote:
> > @@ -39,6 +42,10 @@ static int ulpi_match(struct device *dev, struct device_driver *driver)
> >       struct ulpi *ulpi = to_ulpi_dev(dev);
> >       const struct ulpi_device_id *id;
> >  
> > +     /* Some ULPI devices don't have a product id so rely on OF match */
> > +     if (ulpi->id.product == 0)
> > +             return of_driver_match_device(dev, driver);
> > +
> 
> How about using vendor id? It can't be 0, but pid may be 0.
> See: http://www.linux-usb.org/usb.ids

Heikki suggested a product id of 0 would mean we need to use DT
matching. Should it be changed to vendor id instead?

> 
> > +static int ulpi_of_register(struct ulpi *ulpi)
> > +{
> > +     struct device_node *np = NULL, *child;
> > +
> > +     /* Find a ulpi bus underneath the parent or the parent of the parent */
> > +     if (ulpi->dev.parent->of_node)
> > +             np = of_find_node_by_name(ulpi->dev.parent->of_node, "ulpi");
> > +     else if (ulpi->dev.parent->parent && ulpi->dev.parent->parent->of_node)
> > +             np = of_find_node_by_name(ulpi->dev.parent->parent->of_node,
> > +                                       "ulpi");
> > +     if (!np)
> > +             return 0;
> > +
> > +     child = of_get_next_available_child(np, NULL);
> > +     if (!child)
> > +             return -EINVAL;
> 
> You may need to call of_node_put on parent (np), not on child node
> below.

Fixed, thanks.

> 
> > +
> > +     ulpi->dev.of_node = child;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ulpi_read_id(struct ulpi *ulpi)
> >  {
> >       int ret;
> >  
> > @@ -174,14 +218,39 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
> >       ulpi->id.product = ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
> >       ulpi->id.product |= ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
> >  
> > +     return 0;
> > +}
> > +
> 
> What does this API for? Why it still needs to be called after
> vid/pid gets from firmware?

Ideally we get the vid/pid from the ULPI registers instead of from
firmware. So we typically want to call ulpi_read_id() because most
likely the ulpi-vendor and ulpi-product properties are missing.
