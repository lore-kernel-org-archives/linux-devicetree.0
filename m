From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Wed, 13 Jun 2012 18:00:38 +0200
Message-ID: <201206131800.38622.marex@denx.de>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <4FD8AD42.6010702@gmail.com> <20120613152841.GA23590@richard-laptop>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120613152841.GA23590@richard-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

> On Wed, Jun 13, 2012 at 10:09:54AM -0500, Rob Herring wrote:
> > On 06/13/2012 07:34 AM, Richard Zhao wrote:
> > > Sometimes, boards have gpios that don't own by any driver or owner
> > > by a generic driver that don't like hacks. Such gpios is normally
> > > output and need setup once on boot. So I introduce the config-on-boot
> > > gpios.
> > > 
> > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > > ---
> > > 
> > >  .../devicetree/bindings/arm/config-on-boot.txt     |   12 +++++++
> > >  arch/arm/boot/dts/imx6q-sabrelite.dts              |    7 ++++
> > >  arch/arm/mach-imx/mach-imx6q.c                     |   35
> > >  ++++++++++++++++++++ 3 files changed, 54 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/arm/config-on-boot.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/config-on-boot.txt
> > > b/Documentation/devicetree/bindings/arm/config-on-boot.txt new file
> > > mode 100644
> > > index 0000000..f98ed74
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/config-on-boot.txt
> > > @@ -0,0 +1,12 @@
> > > +* Configure on Boot
> > > +
> > > +Node name: config-on-boot
> > > +  It must be in root node. config-on-boot means to describe settings
> > > that needs +  to be set one time on boot but aren't owned by any
> > > driver, or the owned driver +  is too generic to handle such settings.
> > > For example, usb hub uses generic +  driver in usb core code, a
> > > on-board usb may need deassert reset pin.
> > 
> > NAK. This is not a h/w description
> 
> It's misc things, but is hw description.
> 
> > and should be solved within the
> > kernel or bootloader. Either fix this in u-boot,
> 
> Kernel might be better not to depend on uboot.

And we don't want to polute uboot either, so this is a good move.

> > the platform code, or
> 
> How do I get gpio in platfrom code without dts description?

Write a driver that does the GPIO setup in some generic way? Wasn't there 
something about this stuff going on? Shawn, you had some comments /wrt the M28 
DTS. This might be what you meant?

> > make the generic driver support this in a generic way.
> 
> It's called just after populate devices. It's hard for generic driver to
> decide when it's called.
> 
> Thanks
> Richard

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
