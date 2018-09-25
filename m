From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: firmware: coreboot: document board
 variant properties
Date: Tue, 25 Sep 2018 11:39:27 -0500
Message-ID: <20180925163927.GA23163@bogus>
References: <20180822120214.11848-1-heiko@sntech.de>
 <20180822120214.11848-2-heiko@sntech.de>
 <20180831121836.GA23441@bogus> <1660300.IG1gbB27SJ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1660300.IG1gbB27SJ@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 24, 2018 at 04:11:31PM +0200, Heiko Stuebner wrote:
> Hi Rob,
> 
> Am Freitag, 31. August 2018, 14:18:36 CEST schrieb Rob Herring:
> > On Wed, Aug 22, 2018 at 02:02:13PM +0200, Heiko Stuebner wrote:
> > > Since at least 2014 coreboot exports board specific variant ids for
> > > board-revision, used ram-modules and component variants on the same board
> > > into the loaded devicetree.
> > > 
> > > These are set on all devicetree-based Chromebooks since then, so at
> > > least we can make the effort to document these long-used properties.
> > 
> > Long used, but never reviewed, so that doesn't really matter.
> > 
> > > 
> > > A case where these are used is for example to determine the touchscreen
> > > type that is only identifyable via the sku-id when updating its firmware
> > > on the Scarlet tablet from the Gru ChromeOS family.
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/firmware/coreboot.txt | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
> > > index 4c955703cea8..cfc7623e2577 100644
> > > --- a/Documentation/devicetree/bindings/firmware/coreboot.txt
> > > +++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
> > > @@ -21,6 +21,12 @@ Required properties:
> > >  	0xc0389481 that resides in the topmost 8 bytes of the area.
> > >  	See coreboot's src/include/imd.h for details.
> > >  
> > > +Board variant properties determined via strapping measures (like gpios):
> > > + - board-id: board-specific id indicating the board-revision
> > > + - ram-code: board-specific id identifying the used ram-module
> > > + - sku-id: board-specific id indicating a variant (using different
> > > +           display panels for example)
> > 
> > The appear to be consumed by coreboot, but the purpose of the /firmware 
> > nodes has describing firmware interfaces provided by the platform. 
> > 
> > Not saying we can't put things to configure the firmware there, but it 
> > would be a departure and something we should consider. These properties 
> > aren't really coreboot specific and probably belong at the root node. 
> > Though I think we already discussed a 'board-id' property for QCom (and 
> > ended up with a compatible string approach instead.
> 
> These are not for configuring the firmware. Coreboot is reading the values
> from hardware-strappings, like special gpios and inserts the properties into
> the devicetree for the kernel or userspace to read back if needed.
> 
> So coreboot loads a devicetree without them from the boot-partition and
> amends that devicetree we these properties.
> 
> As indicated above, devices since 2014 do that, so I thought it might make
> sense to document that behaviour.

Reading strapping values and putting into DT seems like a perfectly 
reasonable thing to do (I'm assuming the pins get initialized to their 
function and reading them later is not possible), but that has nothing 
to do coreboot really. We don't put things u-boot touches under a u-boot 
node. These should go at the top-level IMO.

And maybe it is compelling to just take them having been in use for some 
time on widely deploying devices, but that's not really good precedence.

Rob
