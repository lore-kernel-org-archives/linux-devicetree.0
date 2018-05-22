From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 06/12] media: dt-bindings: add bindings for i.MX7
 media driver
Date: Tue, 22 May 2018 17:08:56 +0300
Message-ID: <20180522140855.6okv3cvc5uscp6hy@paasikivi.fi.intel.com>
References: <20180517125033.18050-1-rui.silva@linaro.org>
 <20180517125033.18050-7-rui.silva@linaro.org>
 <20180518065824.csio2fgwsxo2g2ow@valkosipuli.retiisi.org.uk>
 <m3tvr5xt9t.fsf@linaro.org>
 <20180518221346.fy4264hehvjjcd4y@kekkonen.localdomain>
 <m336yjvndy.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <m336yjvndy.fsf@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 02:19:21PM +0100, Rui Miguel Silva wrote:
> Hi Sakari,
> On Fri 18 May 2018 at 22:13, Sakari Ailus wrote:
> > On Fri, May 18, 2018 at 09:27:58AM +0100, Rui Miguel Silva wrote:
> > > > > +endpoint node
> > > > > +-------------
> > > > > +
> > > > > +- data-lanes    : (required) an array specifying active > >
> > > physical
> > > > > MIPI-CSI2
> > > > > +		    data input lanes and their mapping to > > logical lanes;
> > > the
> > > > > +		    array's content is unused, only its > > length is
> > > meaningful;
> > 
> > Btw. do note that you may get a warning due to this from the CSI-2 bus
> > property parsing code if the lane numbers are wrong.
> > 
> > > > > +
> > > > > +- fsl,csis-hs-settle : (optional) differential receiver > >
> > > (HS-RX)
> > > > > settle time;
> > > > > Could you calculate this, as other drivers do? It probably >
> > > changes
> > > > depending on the device runtime configuration.
> > > 
> > > The only reference to possible values to this parameter is given by
> > > table in [0], can you point me out the formula for imx7 in the
> > > documentation?
> > 
> > I don't know imx7 but the other CSI-2 drivers need no such system
> > specific
> > configuration.
> 
> Hum, I think there is at least one more (which this is compliant) that
> also use this configuration parameter. [0]

Ah, that's where it then probably comes from, if the two hardware blocks share 
some bits.

I guess it's fine to keep it if you think it's really necessary.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
