From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Kirkwood: ehci-orion: Add device tree binding
Date: Wed, 17 Oct 2012 11:18:44 -0400
Message-ID: <20121017151844.GQ20922@titan.lakedaemon.net>
References: <1346491586-23480-1-git-send-email-andrew@lunn.ch>
 <CAOesGMh1x8QMNBi_xKEfZ0druiAZbafVuXEQkktwVbQODDmR8w@mail.gmail.com>
 <20120924071353.GA27099@lunn.ch>
 <20120926234941.GA6567@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120926234941.GA6567-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
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
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 26, 2012 at 04:49:41PM -0700, Olof Johansson wrote:
> On Mon, Sep 24, 2012 at 09:13:53AM +0200, Andrew Lunn wrote:
> > > > +Required properties:
> > > > +- compatible: must be "marvell,orion-ehci"
> > > > +- reg: physical base address of the controller and length of memory mapped
> > > > +  region.
> > > > +- interrupts: The EHCI interrupt
> > > > +- phy-version: Can be one of:
> > > > +  "NA" - Don't touch the phy, something else has already configured it.
> > > > +  "orion5x" - PHY setup as specified by the Orion5x Errata
> > > > +
> > > > +Example:
> > > > +
> > > > +       ehci@50000 {
> > > > +               compatible = "marvell,orion-ehci";
> > > > +               reg = <0x50000 0x1000>;
> > > > +               interrupts = <19>;
> > > > +               phy-version = "NA";
> > > > +       };
> > > 
> > > This isn't an appropriate binding for phy. I know, it maps straight
> > > over from the platform data, but it doesn't focus on what the actual
> > > hardware is.
> > > 
> > > A couple of options. What probably makes most sense depending on how
> > > other phy bindings are moving ahead is to add a phy node under the
> > > ehci controller for the "orion5x" case, and have an appropriate
> > > compatible value there. No node means the same as "NA" in the above
> > > binding. Alternatively, have a phy phandle that points to the phy
> > > device if it sits on an i2c bus, etc.
> > 
> > I Olaf
> > 
> > Could i suggest a third option:
> > 
> > I just drop USB phy configuration all together.  Only mach-orion5x
> > needs this and nobody has shown any interest in moving mach-orion5x to
> > DT. So i would just hard code it to "NA".
> > 
> > If anybody does show interest in DT for orion5x, we can add a phy node
> > under ehci as a pure extension which does not affect backward
> > compatibility.
> 
> Yeah, that works too.

Andrew,

Did I miss the update of this series/patch?

thx,

Jason.
