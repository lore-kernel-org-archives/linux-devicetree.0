From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 10/12] ARM: mvebu: Relocate Armada 370/XP DeviceBus
 device tree nodes
Date: Wed, 19 Jun 2013 14:03:20 +0200
Message-ID: <201306191403.20569.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306181816.26530.arnd@arndb.de> <20130618220929.GA24056@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130618220929.GA24056@localhost>
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
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 June 2013, Ezequiel Garcia wrote:
> On Tue, Jun 18, 2013 at 06:16:26PM +0200, Arnd Bergmann wrote:
> > On Tuesday 18 June 2013, Ezequiel Garcia wrote:
> > > 
> > > +               devbus-bootcs {
> > > +                       compatible = "marvell,mvebu-devbus";
> > > +                       reg = <0xffff0001 0x10400 0x8>;
> > > +                       ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <1>;
> > > +                       clocks = <&coreclk 0>;
> > > +                       status = "disabled";
> > > +               };
> > 
> > This is a violation of the binding as far as I can tell, since you don't specify ranges
> > to access the 0xffff0001 0x10400 address. However, as I explained in my comment for
> > the binding, I think you should clarify the binding and leave the implementation
> > as you have it here.
> > 
> 
> Mmm... again I got lost here. Which 'ranges' you say I don't specify to
> access the (formerly) 0xffff0001?
> 
> AFAIK, 'ranges' are only for children translation, which means I don't
> need to specify a ranges for that in the devbus node, but in its parent,
> right?
> 
> This ranges thing can be very tricky, so please correct me if I'm
> mistaken.

You already clarified that the binding was wrong. This was about the
part where you replied:

>> Do you really want to require the child to provide a "ranges" property?
>> I think this makes it more complicated to specify devices that belong
>> into the "internal-regs" category.
>> 
>
>No, this text is actually a left-over from the previous patchset, in
>current v3 patchset MBus children are not required to have any ranges.
>On the otherside, although you will need one except in the most trivial
>cases like for the BootROM.

With that change, everything above is ok.

	Arnd
