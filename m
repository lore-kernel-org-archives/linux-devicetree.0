From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Thu, 13 Feb 2014 12:23:17 +0000
Message-ID: <20140213122317.GC5871@e106331-lin.cambridge.arm.com>
References: <1392220985-28189-1-git-send-email-lee.jones@linaro.org>
 <20140212164019.GE25957@e106331-lin.cambridge.arm.com>
 <20140213110314.GH32508@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140213110314.GH32508@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alexandre.torgue-qxv4g6HH51o@public.gmane.org" <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 13, 2014 at 11:03:14AM +0000, Lee Jones wrote:
> > > The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
> > > devices. It has 2 ports which it can use for either; both SATA, both
> > > PCIe or one of each in any configuration.
> > > 
> > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > Cc: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/phy/phy-miphy365x.txt      | 43 ++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > > new file mode 100644
> > > index 0000000..fdfa7ca
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > > @@ -0,0 +1,43 @@
> > > +STMicroelectronics STi MIPHY365x PHY binding
> > > +============================================
> > > +
> > > +This binding describes a miphy device that is used to control PHY hardware
> > > +for SATA and PCIe.
> > > +
> > > +Required properties:
> > > +- compatible: Should be "st,miphy365x-phy"
> > > +- #phy-cells: Should be 2 (See example)
> > 
> > The first example has #phy-cells = <1>.
> 
> Right, will fix. Should be 2.
> 
> > What do the cells mean? What are the expected values?
> 
> http://www.spinics.net/lists/arm-kernel/msg307209.html

Ok. Could that be mentioned in the binding document then?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
